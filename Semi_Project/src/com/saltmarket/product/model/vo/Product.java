package com.saltmarket.product.model.vo;

import java.sql.Date;

public class Product {
	private int productNo;		//	PRODUCT_NO	NUMBER
	private String productName;	//	PRODUCT_NAME	VARCHAR2(100 BYTE)
	private String productStatus;//	PRODUCT_STATUS	CHAR(1 BYTE)
	private int price;			//	PRICE	NUMBER
	private Date createdAt;		//	CREATED_AT	DATE
	private String deleteStatus;	//	DELETE_STATUS	CHAR(1 BYTE)
	private String description;	//	DESCRIPTION	VARCHAR2(1000 BYTE)
	private int productViews;	//	PRODUCT_VIEWS	NUMBER
	private int categoryNo;		//	CATEGORY_NO	NUMBER
	private int userNo;			//	USER_NO	NUMBER
	private int regionNo;		//	REGION_NO	NUMBER
	private String cn;
	
	// 썸네일 경로포함 파일명
	private String titleImg;
	
	private String filePath;




	public Product() {}


	// 리스트 조회용 생성자
	public Product(int productNo, String productName, int price, String deleteStatus, int categoryNo, int userNo,
			int regionNo, String titleImg) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
		this.deleteStatus = deleteStatus;
		this.categoryNo = categoryNo;
		this.userNo = userNo;
		this.regionNo = regionNo;
		this.titleImg = titleImg;
	}



	public Product(int productNo, String productName, String productStatus, int price, Date createdAt,
			String deleteStatus, String description, int productViews, int categoryNo, int userNo, int regionNo,
			String cn, String titleImg, String filePath) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productStatus = productStatus;
		this.price = price;
		this.createdAt = createdAt;
		this.deleteStatus = deleteStatus;
		this.description = description;
		this.productViews = productViews;
		this.categoryNo = categoryNo;
		this.userNo = userNo;
		this.regionNo = regionNo;
		this.cn = cn;
		this.titleImg = titleImg;
		this.filePath = filePath;
	}




	// 상품 등록용 생성자 : productName, price, description, categoryNo, regionNo
	
	public Product(int productNo, String productName, int productViews, String titleImg) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productViews = productViews;
		this.titleImg = titleImg;
	}



	public Product(String productName, int price, String description, String cn, int regionNo) {
		super();
		this.productName = productName;
		this.price = price;
		this.description = description;
		this.cn = cn;
		this.regionNo = regionNo;
	}

	// searchList 용 생성자
	public Product(int productNo, String productName, int price) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
	}

	// 판매내역 조회용 생성자
	public Product(int productNo, String productName, int price, Date createdAt, String filePath, String cn) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
		this.createdAt = createdAt;
		this.filePath = filePath;
		this.cn = cn;
		
	}
	

		public Product(String productName, String productStatus, int price, String deleteStatus, String description,
				int categoryNo, int regionNo) {
			super();
			this.productName = productName;
			this.productStatus = productStatus;
			this.price = price;
			this.deleteStatus = deleteStatus;
			this.description = description;
			this.categoryNo = categoryNo;
			this.regionNo = regionNo;
		}


		public Product(String productName, String productStatus, int price, String description, int categoryNo,
				int regionNo) {
			super();
			this.productName = productName;
			this.productStatus = productStatus;
			this.price = price;
			this.description = description;
			this.categoryNo = categoryNo;
			this.regionNo = regionNo;
		}


		public Product(int productNo, String productName, String productStatus, int price, Date createdAt,
				String description, int categoryNo, int regionNo) {
			super();
			this.productNo = productNo;
			this.productName = productName;
			this.productStatus = productStatus;
			this.price = price;
			this.createdAt = createdAt;
			this.description = description;
			this.categoryNo = categoryNo;
			this.regionNo = regionNo;
		}
		
		public Product(int productNo, String productName, String productStatus, int price, Date createdAt,
				String deleteStatus, String description, int productViews, int categoryNo, int userNo, int regionNo) {
			super();
			this.productNo = productNo;
			this.productName = productName;
			this.productStatus = productStatus;
			this.price = price;
			this.createdAt = createdAt;
			this.deleteStatus = deleteStatus;
			this.description = description;
			this.productViews = productViews;
			this.categoryNo = categoryNo;
			this.userNo = userNo;
			this.regionNo = regionNo;
		}



	public String getCn() {
		return cn;
	}

	public void setCn(String cn) {
		this.cn = cn;
	}

	

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	
	public int getProductViews() {
		return productViews;
	}



	public void setProductViews(int productViews) {
		this.productViews = productViews;
	}



	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getRegionNo() {
		return regionNo;
	}

	public void setRegionNo(int regionNo) {
		this.regionNo = regionNo;
	}

	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}



	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}



	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productStatus=" + productStatus
				+ ", price=" + price + ", createdAt=" + createdAt + ", deleteStatus=" + deleteStatus + ", description="
				+ description + ", productViews=" + productViews + ", categoryNo=" + categoryNo + ", userNo=" + userNo
				+ ", regionNo=" + regionNo + ", cn=" + cn + ", titleImg=" + titleImg + ", filePath=" + filePath + "]";
	}







	
	
}
