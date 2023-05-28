package com.xhu.entity;

public class Department {
	private int department_id;
	private String department_name;
	public Department() {
		super();
	}
	@Override
	public String toString() {
		return "Department [department_id=" + department_id + ", department_name=" + department_name + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + department_id;
		result = prime * result + ((department_name == null) ? 0 : department_name.hashCode());
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
		Department other = (Department) obj;
		if (department_id != other.department_id)
			return false;
		if (department_name == null) {
			if (other.department_name != null)
				return false;
		} else if (!department_name.equals(other.department_name))
			return false;
		return true;
	}
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	
}
