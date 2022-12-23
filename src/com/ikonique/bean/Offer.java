package com.ikonique.bean;

public class Offer {

	private int offerid;
	private String offername;
	private int validoffer;
	private double discount;
	
	public String getOffername() {
		return offername;
	}
	public void setOffername(String offername) {
		this.offername = offername;
	}
	public int getValidoffer() {
		return validoffer;
	}
	public void setValidoffer(int validoffer) {
		this.validoffer = validoffer;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	
	public int getOfferid() {
		return offerid;
	}
	public void setOfferid(int offerid) {
		this.offerid = offerid;
	}

}
