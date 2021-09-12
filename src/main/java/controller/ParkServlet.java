package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Park;
import service.ParkService;

public class ParkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ParkServlet() {
		super();
	}
	public void destroy() {
		super.destroy();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int park_id = Integer.parseInt(request.getParameter("park_id"));
		response.sendRedirect("detail.jsp?park_id="+park_id);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	public void init() throws ServletException {
		
	}

}
