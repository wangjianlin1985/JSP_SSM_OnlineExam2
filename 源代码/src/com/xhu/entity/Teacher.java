package com.xhu.entity;

public class Teacher {
	private int id;
	private String teacher_id;
	private String teacher_name;
	private int department_id;
	private int account_id;
	public Teacher() {
		super();
	}
	@Override
	public String toString() {
		return "Teacher [id=" + id + ", teacher_id=" + teacher_id + ", teacher_name=" + teacher_name
				+ ", department_id=" + department_id + ", account_id=" + account_id + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + account_id;
		result = prime * result + department_id;
		result = prime * result + id;
		result = prime * result + ((teacher_id == null) ? 0 : teacher_id.hashCode());
		result = prime * result + ((teacher_name == null) ? 0 : teacher_name.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Teacher other = (Teacher) obj;
		if (account_id != other.account_id)
			return false;
		if (department_id != other.department_id)
			return false;
		if (id != other.id)
			return false;
		if (teacher_id == null) {
			if (other.teacher_id != null)
				return false;
		} else if (!teacher_id.equals(other.teacher_id))
			return false;
		if (teacher_name == null) {
			if (other.teacher_name != null)
				return false;
		} else if (!teacher_name.equals(other.teacher_name))
			return false;
		return true;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	
}
