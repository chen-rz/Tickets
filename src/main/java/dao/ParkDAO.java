package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.Park;

public class ParkDAO {
	static final String JDBC_DRIVER="org.postgresql.Driver";
	static final String DB_URL="jdbc:postgresql://192.168.152.134:26000/software_course_design?ApplicationName=app1";
	static final String USER="chenrz";
	static final String PASS="jsnj130601*";
	
	public ArrayList<Park> parkSetDAO(){
		try{Class.forName(JDBC_DRIVER);}catch(ClassNotFoundException e){e.printStackTrace();}
		ArrayList<Park> rslt=new ArrayList<Park>();
		
		try{
			Connection conn=DriverManager.getConnection(DB_URL,USER,PASS);
			Statement statement=conn.createStatement();
			String sql="SELECT * FROM parks ORDER BY park_id ASC;";
			ResultSet rs=statement.executeQuery(sql);
			while(rs.next()){
				Park tmp=new Park();
				
				tmp.setPark_id(rs.getInt("park_id"));
				tmp.setPark_name(rs.getString("park_name"));
				tmp.setPrice(rs.getFloat("price"));
				tmp.setOpen_time(rs.getInt("open_time"));
				tmp.setClose_time(rs.getInt("close_time"));
				tmp.setPark_address(rs.getString("park_address"));
				tmp.setContact(rs.getString("contact"));
				tmp.setMax_num(rs.getInt("max_num"));
				tmp.setVisitor_0(rs.getInt("visitor_0"));
				tmp.setVisitor_1(rs.getInt("visitor_1"));
				tmp.setVisitor_2(rs.getInt("visitor_2"));
				tmp.setCovid_risk(rs.getBoolean("covid_risk"));
				tmp.setDescription(rs.getString("description"));
				
				rslt.add(tmp);
			}
			rs.close();
			statement.close();
			conn.close();
		}
		catch(SQLException e){e.printStackTrace();}
		
		return rslt;
	}
	
	public Park oneParkDAO(int id) {
		try{Class.forName(JDBC_DRIVER);}catch(ClassNotFoundException e){e.printStackTrace();}
		Park tmp=new Park();
		
		try{
			Connection conn=DriverManager.getConnection(DB_URL,USER,PASS);
			Statement statement=conn.createStatement();
			String sql="SELECT * FROM parks WHERE park_id="+id+";";
			ResultSet rs=statement.executeQuery(sql);
			while(rs.next()){
				tmp.setPark_id(rs.getInt("park_id"));
				tmp.setPark_name(rs.getString("park_name"));
				tmp.setPrice(rs.getFloat("price"));
				tmp.setOpen_time(rs.getInt("open_time"));
				tmp.setClose_time(rs.getInt("close_time"));
				tmp.setPark_address(rs.getString("park_address"));
				tmp.setContact(rs.getString("contact"));
				tmp.setMax_num(rs.getInt("max_num"));
				tmp.setVisitor_0(rs.getInt("visitor_0"));
				tmp.setVisitor_1(rs.getInt("visitor_1"));
				tmp.setVisitor_2(rs.getInt("visitor_2"));
				tmp.setCovid_risk(rs.getBoolean("covid_risk"));
				tmp.setDescription(rs.getString("description"));
			}
			rs.close();
			statement.close();
			conn.close();
		}
		catch(SQLException e){e.printStackTrace();}
		
		return tmp;
	}
	
	
	public boolean parkReservedDAO(int parkid, int num, int datediff) {
		try{Class.forName(JDBC_DRIVER);}catch(ClassNotFoundException e){e.printStackTrace();}
		
		int max_num=0, v=0;
		int isSuc = 0;
		
		try{
			Connection conn=DriverManager.getConnection(DB_URL,USER,PASS);
			Statement statement=conn.createStatement();
			String sql="SELECT max_num,visitor_"+datediff+" FROM parks WHERE park_id="+parkid+";";
			ResultSet rs=statement.executeQuery(sql);
			while(rs.next()){
				max_num = rs.getInt("max_num");
				v = rs.getInt("visitor_"+datediff);
			}
			rs.close();
			statement.close();
			conn.close();
		}
		catch(SQLException e){e.printStackTrace();}
		
		if(v+num > max_num) {
			return false;
		}else {
			try{
				Connection conn=DriverManager.getConnection(DB_URL,USER,PASS);
				Statement statement=conn.createStatement();
				String sql="UPDATE parks SET visitor_"+datediff+" ="+(v+num)+" where park_id="+parkid+";";
				isSuc = statement.executeUpdate(sql);
				statement.close();
				conn.close();
			}
			catch(SQLException e){e.printStackTrace();}
		}
		
		if(isSuc == 0) return false;
		else return true;
	}
	
	public boolean covidRiskDAO(int pkid) {
		try{Class.forName(JDBC_DRIVER);}catch(ClassNotFoundException e){e.printStackTrace();}
		
		int isSuc = 0;
		
		try{
			Connection conn=DriverManager.getConnection(DB_URL,USER,PASS);
			Statement statement=conn.createStatement();
			String sql="UPDATE parks SET covid_risk=true where park_id="+pkid+";";
			isSuc = statement.executeUpdate(sql);
			statement.close();
			conn.close();
		}
		catch(SQLException e){e.printStackTrace();}
		
		if(isSuc == 0) return false;
		else return true;
	}
}
