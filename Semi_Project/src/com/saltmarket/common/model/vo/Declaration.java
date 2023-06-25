package com.saltmarket.common.model.vo;

import java.sql.Date;

public class Declaration {
	private int declareNo;			//	DECLARE_NO	NUMBER
	private String declareTitle;	//	DECLARE_TITLE	VARCHAR2(100 BYTE)
	private String declareContent;	//	DECLARE_CONTENT	VARCHAR2(2000 BYTE)
	private String declareType;		//	DECLARE_TYPE	VARCHAR2(20 BYTE)
	private int declareCheck;		//	DECLARE_CHECK	NUMBER
	private Date declareDate;		//	DECLARE_DATE	DATE
	private String declareReason;	//	DECLARE_REASON	VARCHAR2(2000 BYTE)
	private Date declareCheckDate;	//	DECLARE_CHECK_DATE	DATE
	private int freeBoardNo;		//	FREE_BOARD_NO	NUMBER
	private int shareBoardNo;		//	SHARE_BOARD_NO	NUMBER
	private int userNo;				//	USER_NO	NUMBER
	private String userId;			//	USER_ID	VARCHAR2(20 BYTE)
	private int productNo;      
	
	public Declaration() {}

	public Declaration(int declareNo, String declareTitle, String declareContent, String declareType, int declareCheck,
			Date declareDate, String declareReason, Date declareCheckDate, int freeBoardNo, int shareBoardNo,
			int userNo) {
		super();
		this.declareNo = declareNo;
		this.declareTitle = declareTitle;
		this.declareContent = declareContent;
		this.declareType = declareType;
		this.declareCheck = declareCheck;
		this.declareDate = declareDate;
		this.declareReason = declareReason;
		this.declareCheckDate = declareCheckDate;
		this.freeBoardNo = freeBoardNo;
		this.shareBoardNo = shareBoardNo;
		this.userNo = userNo;
	}
	
	

	public Declaration(int declareNo, String declareTitle, String declareContent, String declareType, int declareCheck,
			Date declareDate, String declareReason, Date declareCheckDate, int userNo, String userId) {
		super();
		this.declareNo = declareNo;
		this.declareTitle = declareTitle;
		this.declareContent = declareContent;
		this.declareType = declareType;
		this.declareCheck = declareCheck;
		this.declareDate = declareDate;
		this.declareReason = declareReason;
		this.declareCheckDate = declareCheckDate;
		this.userNo = userNo;
		this.userId = userId;
	}

	
	public Declaration(int declareNo, String declareTitle, String declareContent, String declareType, int declareCheck,
			Date declareDate, String declareReason, Date declareCheckDate, int freeBoardNo, int shareBoardNo,
			int userNo, String userId) {
		super();
		this.declareNo = declareNo;
		this.declareTitle = declareTitle;
		this.declareContent = declareContent;
		this.declareType = declareType;
		this.declareCheck = declareCheck;
		this.declareDate = declareDate;
		this.declareReason = declareReason;
		this.declareCheckDate = declareCheckDate;
		this.freeBoardNo = freeBoardNo;
		this.shareBoardNo = shareBoardNo;
		this.userNo = userNo;
		this.userId = userId;
	}

	
	
	public Declaration(int declareNo, String declareTitle, String declareContent, String declareType, int declareCheck,
			Date declareDate, String declareReason, Date declareCheckDate, int freeBoardNo, int shareBoardNo,
			int userNo, String userId, int productNo) {
		super();
		this.declareNo = declareNo;
		this.declareTitle = declareTitle;
		this.declareContent = declareContent;
		this.declareType = declareType;
		this.declareCheck = declareCheck;
		this.declareDate = declareDate;
		this.declareReason = declareReason;
		this.declareCheckDate = declareCheckDate;
		this.freeBoardNo = freeBoardNo;
		this.shareBoardNo = shareBoardNo;
		this.userNo = userNo;
		this.userId = userId;
		this.productNo = productNo;
	}

	public int getDeclareNo() {
		return declareNo;
	}

	public void setDeclareNo(int declareNo) {
		this.declareNo = declareNo;
	}

	public String getDeclareTitle() {
		return declareTitle;
	}

	public void setDeclareTitle(String declareTitle) {
		this.declareTitle = declareTitle;
	}

	public String getDeclareContent() {
		return declareContent;
	}

	public void setDeclareContent(String declareContent) {
		this.declareContent = declareContent;
	}

	public String getDeclareType() {
		return declareType;
	}

	public void setDeclareType(String declareType) {
		this.declareType = declareType;
	}

	public int getDeclareCheck() {
		return declareCheck;
	}

	public void setDeclareCheck(int declareCheck) {
		this.declareCheck = declareCheck;
	}

	public Date getDeclareDate() {
		return declareDate;
	}

	public void setDeclareDate(Date declareDate) {
		this.declareDate = declareDate;
	}

	public String getDeclareReason() {
		return declareReason;
	}

	public void setDeclareReason(String declareReason) {
		this.declareReason = declareReason;
	}

	public Date getDeclareCheckDate() {
		return declareCheckDate;
	}

	public void setDeclareCheckDate(Date declareCheckDate) {
		this.declareCheckDate = declareCheckDate;
	}

	public int getFreeBoardNo() {
		return freeBoardNo;
	}

	public void setFreeBoardNo(int freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}

	public int getShareBoardNo() {
		return shareBoardNo;
	}

	public void setShareBoardNo(int shareBoardNo) {
		this.shareBoardNo = shareBoardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Declaration [declareNo=" + declareNo + ", declareTitle=" + declareTitle + ", declareContent="
				+ declareContent + ", declareType=" + declareType + ", declareCheck=" + declareCheck + ", declareDate="
				+ declareDate + ", declareReason=" + declareReason + ", declareCheckDate=" + declareCheckDate
				+ ", freeBoardNo=" + freeBoardNo + ", shareBoardNo=" + shareBoardNo + ", userNo=" + userNo + "]";
	}
	
}
