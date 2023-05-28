package com.xhu.entity;

import java.util.Date;

public class News extends Page{
	private int id;
	private String news_content;
	private Date publish_time;
	private String news_title;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	public Date getPublish_time() {
		return publish_time;
	}
	public void setPublish_time(Date publish_time) {
		this.publish_time = publish_time;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	@Override
	public String toString() {
		return "News [id=" + id + ", news_content=" + news_content + ", publish_time=" + publish_time + ", news_title="
				+ news_title + "]";
	}
	public News() {
		super();
	}
	
}
