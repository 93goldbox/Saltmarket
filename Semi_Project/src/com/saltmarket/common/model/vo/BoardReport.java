package com.saltmarket.common.model.vo;

public class BoardReport {
	
	String type;
	int boardNo;
	int userNo;
	String reportTitle;
	String reportContent;
	
	public BoardReport() {}

	public BoardReport(String type, int boardNo, int userNo, String reportTitle, String reportContent) {
		super();
		this.type = type;
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.reportTitle = reportTitle;
		this.reportContent = reportContent;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	@Override
	public String toString() {
		return "BoardReport [type=" + type + ", boardNo=" + boardNo + ", userNo=" + userNo + ", reportTitle="
				+ reportTitle + ", reportContent=" + reportContent + "]";
	}
	
	
}
