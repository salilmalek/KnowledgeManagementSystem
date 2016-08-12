package com.kms.vo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "POST_MST")
public class Post implements Serializable {

	@Id
	@GeneratedValue
	private Long postId;
	private String userName;
	private String postType;
	private String postTitle;
	private String domain;
	private String postDescr;
	private String postLoc;

	public Post() {
		super();
	}

	public Post(String userName, String postType, String postTitle,
			String domain, String postDescr, String postLoc) {
		super();
		this.userName = userName;
		this.postType = postType;
		this.postTitle = postTitle;
		this.domain = domain;
		this.postDescr = postDescr;
		this.postLoc = postLoc;
	}

	public Long getPostId() {
		return postId;
	}

	public void setPostId(Long postId) {
		this.postId = postId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPostType() {
		return postType;
	}

	public void setPostType(String postType) {
		this.postType = postType;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getPostDescr() {
		return postDescr;
	}

	public void setPostDescr(String postDescr) {
		this.postDescr = postDescr;
	}

	public String getPostLoc() {
		return postLoc;
	}

	public void setPostLoc(String postLoc) {
		this.postLoc = postLoc;
	}

}
