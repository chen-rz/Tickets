package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import entity.User;
import service.LogRegService;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public LoginServlet() {
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
		User u=new User();
		try {
			u.setPhoneno(request.getParameter("phone_no"));
			String originalPwd = request.getParameter("password").toString();
			u.setPassword(sha256(originalPwd));
			boolean isOfficial=false;
			if(request.getParameter("is_official").equals("true")) isOfficial=true;
			u.setOfficial(isOfficial);
			
			LogRegService svc=new LogRegService();
			String loginRs = svc.login(u);
			
			System.out.println(loginRs);
			
			if(loginRs.equals("suc")) {
				request.getSession().setAttribute("user_info", svc.getUser(u));
				response.sendRedirect("welcome.jsp");
			}
			else {
				response.sendRedirect("login.jsp?loginfail="+loginRs);
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
