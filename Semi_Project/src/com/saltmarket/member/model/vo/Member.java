package com.saltmarket.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int userNo;         //	USER_NO	NUMBER
	private String userId;      //	USER_ID	VARCHAR2(20 BYTE)
	private String userPwd;     //	USER_PWD	VARCHAR2(20 BYTE)
	private String userName;    //	USER_NAME	VARCHAR2(20 BYTE)
	private String phone;       //	PHONE	CHAR(11 BYTE)
	private String email;       //	EMAIL	VARCHAR2(45 BYTE)
	private String address;     //	ADDRESS	VARCHAR2(100 BYTE)
	private Date enrollDate;    //	ENROLL_DATE	DATE
	private String status;      //	STATUS	CHAR(1 BYTE)
	private Double saltyScore;     //	SALTY_SCORE	NUMBER
	private int gradeNo;        //	GRADE_NO	NUMBER
	private int regionNo;       //	REGION_NO	NUMBER

	public Member() { }

	public Member(int userNo, String userId, String userPwd, String userName, String phone, String email,
			String address, Date enrollDate, String status, Double saltyScore, int gradeNo, int regionNo) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.enrollDate = enrollDate;
		this.status = status;
		this.saltyScore = saltyScore;
		this.gradeNo = gradeNo;
		this.regionNo = regionNo;
	}
	
	// 회원가입용 생성자
	public Member(String userId, String userPwd, String userName, String phone, String email, String address) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}

	// 회원정보 수정용 생성자
	public Member(String userId, String userName, String phone, String email, String address, int regionNo) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.regionNo = regionNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Double getSaltyScore() {
		return saltyScore;
	}

	public void setSaltyScore(Double saltyScore) {
		this.saltyScore = saltyScore;
	}

	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public int getRegionNo() {
		return regionNo;
	}

	public void setRegionNo(int regionNo) {
		this.regionNo = regionNo;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", phone=" + phone + ", email=" + email + ", address=" + address + ", enrollDate=" + enrollDate
				+ ", status=" + status + ", saltyScore=" + saltyScore + ", gradeNo=" + gradeNo + ", regionNo="
				+ regionNo + "]";
	}
	
}
