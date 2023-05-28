package com.xhu.entity;

import java.util.Date;

public class Texam extends Page {
	private Integer id;

	private String examName;

	private String examTime;

	private Integer examStatu;

	private Double examScore;

	private Integer paperId;
	private String stuId;
	private Paper pa;
	private Student stu;

	public String getExam_name() {
		return exam_name;
	}

	public void setExam_name(String exam_name) {
		this.exam_name = exam_name;
	}

	public int getExam_statu() {
		return exam_statu;
	}

	public void setExam_statu(int exam_statu) {
		this.exam_statu = exam_statu;
	}

	public int getExam_score() {
		return exam_score;
	}

	public void setExam_score(int exam_score) {
		this.exam_score = exam_score;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public int getPaper_id() {
		return paper_id;
	}

	public void setPaper_id(int paper_id) {
		this.paper_id = paper_id;
	}

	private String exam_name;
	private int exam_statu;
	private int exam_score;
	private String stu_id;
	private int paper_id;
	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	public Paper getPa() {
		return pa;
	}

	public void setPa(Paper pa) {
		this.pa = pa;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public String getExamTime() {
		return examTime;
	}

	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}

	public Integer getExamStatu() {
		return examStatu;
	}

	public void setExamStatu(Integer examStatu) {
		this.examStatu = examStatu;
	}

	public Integer getPaperId() {
		return paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public Double getExamScore() {
		return examScore;
	}

	public void setExamScore(Double examScore) {
		this.examScore = examScore;
	}

	@Override
	public String toString() {
		return "Texam [id=" + id + ", examName=" + examName + ", examTime=" + examTime + ", examStatu=" + examStatu
				+ ", examScore=" + examScore + ", paperId=" + paperId + ", stuId=" + stuId + ", pa=" + pa + ", stu="
				+ stu + "]";
	}

}