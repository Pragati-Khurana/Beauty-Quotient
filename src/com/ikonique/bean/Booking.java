package com.ikonique.bean;

import java.sql.Date;

public class Booking {
	private int bookingid;
	private int designerid;
	private Date bookingdate;
	private int vfees;
	private String paymentstatus;
	private String bookingstatus;
	private int userid;
	public int getBookingid() {
		return bookingid;
	}
	public void setBookingid(int bookingid) {
		this.bookingid = bookingid;
	}
	public int getDesignerid() {
		return designerid;
	}
	public void setDesignerid(int designerid) {
		this.designerid = designerid;
	}
	public Date getBookingdate() {
		return bookingdate;
	}
	public void setBookingdate(Date bookingdate) {
		this.bookingdate = bookingdate;
	}
	public int getVfees() {
		return vfees;
	}
	public void setVfees(int vfees) {
		this.vfees = vfees;
	}
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getBookingstatus() {
		return bookingstatus;
	}
	public void setBookingstatus(String bookingstatus) {
		this.bookingstatus = bookingstatus;
	}
	public String getPaymentstatus() {
		return paymentstatus;
	}
	public void setPaymentstatus(String paymentstatus) {
		this.paymentstatus = paymentstatus;
	}
	
}
