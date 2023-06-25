package com.saltmarket.common.model.vo;

public class Region {
	private int regionNo;		//	REGION_NO	NUMBER
	private String regionName;	//	REGION_NAME	VARCHAR2(100 BYTE)
	
	public Region() {}

	public Region(int regionNo, String regionName) {
		super();
		this.regionNo = regionNo;
		this.regionName = regionName;
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

	@Override
	public String toString() {
		return "Region [regionNo=" + regionNo + ", regionName=" + regionName + "]";
	}
	
	
}
