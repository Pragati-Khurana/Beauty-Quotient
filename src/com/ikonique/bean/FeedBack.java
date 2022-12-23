package com.ikonique.bean;

import java.util.Date;

public class FeedBack {
	private int feedbackid;
	private int productid;
	private int userid;
	private String feedbackdesc;
	private Date feedbackdate;
	
	public int getFeedbackid() {
		return feedbackid;
	}
	public void setFeedbackid(int feedbackid) {
		this.feedbackid = feedbackid;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getFeedbackdesc() {
		return feedbackdesc;
	}
	public void setFeedbackdesc(String feedbackdesc) {
		this.feedbackdesc = feedbackdesc;
	}
	public Date getFeedbackdate() {
		return feedbackdate;
	}
	public void setFeedbackdate(Date feedbackdate) {
		this.feedbackdate = feedbackdate;
	}
	
	
}
