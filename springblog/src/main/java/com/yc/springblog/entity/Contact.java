package com.yc.springblog.entity;

import java.io.Serializable;
import java.sql.Date;

public class Contact implements Serializable{
	private static final long serialVersionUID = 1110788716787126771L;
	
	private int id;
	private int uid;
	private String title;
	private String content;
	private Date date;
	private int status;
	private String uname;

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	@Override
	public String toString() {
		return "Contact [id=" + id + ", uid=" + uid + ", title=" + title + ", content=" + content + ", date=" + date
				+ ", status=" + status + ", uname=" + uname + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	

}
