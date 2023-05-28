package com.xhu.entity;

public class Student extends Page {
    private Integer id;

    private String stuName;

    private String stuId;

    private Integer clazzId;

    private Integer departmentId;

    private String teacherId;

    private String account;
	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public int getClazz_id() {
		return clazz_id;
	}

	public void setClazz_id(int clazz_id) {
		this.clazz_id = clazz_id;
	}

	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	private String stu_name;
	private String stu_id;
	private int clazz_id;
	private int department_id;
	private String teacher_id;
    private int score;
	private Clazz clazz;
	private Department department;
	private Teacher teacher;
	private Texam texam;

    public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Clazz getClazz() {
		return clazz;
	}

	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Texam getTexam() {
		return texam;
	}

	public void setTexam(Texam texam) {
		this.texam = texam;
	}

	

	@Override
	public String toString() {
		return "Student [id=" + id + ", stuName=" + stuName + ", stuId=" + stuId + ", clazzId=" + clazzId
				+ ", departmentId=" + departmentId + ", teacherId=" + teacherId + ", account=" + account + ", stu_name="
				+ stu_name + ", stu_id=" + stu_id + ", clazz_id=" + clazz_id + ", department_id=" + department_id
				+ ", teacher_id=" + teacher_id + ", score=" + score + ", clazz=" + clazz + ", department=" + department
				+ ", teacher=" + teacher + ", texam=" + texam + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public Integer getClazzId() {
        return clazzId;
    }

    public void setClazzId(Integer clazzId) {
        this.clazzId = clazzId;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}


}