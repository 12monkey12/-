package com.yc.springblog.entity;

import java.io.Serializable;
import java.sql.Date;

public class Great implements Serializable{
	private static final long serialVersionUID = -6033818919755391612L;
	
	private int id;
	private int uid;
	private int type_id;
	private int type;
	private Date date;
	private int status;
	

	@Override
	public String toString() {
		return "Great [id=" + id + ", uid=" + uid + ", type_id=" + type_id + ", type=" + type + ", date=" + date
				+ ", status=" + status + "]";
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

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
