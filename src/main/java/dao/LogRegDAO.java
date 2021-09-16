package dao;

import java.sql.*;
import entity.User;

public class LogRegDAO {
	static final String JDBC_DRIVER="org.postgresql.Driver";
	static final String DB_URL="jdbc:postgresql://123.60.82.11:26000/software_course_design?ApplicationName=app1";
	static final String USER="chenrz";
	static final String PASS="jsnj130601*";
	
	public User loginDAO(User totest){
		try{Class.forName(JDBC_DRIVER);}
		catch(ClassNotFoundException e){e.printStackTrace();}
		
		boolean ifempty=true;
		User rslt=new User();
		
		try{
			Connection conn=DriverManager.getConnection(DB_URL,USER,PASS);
			Statement statement=conn.createStatement();
			String sql="SELECT * FROM register WHERE phone_no='"+totest.getPhoneno()+"';";
			ResultSet rs=statement.executeQuery(sql);
			while(rs.next()){
				ifempty=false;
				rslt.setUser_name(rs.getString("user_name"));
				rslt.setPassword(rs.getString("password"));
				rslt.setOfficial(rs.getBoolean("is_official"));
			}
			rs.close();
			statement.close();
			conn.close();
		}
		catch(SQLException e){e.printStackTrace();}
		
		if(ifempty==true) return null;
		else {
			rslt.setPhoneno(totest.getPhoneno());
			
			System.out.print("Login DAO: "); rslt.printInfo();
			
			return rslt;
		}
	}
	
	public boolean registerDAO(User u) {
		try{Class.forName(JDBC_DRIVER);}
		catch(ClassNotFoundException e){e.printStackTrace();}
		
		boolean rslt=false;
		
		try{
			Connection conn=DriverManager.getConnection(DB_URL,USER,PASS);
			Statement statement=conn.createStatement();
			String sql="INSERT INTO register VALUES( '"+u.getUser_name()+"' , '"+u.getPhoneno()+"' , '"+u.getPassword()+"' ,"+u.isOfficial()+");";
			int rsint = statement.executeUpdate(sql);
			if(rsint!=0) rslt=true;
			statement.close();
			conn.close();
		}
		catch(SQLException e){e.printStackTrace();}
		
		System.out.println("Register DAO: "+rslt);
		
		return rslt;
	}
	
	public LogRegDAO(){
		
	}
}
