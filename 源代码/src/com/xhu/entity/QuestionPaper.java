package com.xhu.entity;

public class QuestionPaper {
	private Integer qpId;

	private Integer questionId;

	private Integer paperId;

	private Question q;

	private Paper p;

	public Question getQ() {
		return q;
	}

	public void setQ(Question q) {
		this.q = q;
	}

	public Paper getP() {
		return p;
	}

	public void setP(Paper p) {
		this.p = p;
	}

	public Integer getQpId() {
		return qpId;
	}

	public void setQpId(Integer qpId) {
		this.qpId = qpId;
	}

	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public Integer getPaperId() {
		return paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}
}