package com.saltmarket.common.model.vo;

import java.sql.Date;

public class Reply {
	
	private int replyNo;				//	REPLY_NO	NUMBER
	private int freeboardNo;			//	FREE_BOARD_NO	NUMBER
	private int shareboardNo;		//	SHARE_BOARD_NO	NUMBER
	private int userNo;					//	USER_NO	NUMBER
	private String userName;			
	private String replyContent;	//	REPLY_CONTENT	VARCHAR2(2000 BYTE)
	private String createdDate;	 	//	CREATED_DATE	DATE
	private String deleteStatus;	//	DELETE_STATUS	CHAR(1 BYTE)
	
	public Reply() {}

	public Reply(int replyNo, int freeboardNo, int shareboardNo, int userNo, String userName, String replyContent,
			String createdDate, String deleteStatus) {
		super();
		this.replyNo = replyNo;
		this.freeboardNo = freeboardNo;
		this.shareboardNo = shareboardNo;
		this.userNo = userNo;
		this.userName = userName;
		this.replyContent = replyContent;
		this.createdDate = createdDate;
		this.deleteStatus = deleteStatus;
	}
	
	// 댓글 리스트 조회용 생성자
	public Reply(int replyNo, int userNo, String userName, String replyContent, String createdDate) {
		super();
		this.replyNo = replyNo;
		this.userNo = userNo;
		this.userName = userName;
		this.replyContent = replyContent;
		this.createdDate = createdDate;
	}

	public int getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getFreeboardNo() {
		return freeboardNo;
	}

	public void setFreeboardNo(int freeboardNo) {
		this.freeboardNo = freeboardNo;
	}

	public int getShareboardNo() {
		return shareboardNo;
	}

	public void setShareboardNo(int shareboardNo) {
		this.shareboardNo = shareboardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", freeboardNo=" + freeboardNo + ", shareboardNo=" + shareboardNo
				+ ", userNo=" + userNo + ", userName=" + userName + ", replyContent=" + replyContent + ", createdDate="
				+ createdDate + ", deleteStatus=" + deleteStatus + "]";
	}

	
	
}
