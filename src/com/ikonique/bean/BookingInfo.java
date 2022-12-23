package com.ikonique.bean;

import java.sql.Date;

public class BookingInfo {
	private int bookingid;
	private int bookinginfoid;
	private String bookingfname;
	private String bookinglname;
	private String bookingaddress;
	private String bookingcno;
	private Date bookingdate;
	private String bookingemail;
	public int getBookinginfoid() {
		return bookinginfoid;
	}
	public void setBookinginfoid(int bookinginfoid) {
		this.bookinginfoid = bookinginfoid;
	}
	public String getBookingfname() {
		return bookingfname;
	}
	public void setBookingfname(String bookingfname) {
		this.bookingfname = bookingfname;
	}
	public String getBookinglname() {
		return bookinglname;
	}
	public void setBookinglname(String bookinglname) {
		this.bookinglname = bookinglname;
	}
	public String getBookingaddress() {
		return bookingaddress;
	}
	public void setBookingaddress(String bookingaddress) {
		this.bookingaddress = bookingaddress;
	}
	public String getBookingcno() {
		return bookingcno;
	}
	public void setBookingcno(String bookingcno) {
		this.bookingcno = bookingcno;
	}
	public Date getBookingdate() {
		return bookingdate;
	}
	public void setBookingdate(Date bookingdate) {
		this.bookingdate = bookingdate;
	}
	public String getBookingemail() {
		return bookingemail;
	}
	public void setBookingemail(String bookingemail) {
		this.bookingemail = bookingemail;
	}
	public int getBookingid() {
		return bookingid;
	}
	public void setBookingid(int bookingid) {
		this.bookingid = bookingid;
	}
	
}
