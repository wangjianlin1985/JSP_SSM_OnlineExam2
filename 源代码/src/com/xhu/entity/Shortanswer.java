package com.xhu.entity;

public class Shortanswer extends Page {
    private Integer id;

    private String stuid;

    private Integer objectivescore;

    private String subjectiveanswer;

    private String stuname;

    private String papername;

    private Integer readstatu;

    public Integer getReadstatu() {
		return readstatu;
	}

	public void setReadstatu(Integer readstatu) {
		this.readstatu = readstatu;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStuid() {
        return stuid;
    }

    public void setStuid(String stuid) {
        this.stuid = stuid;
    }

    public Integer getObjectivescore() {
        return objectivescore;
    }

    public void setObjectivescore(Integer objectivescore) {
        this.objectivescore = objectivescore;
    }

    public String getSubjectiveanswer() {
        return subjectiveanswer;
    }

    public void setSubjectiveanswer(String subjectiveanswer) {
        this.subjectiveanswer = subjectiveanswer;
    }

    public String getStuname() {
        return stuname;
    }

    public void setStuname(String stuname) {
        this.stuname = stuname;
    }

    public String getPapername() {
        return papername;
    }

    public void setPapername(String papername) {
        this.papername = papername;
    }

	@Override
	public String toString() {
		return "Shortanswer [id=" + id + ", stuid=" + stuid + ", objectivescore=" + objectivescore
				+ ", subjectiveanswer=" + subjectiveanswer + ", stuname=" + stuname + ", papername=" + papername
				+ ", readstatu=" + readstatu + "]";
	}
    
}