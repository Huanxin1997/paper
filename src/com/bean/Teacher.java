package com.bean;

import java.util.Map;

public class Teacher {
	 
	private String idnum;
	private String name;
	private String password;
	private int subjectNum;
	private int studentNum;
	
	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Teacher(String idnum, String name, String password, int subjectNum, int studentNum) {
		super();
		this.idnum = idnum;
		this.name = name;
		this.password = password;
		this.subjectNum = subjectNum;
		this.studentNum = studentNum;
	}

	@Override
	public String toString() {
		return "Teacher [idnum=" + idnum + ", name=" + name + ", password=" + password + ", subjectNum=" + subjectNum
				+ ", studentNum=" + studentNum + "]";
	}

	public String getIdnum() {
		return idnum;
	}

	public void setIdnum(String idnum) {
		this.idnum = idnum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getSubjectNum() {
		return subjectNum;
	}

	public void setSubjectNum(int subjectNum) {
		this.subjectNum = subjectNum;
	}

	public int getStudentNum() {
		return studentNum;
	}

	public void setStudentNum(int studentNum) {
		this.studentNum = studentNum;
	}
	
	public Teacher(Map<String, Object> map){
		this.idnum = (String)map.get("idnum");
		this.name = (String)map.get("name");
		this.password = (String)map.get("password");
		this.subjectNum = (int)map.get("subjectNum");
		this.studentNum = (int)map.get("studentNum");
	}
}
