package com.saltmarket.shareboard.model.vo;

import java.sql.Date;

public class Shareboard {
	
	private int shareboardNo;				//	SHARE_BOARD_NO	NUMBER
	private int regionNo;
	private String regionName;
	private int userNo;
	private String userName;			//	USER_NO	NUMBER
	private String boardTitle;			//	BOARD_TITLE	VARCHAR2(100 BYTE)
	private String boardContent;		//	BOARD_CONTENT	VARCHAR2(2000 BYTE)
	private Date createdDate;			//	CREATED_DATE	DATE
	private int boardViews;				//	BOARD_VIEWS	NUMBER
	private String deleteStatus;		//	DELETE_STATUS	CHAR(1 BYTE)
	private String shareStatus;				
	private int likeCount;
	private int dislikeCount;
	private int replyCount;
	
	public Shareboard() {}
	
	public Shareboard(int shareboardNo, int regionNo, String regionName, int userNo, String userName, String boardTitle, String boardContent,
			Date createdDate, int boardViews, String deleteStatus, String shareStatus, int likeCount, int dislikeCount, int replyCount) {
		super();
		this.shareboardNo = shareboardNo;
		this.regionNo = regionNo;
		this.regionName = regionName;
		this.userNo = userNo;
		this.userName = userName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createdDate = createdDate;
		this.boardViews = boardViews;
		this.deleteStatus = deleteStatus;
		this.shareStatus = shareStatus;
		this.likeCount = likeCount;
		this.dislikeCount = dislikeCount;
		this.replyCount = replyCount;
	}

	// 목록 조회용 생성자
	public Shareboard(int shareboardNo, String regionName, String userName, String boardTitle, Date createdDate, int boardViews,
			String shareStatus, int replyCount) {
		super();
		this.shareboardNo = shareboardNo;
		this.regionName = regionName;
		this.userName = userName;
		this.boardTitle = boardTitle;
		this.createdDate = createdDate;
		this.boardViews = boardViews;
		this.shareStatus = shareStatus;
		this.replyCount = replyCount;
	}

	// Best 조회용 생성자
	public Shareboard(int shareboardNo, String boardTitle, String shareStatus, int boardViews, int replyCount) {
		super();
		this.shareboardNo = shareboardNo;
		this.boardTitle = boardTitle;
		this.shareStatus = shareStatus;
		this.boardViews = boardViews;
		this.replyCount = replyCount;
	}

	// 상세조회용 생성자
	public Shareboard(int shareboardNo, int userNo, String userName, String boardTitle, String boardContent,
			Date createdDate, int boardViews, String regionName, int regionNo, String shareStatus, int replyCount) {
		super();
		this.shareboardNo = shareboardNo;
		this.userNo = userNo;
		this.userName = userName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createdDate = createdDate;
		this.boardViews = boardViews;
		this.regionName = regionName;
		this.regionNo = regionNo;
		this.shareStatus = shareStatus;
		this.replyCount = replyCount;
	}
	
	public int getShareboardNo() {
		return shareboardNo;
	}

	public void setShareboardNo(int shareboardNo) {
		this.shareboardNo = shareboardNo;
	}
	
	public int getRegionNo() {
		return regionNo;
	}

	public void setRegionNo(int regionNo) {
		this.regionNo = regionNo;
	}
	
	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
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

	public String getShareStatus() {
		return shareStatus;
	}

	public void setShareStatus(String shareStatus) {
		this.shareStatus = shareStatus;
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
		return "Shareboard [shareboardNo=" + shareboardNo + ", regionNo=" + regionNo + ", userNo=" + userNo
				+ ", userName=" + userName + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", createdDate=" + createdDate + ", boardViews=" + boardViews + ", deleteStatus=" + deleteStatus
				+ ", shareStatus=" + shareStatus + ", likeCount=" + likeCount + ", dislikeCount=" + dislikeCount
				+ ", replyCount=" + replyCount + "]";
	}


}
