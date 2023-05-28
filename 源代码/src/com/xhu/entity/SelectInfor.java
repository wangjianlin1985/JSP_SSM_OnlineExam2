package com.xhu.entity;

public class SelectInfor {
	private int id;
	private String text;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public String toString() {
		return "SelectInfor [id=" + id + ", text=" + text + "]";
	}
	public SelectInfor() {
		super();
	}
	
}
