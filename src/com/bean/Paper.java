package com.bean;

import java.util.Map;

public class Paper {
	private String serial;
	private String idnum;
	private String author;
	private String file;
	private String title;
	private String teacher;
	private String subject;
	private String repetition_rate;
	private int score;
	public Paper() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Paper(String serial,String idnum, String author, String file, String title, String teacher,String repetition_rate,
			int score,String subject) {
		super();
		this.serial = serial;
		this.idnum = idnum;
		this.author = author;
		this.file = file;
		this.title = title;
		this.teacher = teacher;
		this.repetition_rate = repetition_rate;
		this.score = score;
		this.subject = subject;
	}
	public String getIdnum() {
		return idnum;
	}
	public void setIdnum(String idnum) {
		this.idnum = idnum;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getRepetition_rate() {
		return repetition_rate;
	}
	public void setRepetition_rate(String repetition_rate) {
		this.repetition_rate = repetition_rate;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getSerial() {
		return serial;
	}
	public void setSerial(String serial) {
		this.serial = serial;
	}
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Paper(Map<String, Object> map){
		this.serial = (String)map.get("serial");
		this.idnum = (String)map.get("idnum");
		this.author = (String)map.get("author");
		this.file = (String)map.get("file");
		this.title = (String)map.get("title");
		this.teacher = (String)map.get("teacher");
		this.subject = (String)map.get("subject");
		this.score = (int)map.get("score");
		this.repetition_rate = (String)map.get("repetition_rate");
	}
}
