package controller;

import entity.User;
import service.LogRegService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public String sha256(String origin) {
		String hash="";
		try {
			hash = DigestUtils.sha256Hex(origin.getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hash;
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String pwd = request.getParameter("password").toString();
		String pwd_cfm = request.getParameter("password_confirm").toString();
		if(! pwd.equals(pwd_cfm)) {
			response.sendRedirect("register.jsp?failure=psw_cfm_err");
			return;
		}
		
		User u=new User();
		try {
			u.setPhoneno(request.getParameter("phone_no"));
			u.setUser_name(request.getParameter("user_name"));
			
			String originalPwd = request.getParameter("password").toString();
			u.setPassword(sha256(originalPwd));
			
			boolean isOfficial = false;
			if(request.getParameter("is_official").equals("true"))
				isOfficial = true;
			u.setOfficial(isOfficial);
			
			LogRegService svc=new LogRegService();
			
			boolean regRslt = svc.register(u);
			if(regRslt) {
				response.sendRedirect("register.jsp?failure=no_failure");
			}
			else {
				response.sendRedirect("register.jsp?failure=reg_err");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	public void init() throws ServletException {
		
	}

}
