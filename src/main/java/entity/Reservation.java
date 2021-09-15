package entity;

public class Reservation {
	private int reserve_id;
	private String user_phoneno;
	private String park_selected;
	private String schedule;
	private String tourist_phoneno;
	private int member_num;
	private String tourist_name;
	private String tourist_idcard;
	private String where_from;
	private boolean isHealthy;
	private boolean isPayed;
	private String time_stamp;
	private String id_cipher;
	public int getReserve_id() {
		return reserve_id;
	}
	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}
	public String getUser_phoneno() {
		return user_phoneno;
	}
	public void setUser_phoneno(String user_phoneno) {
		this.user_phoneno = user_phoneno;
	}
	public String getPark_selected() {
		return park_selected;
	}
	public void setPark_selected(String park_selected) {
		this.park_selected = park_selected;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	public String getTourist_phoneno() {
		return tourist_phoneno;
	}
	public void setTourist_phoneno(String tourist_phoneno) {
		this.tourist_phoneno = tourist_phoneno;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getTourist_name() {
		return tourist_name;
	}
	public void setTourist_name(String tourist_name) {
		this.tourist_name = tourist_name;
	}
	public String getTourist_idcard() {
		return tourist_idcard;
	}
	public void setTourist_idcard(String tourist_idcard) {
		this.tourist_idcard = tourist_idcard;
	}
	public String getWhere_from() {
		return where_from;
	}
	public void setWhere_from(String where_from) {
		this.where_from = where_from;
	}
	public boolean isHealthy() {
		return isHealthy;
	}
	public void setHealthy(boolean isHealthy) {
		this.isHealthy = isHealthy;
	}
	public boolean isPayed() {
		return isPayed;
	}
	public void setPayed(boolean isPayed) {
		this.isPayed = isPayed;
	}
	public String getTime_stamp() {
		return time_stamp;
	}
	public void setTime_stamp(String time_stamp) {
		this.time_stamp = time_stamp;
	}
	public String getId_cipher() {
		return id_cipher;
	}
	public void setId_cipher(String id_cipher) {
		this.id_cipher = id_cipher;
	}
	
	
}
