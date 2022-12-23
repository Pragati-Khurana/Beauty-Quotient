package com.ikonique.bean;

import java.util.Date;

public class Wishlist {
	
	private int wishlistid;
	private int productid;
	private int userid;
	private Date currentdate;
	
	public int getWishlistid() {
		return wishlistid;
	}
	public void setWishlistid(int wishlistid) {
		this.wishlistid = wishlistid;
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
