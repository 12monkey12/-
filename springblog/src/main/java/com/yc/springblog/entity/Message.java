package com.yc.springblog.entity;

import java.io.Serializable;
import java.sql.Date;

public class Message implements Serializable{
	private static final long serialVersionUID = 3350982589044198717L;
	
	private int id;
	private int cid;
	private String uname;
	private String content_title;
	private Date date;
	private int type;
	
	private String content;
	private int status;
	
	@Override
	public String toString() {
		return "Message [id=" + id + ", cid=" + cid + ", uname=" + uname + ", content_title=" + content_title
				+ ", date=" + date + ", type=" + type + ", content=" + content + ", status=" + status + "]";
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getCid() {
		return cid;
	}
	
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	public String getUname() {
		return uname;
	}
	
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	public String getContent_title() {
		return content_title;
	}
	
	public void setContent_title(String content_title) {
		this.content_title = content_title;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public int getType() {
		return type;
	}
	
	public void setType(int type) {
		this.type = type;
	}
	
	
	
}
