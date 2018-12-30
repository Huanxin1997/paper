package com.bean;

public class Super{
	
	private String idnum;
	private String password;
	private String name;
	public String getIdnum() {
		return idnum;
	}
	public void setIdnum(String idnum) {
		this.idnum = idnum;
	}
	public String getPassword() {
		return password;
	}
	public String setPassword(String password) {
		return this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Super [idnum=" + idnum + ", password=" + password + ", name=" + name + "]";
	}
	public Super(String idnum, String password, String name) {
		super();
		this.idnum = idnum;
		this.password = password;
		this.name = name;
	}
	public Super() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
