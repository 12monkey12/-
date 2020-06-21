package com.yc.springblog.entity;

import java.io.Serializable;

public class User implements Serializable{
	private static final long serialVersionUID = 6855202533915207462L;
	
	private int id;
	private String name;
	private String photo;
	private String email;
	private String password;
	private String telephone;

	public String toString() {
		return "User [id=" + id + ", name=" + name + ", photo=" + photo + ", email=" + email + ", password="
				+ password + ", telephone=" + telephone + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

}
