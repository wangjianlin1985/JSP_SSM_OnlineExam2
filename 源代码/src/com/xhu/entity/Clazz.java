package com.xhu.entity;

public class Clazz {
	private int clazz_id;
	private String clazz_name;
	private String teacher_id;
	public Clazz() {
		super();
	}
	@Override
	public String toString() {
		return "Clazz [clazz_id=" + clazz_id + ", clazz_name=" + clazz_name + ", teacher_id=" + teacher_id + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + clazz_id;
		result = prime * result + ((clazz_name == null) ? 0 : clazz_name.hashCode());
		result = prime * result + ((teacher_id == null) ? 0 : teacher_id.hashCode());
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
		Clazz other = (Clazz) obj;
		if (clazz_id != other.clazz_id)
			return false;
		if (clazz_name == null) {
			if (other.clazz_name != null)
				return false;
		} else if (!clazz_name.equals(other.clazz_name))
			return false;
		if (teacher_id == null) {
			if (other.teacher_id != null)
				return false;
		} else if (!teacher_id.equals(other.teacher_id))
			return false;
		return true;
	}
	public int getClazz_id() {
		return clazz_id;
	}
	public void setClazz_id(int clazz_id) {
		this.clazz_id = clazz_id;
	}
	public String getClazz_name() {
		return clazz_name;
	}
	public void setClazz_name(String clazz_name) {
		this.clazz_name = clazz_name;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	
}
