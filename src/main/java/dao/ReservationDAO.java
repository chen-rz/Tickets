package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.Reservation;

public class ReservationDAO {
	static final String JDBC_DRIVER="org.postgresql.Driver";
	static final String DB_URL="jdbc:postgresql://127.0.0.1:5432/software_course_design";
	static final String USER="chenrz";
	static final String PASS="jsnj130601*";
	
	public boolean reserveDAO(Reservation r){
		try{Class.forName(JDBC_DRIVER);}catch(ClassNotFoundException e){e.printStackTrace();}
		boolean rslt = false;
		
		try{
			Connection conn=DriverManager.getConnection(DB_URL,USER,PASS);
			Statement statement=conn.createStatement();
			String sql="INSERT INTO reservations VALUES("
						+r.getReserve_id()+","
						+"'"+r.getUser_phoneno()+"',"
						+"'"+r.getSchedule()+"',"
						+"'"+r.getTourist_phoneno()+"',"
						+r.getMember_num()+","
						+"'"+r.getTourist_name()+"',"
						+"'"+r.getTourist_idcard()+"',"
						+"'"+r.getWhere_from()+"',"
						+r.isHealthy()+","
						+r.isPayed()+","
						+"'"+r.getTime_stamp()+"',"
						+"'"+r.getId_cipher()+"',"
						+"'"+r.getPark_selected()+"'"+");";
			int rsInt=statement.executeUpdate(sql);
			if(rsInt!=0) rslt=true;
			statement.close();
			conn.close();
		}
		catch(SQLException e){e.printStackTrace();}
		
		return rslt;
	}
	
	public int nextIdnoDAO() {
		int idno = 0;
		
		try{Class.forName(JDBC_DRIVER);}catch(ClassNotFoundException e){e.printStackTrace();}
		
		try{
			Connection conn=DriverManager.getConnection(DB_URL,USER,PASS);
			Statement statement=conn.createStatement();
			String sql="SELECT * FROM reservations ORDER BY reserve_id DESC;";
			ResultSet rs=statement.executeQuery(sql);
			if(rs.next()) {
				idno = rs.getInt("reserve_id") + 1;
			}
			rs.close();
			statement.close();
			conn.close();
		}
		catch(SQLException e){e.printStackTrace();}
		
		return idno;
	}
	
	public ArrayList<Reservation> resvSetDAO(String usrphoneno){
		try{Class.forName(JDBC_DRIVER);}catch(ClassNotFoundException e){e.printStackTrace();}
		ArrayList<Reservation> rslt=new ArrayList<Reservation>();
		
		try{
			Connection conn=DriverManager.getConnection(DB_URL,USER,PASS);
			Statement statement=conn.createStatement();
			String sql="SELECT * FROM reservations WHERE user_phoneno='"+usrphoneno+"' ORDER BY reserve_id DESC;";
			ResultSet rs=statement.executeQuery(sql);
			while(rs.next()){
				Reservation tmp=new Reservation();
				
				tmp.setHealthy(rs.getBoolean("is_healthy"));
				tmp.setMember_num(rs.getInt("member_num"));
				tmp.setPark_selected(rs.getString("park_selected"));
				tmp.setPayed(rs.getBoolean("is_payed"));
				tmp.setReserve_id(rs.getInt("reserve_id"));
				tmp.setSchedule(rs.getString("schedule"));
				tmp.setTime_stamp(rs.getString("time_stamp"));
				tmp.setTourist_idcard(rs.getString("tourist_idcard"));
				tmp.setTourist_name(rs.getString("tourist_name"));
				tmp.setTourist_phoneno(rs.getString("tourist_phoneno"));
				tmp.setUser_phoneno(rs.getString("user_phoneno"));
				tmp.setWhere_from(rs.getString("where_from"));
				tmp.setId_cipher(rs.getString("id_cipher"));
				
				rslt.add(tmp);
			}
			rs.close();
			statement.close();
			conn.close();
		}
		catch(SQLException e){e.printStackTrace();}
		
		return rslt;
	}
}
