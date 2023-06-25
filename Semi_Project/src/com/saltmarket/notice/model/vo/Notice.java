package com.saltmarket.notice.model.vo;

import java.sql.Date;

public class Notice {
    /*
    NOTICE_NO	NUMBER
NOTICE_TITLE	VARCHAR2(200 BYTE)
NOTICE_CONTENT	VARCHAR2(1000 BYTE)
CREATE_DATE	DATE
NOTICE_VIEWS	NUMBER
DELETE_STATUS	CHAR(1 BYTE)
    */
    private int noticeNo;
    private String noticeTitle;
    private String noticeContent;
    private Date createDate;
    private int noticeViews;
    private String deleteStatus;
    
    
    
    
	public Notice() {
		super();
	}




	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date createDate, int noticeViews,
			String deleteStatus) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
		this.noticeViews = noticeViews;
		this.deleteStatus = deleteStatus;
	}

	
	

	public Notice(int noticeNo, String noticeTitle, String noticeContent, int noticeViews, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
		this.noticeViews = noticeViews;
	}




	public Notice(String noticeTitle, Date createDate) {
		super();
		this.noticeTitle = noticeTitle;
		this.createDate = createDate;
		
	}
	
	



	public Notice(int noticeNo, String noticeTitle, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.createDate = createDate;
	}

	



	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}


	public String getNoticeTitle() {
		return noticeTitle;
	}


	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}


	public String getNoticeContent() {
		return noticeContent;
	}


	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public int getNoticeViews() {
		return noticeViews;
	}


	public void setNoticeViews(int noticeViews) {
		this.noticeViews = noticeViews;
	}


	public String getDeleteStatus() {
		return deleteStatus;
	}


	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}


	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", createDate=" + createDate + ", noticeViews=" + noticeViews + ", deleteStatus=" + deleteStatus
				+ "]";
	}
    
    
	
}
