package com.saltmarket.common.model.vo;

public class SearchInfo {
	
	private String category;
	private int regionNo;
	private String shareStatus;
	private String kind;
	private String keyword;
	
	public SearchInfo() {}

	public SearchInfo(String category, int regionNo, String shareStatus, String kind, String keyword) {
		super();
		this.category = category;
		this.regionNo = regionNo;
		this.shareStatus = shareStatus;
		this.kind = kind;
		this.keyword = keyword;
	}
	
	// 자유게시판 리스트 조회용 생성자
	public SearchInfo(String category, String kind, String keyword) {
		super();
		this.category = category;
		this.kind = kind;
		this.keyword = keyword;
	}
	
	
	// 나눔게시판 리스트 조회용 생성자
	public SearchInfo(int region, String shareStatus, String kind, String keyword) {
		super();
		this.regionNo = region;
		this.shareStatus = shareStatus;
		this.kind = kind;
		this.keyword = keyword;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getRegionNo() {
		return regionNo;
	}

	public void setRegionNo(int regionNo) {
		this.regionNo = regionNo;
	}

	public String getShareStatus() {
		return shareStatus;
	}

	public void setShareStatus(String shareStatus) {
		this.shareStatus = shareStatus;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchInfo [category=" + category + ", regionNo=" + regionNo + ", shareStatus=" + shareStatus
				+ ", kind=" + kind + ", keyword=" + keyword + "]";
	}


}
