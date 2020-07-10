package kook;

import java.sql.Timestamp;

public class ClickRecommendDTO {

	private int num;
	private String userid;
	private String subject;
	private Timestamp reco_date;
	
	public void setNum(int num) {
		this.num = num;
	}
	public int getNum() {
		return num;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserid() {
		return userid;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSubject() {
		return subject;
	}
	public void setReco_date(Timestamp reco_date) {
		this.reco_date = reco_date;
	}
	public Timestamp getReco_Date() {
		return reco_date;
	}
}
