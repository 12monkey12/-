package com.yc.springblog.entity;

import java.io.Serializable;
import java.sql.Date;

public class Contents implements Serializable{
	private static final long serialVersionUID = 8787869456588735098L;
	
	private int id;
	private int aid;
	private Date date;
	private String title;
	private String content;
	private String pic;
	private int star;
	private int comment;
	private int view;
	
	private int uid;
	private String admin_department;
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public String getAdmin_department() {
		return admin_department;
	}

	public void setAdmin_department(String admin_department) {
		this.admin_department = admin_department;
	}

	@Override
	public String toString() {
		return "Contents [id=" + id + ", aid=" + aid + ", date=" + date + ", title=" + title + ", content=" + content
				+ ", pic=" + pic + ", star=" + star + ", comment=" + comment + ", view=" + view + ", uid=" + uid
				+ ", admin_department=" + admin_department + "]";
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
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
	
	public String getPic() {
		return pic;
	}

	public void setPics(String pic) {
		this.pic = pic;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getComment() {
		return comment;
	}

	public void setComment(int comment) {
		this.comment = comment;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	

}
