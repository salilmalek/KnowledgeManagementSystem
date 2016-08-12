package com.kms.vo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "USER_MST")
public class User implements Serializable {

	@Id
	@GeneratedValue
	private Long uid;
	private String userName;
	private String passwd;
	private String userType;

	public User() {
		super();
	}

	public User(String userName, String passwd, String userType) {
		super();
		this.uid = uid;
		this.userName = userName;
		this.passwd = passwd;
		this.userType = userType;
	}

	public Long getUid() {
		return uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
}
