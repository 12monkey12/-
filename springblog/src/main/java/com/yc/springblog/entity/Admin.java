package com.yc.springblog.entity;

import java.io.Serializable;

public class Admin implements Serializable{
	private static final long serialVersionUID = 6424846432872935160L;
	
	private int id;
	private String count;
	private String password;
	private String department;

	@Override
	public String toString() {
		return "Admin [id=" + id + ", count=" + count + ", password=" + password + ", department=" + department + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

}
