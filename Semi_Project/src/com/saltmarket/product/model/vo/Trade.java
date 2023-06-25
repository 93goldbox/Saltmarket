package com.saltmarket.product.model.vo;

import java.sql.Date;

public class Trade {
	private int tradeNo;			//	TRADE_NO	NUMBER
	private Date tradeDate;			//	TRADE_DATE	DATE
	private int tradeScore;			//	TRADE_SCORE	NUMBER
	private String reviewContent;	//	REVIEW_CONTENT	VARCHAR2(2000 BYTE)
	private Date reviewDate;		//	REVIEW_DATE	DATE
	private int userNo;				//	USER_NO	NUMBER
	private int productNo;			//	PRODUCT_NO	NUMBER
	
	public Trade() {}

	public Trade(int tradeNo, Date tradeDate, int tradeScore, String reviewContent, Date reviewDate, int userNo,
			int productNo) {
		super();
		this.tradeNo = tradeNo;
		this.tradeDate = tradeDate;
		this.tradeScore = tradeScore;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.userNo = userNo;
		this.productNo = productNo;
	}

	public int getTradeNo() {
		return tradeNo;
	}

	public void setTradeNo(int tradeNo) {
		this.tradeNo = tradeNo;
	}

	public Date getTradeDate() {
		return tradeDate;
	}

	public void setTradeDate(Date tradeDate) {
		this.tradeDate = tradeDate;
	}

	public int getTradeScore() {
		return tradeScore;
	}

	public void setTradeScore(int tradeScore) {
		this.tradeScore = tradeScore;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
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

	@Override
	public String toString() {
		return "Trade [tradeNo=" + tradeNo + ", tradeDate=" + tradeDate + ", tradeScore=" + tradeScore
				+ ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate + ", userNo=" + userNo
				+ ", productNo=" + productNo + "]";
	}
	
	
}
