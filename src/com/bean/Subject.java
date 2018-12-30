package com.bean;

import java.util.Map;

public class Subject {
	
	private String teacherName;
	private int studentNum;
	private String name;
	private String limit;
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public int getStudentNum() {
		return studentNum;
	}
	public void setStudentNum(int studentNum) {
		this.studentNum = studentNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	public Subject(String teacherName, int studentNum, String name, String limit) {
		super();
		this.teacherName = teacherName;
		this.studentNum = studentNum;
		this.name = name;
		this.limit = limit;
	}
	public Subject() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Subject [teacherName=" + teacherName + ", studentNum=" + studentNum + ", name=" + name + ", limit="
				+ limit + "]";
	}
	
	public Subject(Map<String, Object> map){
		this.limit = (String)map.get("limit");
		this.teacherName = (String)map.get("teacherName");
		this.name = (String)map.get("name");
		this.studentNum = (int)map.get("studentNum");
	}
}
