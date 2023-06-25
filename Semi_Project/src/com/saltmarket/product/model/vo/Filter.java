package com.saltmarket.product.model.vo;

public class Filter {

	private int categoryNo;
	private String keyword;
	
	public Filter() {}

	public Filter(int categoryNo, String keyword) {
		super();
		this.categoryNo = categoryNo;
		this.keyword = keyword;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Filter [categoryNo=" + categoryNo + ", keyword=" + keyword + "]";
	}
	
	
}
