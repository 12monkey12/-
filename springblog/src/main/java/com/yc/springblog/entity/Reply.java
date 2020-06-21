package com.yc.springblog.entity;

import java.io.Serializable;
import java.sql.Date;

public class Reply implements Serializable {
	private static final long serialVersionUID = 3108298647728793018L;
	
	private int id;
	private int cid;
	private int comment_id;    
	private int to_uid;
	private int from_uid;
	private Date date;
	private String content;
	private int star;
	private int status;
	private String to_uname;
	private String from_uname;
	
	private int guid;
	private String content_title;
	
	@Override
	public String toString() {
		return "Reply [id=" + id + ", cid=" + cid + ", comment_id=" + comment_id + ", to_uid=" + to_uid + ", from_uid="
				+ from_uid + ", date=" + date + ", content=" + content + ", star=" + star + ", status=" + status
				+ ", to_uname=" + to_uname + ", from_uname=" + from_uname + ", guid=" + guid + ", content_title="
				+ content_title + "]";
	}
	
	public String getContent_title() {
		return content_title;
	}

	public void setContent_title(String content_title) {
		this.content_title = content_title;
	}

	public int getGuid() {
		return guid;
	}

	public void setGuid(int guid) {
		this.guid = guid;
	}

	public String getTo_uname() {
		return to_uname;
	}

	public void setTo_uname(String to_uname) {
		this.to_uname = to_uname;
	}

	public String getFrom_uname() {
		return from_uname;
	}

	public void setFrom_uname(String from_uname) {
		this.from_uname = from_uname;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public int getTo_uid() {
		return to_uid;
	}

	public void setTo_uid(int to_uid) {
		this.to_uid = to_uid;
	}

	public int getFrom_uid() {
		return from_uid;
	}

	public void setFrom_uid(int from_uid) {
		this.from_uid = from_uid;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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
	
	
}
