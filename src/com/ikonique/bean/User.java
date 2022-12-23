package com.ikonique.bean;

import java.io.InputStream;

import com.mysql.cj.jdbc.Blob;

public class User {

	private int user_id;
	private int role_id;
	private int status;
	private String firstname;
	private String lastname;
	private String address;
	private String mobileno;
	private String gender;
	private String email;
	private String password;
	private String visitingfees;
	private String designation;
	private String aboutme;
	private int area_id;
	private InputStream UserProfilepicStream;
	private String UserProfilepicString;
	
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getVisitingfees() {
		return visitingfees;
	}
	public void setVisitingfees(String visitingfees) {
		this.visitingfees = visitingfees;
	}
	public int getArea_id() {
		return area_id;
	}
	public void setArea_id(int area_id) {
		this.area_id = area_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public InputStream getUserProfilepicStream() {
		return UserProfilepicStream;
	}
	public void setUserProfilepicStream(InputStream userProfilepicStream) {
		UserProfilepicStream = userProfilepicStream;
	}
	public String getUserProfilepicString() {
		return UserProfilepicString;
	}
	public void setUserProfilepicString(String userProfilepicString) {
		UserProfilepicString = userProfilepicString;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getAboutme() {
		return aboutme;
	}
	public void setAboutme(String aboutme) {
		this.aboutme = aboutme;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
