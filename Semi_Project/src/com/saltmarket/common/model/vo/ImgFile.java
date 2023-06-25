package com.saltmarket.common.model.vo;

import java.sql.Date;

public class ImgFile {
	private int fileNo;	//	FILE_NO	NUMBER
	private String originName;
	private String changeFileName;//	CHANGE_FILE_NAME	VARCHAR2(100 BYTE)
	private String filePath;
	private Date createdAt;			//	CREATED_AT	DATE
	private String deleteStatus;	//	DELETE_STATUS	CHAR(1 BYTE)
	private int fileLevel;		//	FILE_LEVEL	CHAR(1 BYTE)
	private int productNo;			//	PRODUCT_NO	NUMBER
	private int freeBoardNo;		//	FREE_BOARD_NO	NUMBER
	private int shareBoardNo;		//	SHARE_BOARD_NO	NUMBER

	private String titleImg;

	public ImgFile() {}

	public ImgFile(int fileNo, String originName, String changeFileName, String filePath, Date createdAt,
			String deleteStatus, int fileLevel, int productNo, int freeBoardNo, int shareBoardNo) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeFileName = changeFileName;
		this.filePath = filePath;
		this.createdAt = createdAt;
		this.deleteStatus = deleteStatus;
		this.fileLevel = fileLevel;
		this.productNo = productNo;
		this.freeBoardNo = freeBoardNo;
		this.shareBoardNo = shareBoardNo;
	}


	
	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeFileName() {
		return changeFileName;
	}

	public void setChangeFileName(String changeFileName) {
		this.changeFileName = changeFileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
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

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "ImgFile [fileNo=" + fileNo + ", originName=" + originName + ", changeFileName=" + changeFileName
				+ ", filePath=" + filePath + ", createdAt=" + createdAt + ", deleteStatus=" + deleteStatus
				+ ", fileLevel=" + fileLevel + ", productNo=" + productNo + ", freeBoardNo=" + freeBoardNo
				+ ", shareBoardNo=" + shareBoardNo + ", titleImg=" + titleImg + "]";
	}
	

	
}
