package service;

import entity.User;

import java.io.IOException;

import dao.LogRegDAO;

public class LogRegService {
	public String login(User u) throws IOException {
		System.out.print("Login service requested: ");
		u.printInfo();
		
		LogRegDAO dao = new LogRegDAO();
		User rslt = dao.loginDAO(u);
		if(rslt==null) return "phoneno_err";
		if(! rslt.getPassword().equals(u.getPassword()) ) return "password_err";
		if(rslt.isOfficial()!=u.isOfficial()) return "isofficial_err";
		return "suc";
	}
	
	public User getUser(User u) throws IOException {
		LogRegDAO dao = new LogRegDAO();
		User rslt = dao.loginDAO(u);
		return rslt;
	}
	
	public boolean register(User u) throws IOException {
		System.out.print("Register service requested: ");
		u.printInfo();
		
		LogRegDAO dao = new LogRegDAO();
		return dao.registerDAO(u);
	}
}
