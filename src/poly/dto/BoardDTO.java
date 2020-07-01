package poly.dto;

public class BoardDTO {

	private String title;
	private String content;
	private String reg_date;
	private String seq;
	
	private String userSeq;
	private String user_name;
	private String read_cnt;
	private String starCheck;
	private String BOARD_SEQ;
	
	private int startIndex;
	private int endIndex;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getRead_cnt() {
		return read_cnt;
	}
	public void setRead_cnt(String read_cnt) {
		this.read_cnt = read_cnt;
	}
	public String getStarCheck() {
		return starCheck;
	}
	public void setStarCheck(String starCheck) {
		this.starCheck = starCheck;
	}
	
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	public String getBOARD_SEQ() {
		return BOARD_SEQ;
	}
	public void setBOARD_SEQ(String bOARD_SEQ) {
		BOARD_SEQ = bOARD_SEQ;
	}
	


	
	
	
}
