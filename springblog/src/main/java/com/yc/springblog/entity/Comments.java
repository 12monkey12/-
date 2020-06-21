package com.yc.springblog.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Comments implements Serializable{
	private static final long serialVersionUID = 5477958982222084861L;
	
	private int id;
	private int uid;
	private int cid;
	private String content;
	private Date date;
	private int reply_count;
	private int star;
	private String uname;
	
	private int guid;
	
	private List<Reply> replies;
	
	
	
	public int getGuid() {
		return guid;
	}

	public void setGuid(int guid) {
		this.guid = guid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public List<Reply> getReplies() {
		return replies;
	}

	public void setReplies(List<Reply> replies) {
		this.replies = replies;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	@Override
	public String toString() {
		return "Comments [id=" + id + ", uid=" + uid + ", cid=" + cid + ", content=" + content + ", date=" + date
				+ ", reply_count=" + reply_count + ", star=" + star + ", uname=" + uname + ", guid=" + guid
				+ ", replies=" + replies + "]";
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

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
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

}
