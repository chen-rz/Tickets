package entity;

public class Park {
	private int park_id;
	private String park_name;
	private float price;
	private int open_time;
	private int close_time;
	private String park_address;
	private String contact;
	private int max_num;
	private int visitor_0;
	private int visitor_1;
	private int visitor_2;
	private boolean covid_risk;
	private String description;
	
	public int getPark_id() {
		return park_id;
	}
	public void setPark_id(int park_id) {
		this.park_id = park_id;
	}
	public String getPark_name() {
		return park_name;
	}
	public void setPark_name(String park_name) {
		this.park_name = park_name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getOpen_time() {
		return open_time;
	}
	public void setOpen_time(int open_time) {
		this.open_time = open_time;
	}
	public int getClose_time() {
		return close_time;
	}
	public void setClose_time(int close_time) {
		this.close_time = close_time;
	}
	public String getPark_address() {
		return park_address;
	}
	public void setPark_address(String park_address) {
		this.park_address = park_address;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public int getMax_num() {
		return max_num;
	}
	public void setMax_num(int max_num) {
		this.max_num = max_num;
	}
	public int getVisitor_0() {
		return visitor_0;
	}
	public void setVisitor_0(int visitor_0) {
		this.visitor_0 = visitor_0;
	}
	public int getVisitor_1() {
		return visitor_1;
	}
	public void setVisitor_1(int visitor_1) {
		this.visitor_1 = visitor_1;
	}
	public int getVisitor_2() {
		return visitor_2;
	}
	public void setVisitor_2(int visitor_2) {
		this.visitor_2 = visitor_2;
	}
	public boolean isCovid_risk() {
		return covid_risk;
	}
	public void setCovid_risk(boolean covid_risk) {
		this.covid_risk = covid_risk;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
