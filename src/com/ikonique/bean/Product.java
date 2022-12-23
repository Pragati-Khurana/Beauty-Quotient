package com.ikonique.bean;

import java.io.InputStream;

public class Product {
	private int product_id;
	private String product_name;
	private String product_price;
	private String product_quantity;
	private String product_weight;
	private int product_owner_id;
	private int offerid;
	private int category_id;
	private int subcategory_id;
	private String product_desc;
	private InputStream productpicStream;
	private String productpicString;
	private int status;
	
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(String product_quantity) {
		this.product_quantity = product_quantity;
	}
	public String getProduct_weight() {
		return product_weight;
	}
	public void setProduct_weight(String product_weight) {
		this.product_weight = product_weight;
	}
	public int getProduct_owner_id() {
		return product_owner_id;
	}
	public void setProduct_owner_id(int product_owner_id) {
		this.product_owner_id = product_owner_id;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public int getSubcategory_id() {
		return subcategory_id;
	}
	public void setSubcategory_id(int subcategory_id) {
		this.subcategory_id = subcategory_id;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public InputStream getProductpicStream() {
		return productpicStream;
	}
	public void setProductpicStream(InputStream productpicStream) {
		this.productpicStream = productpicStream;
	}
	public String getProductpicString() {
		return productpicString;
	}
	public void setProductpicString(String productpicString) {
		this.productpicString = productpicString;
	}
	public int getOfferid() {
		return offerid;
	}
	public void setOfferid(int offerid) {
		this.offerid = offerid;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
		
	
}
