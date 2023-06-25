package com.saltmarket.common.model.vo;

import java.sql.Date;

public class ProfileImg {
	
	private int fileNo;              //	FILE_NO	NUMBER
	private String originName;       //	ORIGIN_NAME	VARCHAR2(100 BYTE)
	private String changeName;       //	CHANGE_NAME	VARCHAR2(100 BYTE)
	private String filePath;         //	FILE_PATH	VARCHAR2(1000 BYTE)
	private Date uploadDate;         //	UPLOAD_DATE	DATE
	private char deleteStatus;       //	DELETE_STATUS	CHAR(1 BYTE)
	private int userNo;              //	USER_NO	NUMBER
	
	public ProfileImg() { }

	public ProfileImg(int fileNo, String originName, String changeName, String filePath, Date uploadDate,
			char deleteStatus, int userNo) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.deleteStatus = deleteStatus;
		this.userNo = userNo;
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

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public char getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(char deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "ProfileImg [fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", deleteStatus=" + deleteStatus
				+ ", userNo=" + userNo + "]";
	}

}
