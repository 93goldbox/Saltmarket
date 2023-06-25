package com.saltmarket.notice.model.vo;

import java.sql.Date;

public class QNA {
//     MTOM_NO	NUMBER
// Q_TITLE	VARCHAR2(20 BYTE)
// Q_CONTENT	VARCHAR2(1000 BYTE)
// Q_DATE	DATE
// Q_CATEGORY	VARCHAR2(30 BYTE)
// A_CONTENT	VARCHAR2(1000 BYTE)
// A_DATE	DATE
// USER_NO	NUMBER

    private int qnaNo;
    private String qTitle;
    private String qContent;
    private Date qDate;
    private String qCategory;
    private String aContent;
    private Date aDate;
    private int userNo;
    private String qWriter;
	private String deleteStatus;
	private String answerStatus;
	private String userId;
	private String userName;
	private String email;
	private String phone;
	
	
	public QNA() {
		super();
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public Date getqDate() {
		return qDate;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	public String getqCategory() {
		return qCategory;
	}
	public void setqCategory(String qCategory) {
		this.qCategory = qCategory;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public Date getaDate() {
		return aDate;
	}
	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getqWriter() {
		return qWriter;
	}
	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	public String getDeleteStatus() {
		return deleteStatus;
	}
	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}
	public String getAnswerStatus() {
		return answerStatus;
	}
	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}
	@Override
	public String toString() {
		return "QNA [qnaNo=" + qnaNo + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qDate=" + qDate
				+ ", qCategory=" + qCategory + ", aContent=" + aContent + ", aDate=" + aDate + ", userNo=" + userNo
				+ ", qWriter=" + qWriter + ", deleteStatus=" + deleteStatus + ", answerStatus=" + answerStatus
				+ ", userId=" + userId + ", userName=" + userName + ", email=" + email + ", phone=" + phone + "]";
	}
}
