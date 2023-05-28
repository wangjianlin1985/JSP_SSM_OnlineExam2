package com.xhu.entity;

public class User extends Page{
	private int id;
	private String username;
	private String password;
	private String cnUser;
	private String email;
	private String randCode;
	private String role;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRandCode() {
		return randCode;
	}
	public void setRandCode(String randCode) {
		this.randCode = randCode;
	}
	public String getCnUser() {
		return cnUser;
	}
	public void setCnUser(String cnUser) {
		this.cnUser = cnUser;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", cnUser=" + cnUser
				+ ", email=" + email + ", randCode=" + randCode + ", role=" + role + "]";
	}
	public User() {
		super();
	}
	
	
}
