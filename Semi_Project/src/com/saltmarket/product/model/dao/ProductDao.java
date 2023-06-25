package com.saltmarket.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.saltmarket.common.JDBCTemplate;
import com.saltmarket.common.model.vo.Declaration;
import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.common.model.vo.PageInfo;
import com.saltmarket.common.model.vo.Region;
import com.saltmarket.member.model.vo.Member;
import com.saltmarket.notice.model.vo.Attachment;
import com.saltmarket.product.model.vo.Category;
import com.saltmarket.product.model.vo.Product;
import com.saltmarket.product.model.vo.WishList;

public class ProductDao {
	private Properties prop = new Properties();
	
	public ProductDao() {
		String fileName = ProductDao.class.getResource("/sql/product/product-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("PCOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}
	
	// category 용 listcount
	public int selectListCount(Connection conn, int category) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCountCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("PCOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}
	
	// 검색용 listCount
	public int selectListCount(Connection conn, String keyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCountKeyword");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("PCOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}
	
	// 검색어 조회
	public ArrayList<Product> selectSearchList(Connection conn, PageInfo pi, String keyword){
		ArrayList<Product> searchList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + keyword + "%");
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				searchList.add(new Product(rset.getInt("PRODUCT_NO")
						   , rset.getString("PRODUCT_NAME")
						   , rset.getInt("PRICE")
						   , rset.getString("DELETE_STATUS")
						   , rset.getInt("CATEGORY_NO")
						   , rset.getInt("USER_NO")
						   , rset.getInt("REGION_NO")
						   , rset.getString("TITLEIMG")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return searchList;
	}

	// 상품 전체 조회
	public ArrayList<Product> selectList(Connection conn, PageInfo pi){
		ArrayList<Product> plist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				plist.add(new Product(rset.getInt("PRODUCT_NO")
								   , rset.getString("PRODUCT_NAME")
								   , rset.getInt("PRICE")
								   , rset.getString("DELETE_STATUS")
								   , rset.getInt("CATEGORY_NO")
								   , rset.getInt("USER_NO")
								   , rset.getInt("REGION_NO")
								   , rset.getString("TITLEIMG")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return plist;
	}
	// 단순 상품 전체 조회
	public ArrayList<Product> selectList(Connection conn){
		ArrayList<Product> plist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListNoPage");
		
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				plist.add(new Product(rset.getInt("PRODUCT_NO")
								   , rset.getString("PRODUCT_NAME")
								   , rset.getInt("PRICE")
								   , rset.getString("DELETE_STATUS")
								   , rset.getInt("CATEGORY_NO")
								   , rset.getInt("USER_NO")
								   , rset.getInt("REGION_NO")
								   , rset.getString("TITLEIMG")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return plist;
	}
	// 다른 프로필 조회: 이름, 염도용
	public Member selectSellerProfile(Connection conn) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSellerProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				m.setUserNo(rset.getInt("USER_NO"));
				m.setUserId(rset.getString("USER_ID"));
				m.setUserPwd(rset.getString("USER_PWD"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setStatus(rset.getString("STATUS"));
				m.setSaltyScore(rset.getDouble("SALTY_SCORE"));
				m.setGradeNo(rset.getInt("GRADE_NO"));
				m.setRegionNo(rset.getInt("REGION_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
	public String selectSellerProfileGrade(Connection conn) {
		String gradeName = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSellerProfileGrade");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				gradeName = rset.getString("GRADE_NAME");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return gradeName;
	}

	// 프로필용 상품 조회
	public ImgFile selectProfileImgFile(Connection conn, int productNo){
		ImgFile img = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProfileImgFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				img = new ImgFile();
				img.setTitleImg(rset.getString("TITLEIMG"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return img;
	}
	
	// 카테고리 목록 전체 조회
	public ArrayList<Category> selectCategoryList(Connection conn){
		ArrayList<Category> clist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				clist.add(new Category(rset.getInt("CATEGORY_NO")
									, rset.getString("CATEGORY_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return clist;
	}
	
	// 카테고리 필터링
	public ArrayList<Product> selectCategoryFilter(Connection conn, int categoryNo, PageInfo pi){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryFilter");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, categoryNo);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("PRODUCT_NO")
									, rset.getString("PRODUCT_NAME")
									, rset.getInt("PRICE")
									, rset.getString("DELETE_STATUS")
									, rset.getInt("CATEGORY_NO")
									, rset.getInt("USER_NO")
									, rset.getInt("REGION_NO")
									, rset.getString("TITLEIMG")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	// 조회수 증가
	public int increaseCount(Connection conn, int productNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	// 상품  상세 조회
	public Product selectProduct(Connection conn, int productNo) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				p = new Product();
				p.setProductNo(rset.getInt("PRODUCT_NO"));
				p.setCn(rset.getString("CN"));
				p.setProductName(rset.getString("PRODUCT_NAME"));
				p.setProductStatus(rset.getString("PRODUCT_STATUS"));
				p.setPrice(rset.getInt("PRICE"));
				p.setProductViews(rset.getInt("PRODUCT_VIEWS"));
				p.setDescription(rset.getString("DESCRIPTION"));
				p.setUserNo(rset.getInt("USER_NO"));
				p.setCreatedAt(rset.getDate("CREATED_AT"));
				
				p.setTitleImg(rset.getString("TITLEIMG"));
				
				if(p.getTitleImg() == null) {
					p.setTitleImg("resources/image/noimage.png");
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return p;
	}
	
	// 이미지 목록 조회
	public ArrayList<Product> selectThumbnailList(Connection conn){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectThumbnailList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setProductNo(rset.getInt("PRODUCT_NO"));
				p.setProductName(rset.getString("PRODUCT_NAME"));
				p.setProductViews(rset.getInt("PRODUCT_VIEWS"));
				p.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	// 상세페이지용 이미지 조회
	public ArrayList<ImgFile> selectImgFileList(Connection conn, int productNo){
		ArrayList<ImgFile> imgList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImgFile");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ImgFile img = new ImgFile();
				
				img.setFileNo(rset.getInt("FILE_NO"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setChangeFileName(rset.getString("CHANGE_FILE_NAME"));
				img.setTitleImg(rset.getString("TITLEIMG"));
				
				imgList.add(img);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return imgList;
	}

	
	// 찜체크
	public int selectWishListCheck(Connection conn, int userNo, int productNo) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWishListCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, productNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("CNT");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return count;
	}
	
	// 찜목록
	public ArrayList<WishList> selectWishList(Connection conn, int userNo, int productNo) {
		ArrayList<WishList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWishList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new WishList(userNo, productNo));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);;
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	// 찜하기
	public int insertWishList(Connection conn, int userNo, int productNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertWishList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, productNo);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	// 찜해제
	public int deleteWishList(Connection conn, int userNo, int productNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteWishList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, productNo);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	// 신고하기
	public int insertDeclare(Connection conn, int userNo, Declaration d) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertDeclare");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, d.getDeclareTitle());
			pstmt.setString(2, d.getDeclareContent());
			pstmt.setInt(3, userNo);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	// 신고 이미지 삽입
	public int insertDeclareImg(Connection conn, ArrayList<ImgFile> list) {
		int result = 1;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertDeclareImg");
		
		try {
			for(ImgFile img : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, img.getOriginName());
				pstmt.setString(2, img.getChangeFileName());
				pstmt.setString(3,  img.getFilePath());
				
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	// 소금점수 올리기
	public int updateScore(Connection conn, int userNo, double score) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateScore");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, score);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 지역 조회
	public Region selectRegion(Connection conn, int userNo) {
		Region r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRegion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				r = new Region();
				r.setRegionName(rset.getString("REGION_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return r;
	}
	// rank
	public ArrayList<Product> selectProductRank(Connection conn){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductRank");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				Product p = new Product();
				
				p.setProductNo(rset.getInt("PRODUCT_NO"));
				p.setProductName(rset.getString("PRODUCT_NAME"));
				p.setPrice(rset.getInt("PRICE"));
				p.setProductViews(rset.getInt("PRODUCT_VIEWS"));
				p.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(p);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	////
	
	// 등급명 조회용 서비스
	public String selectMemberGrade(Connection conn, int userNo) {
		
		String gradeName = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberGrade");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				gradeName = rset.getString("GRADE_NAME");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return gradeName;
	}
	
	public ArrayList<Declaration> selectDeclareList(Connection conn) {
		ArrayList<Declaration> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDeclareList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Declaration(rset.getInt("DECLARE_NO"),
										 rset.getString("DECLARE_TITLE"),
										 rset.getString("DECLARE_CONTENT"),
										 rset.getString("DECLARE_TYPE"),
										 rset.getInt("DECLARE_CHECK"),
										 rset.getDate("DECLARE_DATE"),
										 rset.getString("DECLARE_REASON"),
										 rset.getDate("DECLARE_CHECK_DATE"),
										 rset.getInt("USER_NO"),
										 rset.getString("USER_ID")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;

	}

	public Declaration selectProductDeclare(Connection conn, int declareNo) {
		Declaration d = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductDeclare");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, declareNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				d = new Declaration(rset.getInt("DECLARE_NO"),
									rset.getString("DECLARE_TITLE"),
									rset.getString("DECLARE_CONTENT"),
									rset.getString("DECLARE_TYPE"),
									rset.getInt("DECLARE_CHECK"),
									rset.getDate("DECLARE_DATE"),
									rset.getString("DECLARE_REASON"),
									rset.getDate("DECLARE_CHECK_DATE"),
									rset.getInt("USER_NO"),
									rset.getString("USER_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return d;
	}

	public int updateDeclare(Connection conn, Declaration d) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateDeclare");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, d.getDeclareCheck());
			pstmt.setString(2, d.getDeclareReason());
			pstmt.setInt(3, d.getDeclareNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public Declaration selectCommunityDeclare(Connection conn, int declareNo) {
		Declaration d = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCommunityDeclare");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, declareNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				d = new Declaration(rset.getInt("DECLARE_NO"),
									rset.getString("DECLARE_TITLE"),
									rset.getString("DECLARE_CONTENT"),
									rset.getString("DECLARE_TYPE"),
									rset.getInt("DECLARE_CHECK"),
									rset.getDate("DECLARE_DATE"),
									rset.getString("DECLARE_REASON"),
									rset.getDate("DECLARE_CHECK_DATE"),
									rset.getInt("FREE_BOARD_NO"),
									rset.getInt("SHARE_BOARD_NO"),
									rset.getInt("USER_NO"),
									rset.getString("USER_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return d;
	}
}
