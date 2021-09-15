package service;

import java.util.ArrayList;

import dao.ReservationDAO;
import entity.Reservation;

public class ReserveService {
	public boolean newReservation(Reservation r) {
		ReservationDAO rdao=new ReservationDAO();
		return rdao.reserveDAO(r);
	}
	
	public int getNextIdno() {
		ReservationDAO rdao=new ReservationDAO();
		return rdao.nextIdnoDAO();
	}
	
	public ArrayList<Reservation> getReservationSet(String userphoneno){
		ReservationDAO rdao=new ReservationDAO();
		return rdao.resvSetDAO(userphoneno);
	}
}
