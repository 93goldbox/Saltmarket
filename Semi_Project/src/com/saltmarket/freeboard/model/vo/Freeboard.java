package com.saltmarket.freeboard.model.vo;

import java.sql.Date;

public class Freeboard {
	
	private int freeboardNo;				//	FREE_BOARD_NO	NUMBER
	private int userNo;
	private String userName;			//	USER_NO	NUMBER
	private String boardTitle;			//	BOARD_TITLE	VARCHAR2(100 BYTE)
	private String boardContent;		//	BOARD_CONTENT	VARCHAR2(2000 BYTE)
	private Date createdDate;			//	CREATED_DATE	DATE
	private int boardViews;				//	BOARD_VIEWS	NUMBER
	private String deleteStatus;		//	DELETE_STATUS	CHAR(1 BYTE)
	private String category;				//	CATEGORY	VARCHAR2(100 BYTE)
	private int likeCount;
	private int dislikeCount;
	private int replyCount;
	
	public Freeboard() {}
	
	public Freeboard(int freeboardNo, int userNo, String userName, String boardTitle, String boardContent,
			Date createdDate, int boardViews, String deleteStatus, String category, int likeCount, int dislikeCount, int replyCount) {
		super();
		this.freeboardNo = freeboardNo;
		this.userNo = userNo;
		this.userName = userName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createdDate = createdDate;
		this.boardViews = boardViews;
		this.deleteStatus = deleteStatus;
		this.category = category;
		this.likeCount = likeCount;
		this.dislikeCount = dislikeCount;
		this.replyCount = replyCount;
	}

	// 목록 조회용 생성자
	public Freeboard(int freeboardNo, String userName, String boardTitle, Date createdDate, int boardViews,
			String category, int replyCount) {
		super();
		this.freeboardNo = freeboardNo;
		this.userName = userName;
		this.boardTitle = boardTitle;
		this.createdDate = createdDate;
		this.boardViews = boardViews;
		this.category = category;
		this.replyCount = replyCount;
	}

	// Best 조회용 생성자
	public Freeboard(int freeboardNo, String boardTitle, int boardViews, int replyCount) {
		super();
		this.freeboardNo = freeboardNo;
		this.boardTitle = boardTitle;
		this.boardViews = boardViews;
		this.replyCount = replyCount;
	}

	// 상세조회용 생성자
	public Freeboard(int freeboardNo, int userNo, String userName, String boardTitle, String boardContent,
			Date createdDate, int boardViews, String category, int replyCount) {
		super();
		this.freeboardNo = freeboardNo;
		this.userNo = userNo;
		this.userName = userName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createdDate = createdDate;
		this.boardViews = boardViews;
		this.category = category;
		this.replyCount = replyCount;
	}
	
	public int getFreeboardNo() {
		return freeboardNo;
	}

	public void setFreeboardNo(int freeboardNo) {
		this.freeboardNo = freeboardNo;
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

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public int getBoardViews() {
		return boardViews;
	}

	public void setBoardViews(int boardViews) {
		this.boardViews = boardViews;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getDislikeCount() {
		return dislikeCount;
	}

	public void setDislikeCount(int dislikeCount) {
		this.dislikeCount = dislikeCount;
	}
	
	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	@Override
	public String toString() {
		return "Freeboard [freeboardNo=" + freeboardNo + ", userNo=" + userNo + ", userName=" + userName
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", createdDate=" + createdDate
				+ ", boardViews=" + boardViews + ", deleteStatus=" + deleteStatus + ", category=" + category
				+ ", likeCount=" + likeCount + ", dislikeCount=" + dislikeCount + ", replyCount=" + replyCount + "]";
	}

}
