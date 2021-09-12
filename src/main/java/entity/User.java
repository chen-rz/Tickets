package entity;

public class User {
	private String phoneno;
	private String user_name;
	private String password;
	private boolean isOfficial;
	
	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isOfficial() {
		return isOfficial;
	}

	public void setOfficial(boolean isOfficial) {
		this.isOfficial = isOfficial;
	}

	public void printInfo() {
		System.out.println("User Entity");
		System.out.println("Username: "+user_name);
		System.out.println("Phone No.: "+phoneno);
		System.out.println("Password: "+password);
		System.out.println("Is official? "+isOfficial);
	}
}
