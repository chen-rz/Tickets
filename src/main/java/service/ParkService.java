package service;

import java.util.ArrayList;

import dao.ParkDAO;
import entity.Park;

public class ParkService {
	public ArrayList<Park> getParkSet(){
		ParkDAO dao = new ParkDAO();
		ArrayList<Park> rslt = dao.parkSetDAO();
		return rslt;
	}
	public Park selectOnePark(int id) {
		ParkDAO dao = new ParkDAO();
		return dao.oneParkDAO(id);
	}
}
