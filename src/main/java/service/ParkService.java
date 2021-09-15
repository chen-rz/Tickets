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
	public boolean parkReserved(int parkid, int num, int datediff) {
		ParkDAO dao = new ParkDAO();
		return dao.parkReservedDAO(parkid, num, datediff);
	}
	public boolean declareCovidRisk(int pkid) {
		ParkDAO dao = new ParkDAO();
		return dao.covidRiskDAO(pkid);
	}
}
