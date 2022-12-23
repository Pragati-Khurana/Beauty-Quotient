package com.ikonique.bean;

import java.util.Date;

public class Cart {
	private int cartid;
	private int productid;
	private int userid;
	private Date currentdate;
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
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
	public Date getCurrentdate() {
		return currentdate;
	}
	public void setCurrentdate(Date currentdate) {
		this.currentdate = currentdate;
	}
	
}
