package poly.dto;

public class UserInfoDTO {
	
	private String user_id;
	private String user_name;
	private String password;
	private String email;
	private String reg_id;
	private String reg_dt;
	private String chg_id;
	private String chg_dt;
	private String user_author;
	
	private String exists_yn;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getChg_id() {
		return chg_id;
	}

	public void setChg_id(String chg_id) {
		this.chg_id = chg_id;
	}

	public String getChg_dt() {
		return chg_dt;
	}

	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}

	public String getUser_author() {
		return user_author;
	}

	public void setUser_author(String user_author) {
		this.user_author = user_author;
	}

	public String getExists_yn() {
		return exists_yn;
	}

	public void setExists_yn(String exists_yn) {
		this.exists_yn = exists_yn;
	}

	
}
