package com.xhu.entity;

import java.util.Date;

public class ExamInfor {
	private int id;
	private String examName;
	private Date examTime;
	private String paperName;
	private int status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public Date getExamTime() {
		return examTime;
	}
	public void setExamTime(Date examTime) {
		this.examTime = examTime;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public ExamInfor() {
		super();
	}
	@Override
	public String toString() {
		return "ExamInfor [id=" + id + ", examName=" + examName + ", examTime=" + examTime + ", paperName=" + paperName
				+ ", status=" + status + "]";
	}
	
}
