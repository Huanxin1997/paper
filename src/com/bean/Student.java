package com.bean;

import java.util.Map;

public class Student {

	/**
	 * 
	 */
	private int id;
	private String name;
	private String sclass;
	private String gender;
	private String phone;
	private String address;
	private String password;
	private String subject;
	private String teacher;
	public String getSclass() {
		return sclass;
	}


	public void setSclass(String sclass) {
		this.sclass = sclass;
	}


	public String getIdnum() {
		return idnum;
	}


	public void setIdnum(String idnum) {
		this.idnum = idnum;
	}

	private String idnum;
	
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword(){
		return password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}

	
	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getTeacher() {
		return teacher;
	}


	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}


	public Student(int id, String name, String sclass, String gender, String phone, String address, String idnum,String password,String subject,String teacher) {
		super();
		this.id = id;
		this.name = name;
		this.sclass = sclass;
		this.gender = gender;
		this.phone = phone;
		this.address = address;
		this.idnum = idnum;
		this.password = password;
		this.subject = subject;
		this.teacher = teacher;
	}
	
	public Student(Map<String, Object> map){
		this.id = (int)map.get("id");
		this.idnum = (String)map.get("idnum");
		this.name = (String)map.get("name");
		this.gender = (String)map.get("gender");
		this.sclass = (String)map.get("sclass");
		this.phone = (String)map.get("phone");
		this.address = (String)map.get("address");
		this.password = (String)map.get("password");
		this.subject = (String)map.get("subject");
		this.teacher = (String)map.get("teacher");
	}
	
	
}
