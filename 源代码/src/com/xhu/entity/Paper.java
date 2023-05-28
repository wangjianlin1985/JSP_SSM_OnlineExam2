package com.xhu.entity;

import java.util.Date;

public class Paper extends Page {
	private Integer paperId;

	private String paperName;

	private Integer allscore;

	private Integer paperTime;

	private Date createTime;

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getPaperId() {
		return paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	public String getPaperName() {
		return paperName;
	}

	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}

	public Integer getAllscore() {
		return allscore;
	}

	public void setAllscore(Integer allscore) {
		this.allscore = allscore;
	}

	public Integer getPaperTime() {
		return paperTime;
	}

	public void setPaperTime(Integer paperTime) {
		this.paperTime = paperTime;
	}

}