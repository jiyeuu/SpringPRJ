package poly.dto;

public class BoardDTO {

	private String title;
	private String content;
	private String regDate;
	private String seq;
	
	private String userSeq;
	private String user_name;
	private String read_cnt;
	private String board_satisfy;
	
	private int startIndex;
	private int endIndex;
	
	private String starCheck;
	
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
	public String getBoard_satisfy() {
		return board_satisfy;
	}
	public void setBoard_satisfy(String board_satisfy) {
		this.board_satisfy = board_satisfy;
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
	public String getStarCheck() {
		return starCheck;
	}
	public void setStarCheck(String starCheck) {
		this.starCheck = starCheck;
	}
	
	
	
}
