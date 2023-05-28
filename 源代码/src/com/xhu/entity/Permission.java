package com.xhu.entity;

public class Permission {
	private int id;
	private String p_name;
	private String p_method;
	private int level_p;
	private int level;
	
	public Permission() {
		super();
	}

	public Permission(int id, String p_name, String p_method, int level_p, int level) {
		super();
		this.id = id;
		this.p_name = p_name;
		this.p_method = p_method;
		this.level_p = level_p;
		this.level = level;
	}

	@Override
	public String toString() {
		return "Permission [id=" + id + ", p_name=" + p_name + ", p_method=" + p_method + ", level_p=" + level_p
				+ ", level=" + level + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + level;
		result = prime * result + level_p;
		result = prime * result + ((p_method == null) ? 0 : p_method.hashCode());
		result = prime * result + ((p_name == null) ? 0 : p_name.hashCode());
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
		Permission other = (Permission) obj;
		if (id != other.id)
			return false;
		if (level != other.level)
			return false;
		if (level_p != other.level_p)
			return false;
		if (p_method == null) {
			if (other.p_method != null)
				return false;
		} else if (!p_method.equals(other.p_method))
			return false;
		if (p_name == null) {
			if (other.p_name != null)
				return false;
		} else if (!p_name.equals(other.p_name))
			return false;
		return true;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_method() {
		return p_method;
	}

	public void setP_method(String p_method) {
		this.p_method = p_method;
	}

	public int getLevel_p() {
		return level_p;
	}

	public void setLevel_p(int level_p) {
		this.level_p = level_p;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}
}
