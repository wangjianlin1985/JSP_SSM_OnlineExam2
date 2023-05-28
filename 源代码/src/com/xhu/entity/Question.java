package com.xhu.entity;

import java.util.Date;

public class Question extends Page {
    private Integer qId;

    private String qContent;

    private Integer qType;

    private String aOption;

    private String bOption;

    private String cOption;

    private String dOption;

    private String answer;

    private Integer score;

    private Integer difficultyId;

    private Date questionCreateTime;

    private QuestionType qt;
    private Difficulty difficulty;
    public Difficulty getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(Difficulty difficulty) {
		this.difficulty = difficulty;
	}

	public QuestionType getQt() {
		return qt;
	}

	public void setQt(QuestionType qt) {
		this.qt = qt;
	}

	public Integer getqId() {
        return qId;
    }

    public void setqId(Integer qId) {
        this.qId = qId;
    }

    public String getqContent() {
        return qContent;
    }

    public void setqContent(String qContent) {
        this.qContent = qContent;
    }

    public Integer getqType() {
        return qType;
    }

    public void setqType(Integer qType) {
        this.qType = qType;
    }

    public String getaOption() {
        return aOption;
    }

    public void setaOption(String aOption) {
        this.aOption = aOption;
    }

    public String getbOption() {
        return bOption;
    }

    public void setbOption(String bOption) {
        this.bOption = bOption;
    }

    public String getcOption() {
        return cOption;
    }

    public void setcOption(String cOption) {
        this.cOption = cOption;
    }

    public String getdOption() {
        return dOption;
    }

    public void setdOption(String dOption) {
        this.dOption = dOption;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getDifficultyId() {
        return difficultyId;
    }

    public void setDifficultyId(Integer difficultyId) {
        this.difficultyId = difficultyId;
    }

    public Date getQuestionCreateTime() {
        return questionCreateTime;
    }

    public void setQuestionCreateTime(Date questionCreateTime) {
        this.questionCreateTime = questionCreateTime;
    }

	@Override
	public String toString() {
		return "Question [qId=" + qId + ", qContent=" + qContent + ", qType=" + qType + ", aOption=" + aOption
				+ ", bOption=" + bOption + ", cOption=" + cOption + ", dOption=" + dOption + ", answer=" + answer
				+ ", score=" + score + ", difficultyId=" + difficultyId + ", questionCreateTime=" + questionCreateTime
				+ ", qt=" + qt + ", difficulty=" + difficulty + "]";
	}
    
}