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
import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.common.model.vo.Region;
import com.saltmarket.product.model.service.ProductRegistrationService;
import com.saltmarket.product.model.vo.Product;

public class ProductRegistrationDao {
	
	// 기본 세팅
	
			private Properties prop = new Properties();
			
			public ProductRegistrationDao() {
				
				String fileName = ProductRegistrationDao.class.getResource("/sql/product/productRegistration-mapper.xml").getPath();
				
				try {
					prop.loadFromXML(new FileInputStream(fileName));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	
	
	public ArrayList<Region> selectRegionList(Connection conn) {
		
		// SELECT 문 => ResultSet (여러 행 ) => ArrayList<Region>
		
		// 1.  필요한 변수들 먼저 셋팅
		ArrayList<Region> regionList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 실행할 쿼리문
		String sql = prop.getProperty("selectRegionList");
		
		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 3_1. 미완성된 쿼리문 완성(mapper에서 완성)
			
			// 3_2. 쿼리문 실행 후 결과받기
			rset = pstmt.executeQuery();
			
			// 4. 조회된 결과를 VO로 가공
			while(rset.next()) {
				regionList.add(new Region(rset.getInt("REGION_NO")
														, rset.getString("REGION_NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 5. 자원반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		// 6. 결과 반환
		return regionList;
	}
	
	// 상품 등록용 Dao
	
	public int insertProduct(Connection conn, Product p) {
		
		// INSERT 문 => int (처리된 행의 갯수)
		
		// 1. 필요한 변수들 먼저 셋팅
		int result = 0;
		PreparedStatement pstmt = null;
		
		// 실행할 쿼리문
		String sql = prop.getProperty("insertProduct");
		
		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 3_1 미완성된 커리문 완성
			pstmt.setString(1, p.getProductName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setString(3, p.getDescription());
			pstmt.setInt(4, p.getCategoryNo());
			pstmt.setInt(5, p.getUserNo());
			pstmt.setInt(6, p.getRegionNo());
			
			// 3_2. 쿼리문 실행 후 결과 받기
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 4. 자원반납
			JDBCTemplate.close(pstmt);
			// conn 반납 하면 안됨 
		}
		// 5. 결과 반환
		return result;
	}
	
	// 이미지 파일 insert Dao
	
	public int insertProductImg(Connection conn, ImgFile img) {
		
		
		// 1. 필요한 변수 먼저 셋팅
		int result = 0;
		// insert 를 반복해서 진행 => 하나라도 실패할 경우 실패처리
		// result 를 애초에 1로 셋팅해두고 누적 곱을 구할 예정
		
		PreparedStatement pstmt = null;
		
		// 실행할 쿼리문
		String sql = prop.getProperty("insertProductImgList");
		
		// PreparedStatement 객체 생성 시 쿼리문을 미리 보냄
		// -> 즉, pstmt 객체 1개당 쿼리문 1개만 실행
		
			try {

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, img.getOriginName());
				pstmt.setString(2,  img.getChangeFileName());
				pstmt.setString(3,  img.getFilePath());
				pstmt.setInt(4, img.getFileLevel());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				
				// 자원반납
				JDBCTemplate.close(pstmt);
			}
			
			// 결과 반환
			return result;
	}
	
	// 상품 삭제용 Dao
	
	public int deleteProduct(Connection conn, int productNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteProduct");
		
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
	
	// 이미지 조회용 Dao
	
public ImgFile selectImgFileList(Connection conn, int productNo) {
		
		ImgFile img = new ImgFile();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImageFileList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();

			while(rset.next()) {
			img.setFileNo(rset.getInt("FILE_NO"));
			img.setOriginName(rset.getString("ORIGIN_NAME"));
			img.setChangeFileName(rset.getString("CHANGE_FILE_NAME"));
			img.setFilePath(rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return img;
	}
	
	// 상품 업데이트용 Service

	public int updateProduct(Connection conn, Product p) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateProduct");
		
		try {
			
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, p.getProductName());
				pstmt.setString(2, p.getProductStatus());
				pstmt.setInt(3, p.getPrice());
				pstmt.setString(4, p.getDescription());
				pstmt.setInt(5, p.getCategoryNo());
				pstmt.setInt(6, p.getRegionNo());
				pstmt.setInt(7, p.getProductNo());
				
				result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	// 이미지 수정 
	
	public int updateImg(Connection conn, ImgFile img) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateImgFile");		
			
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, img.getOriginName());
			pstmt.setString(2,  img.getChangeFileName());
			pstmt.setString(3, img.getFilePath());
			pstmt.setInt(4, img.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		 return result;
		
		}
	
	// 상품 전체 조회용
	public ArrayList<Product> selectProductList(Connection conn) {
		
		// SELECT 문 => ResultSet (여러 행 ) => ArrayList<Region>
		
		// 1.  필요한 변수들 먼저 셋팅
		ArrayList<Product> plist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 실행할 쿼리문
		String sql = prop.getProperty("selectProductList");
		
		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 3_1. 미완성된 쿼리문 완성(mapper에서 완성)
			
			// 3_2. 쿼리문 실행 후 결과받기
			rset = pstmt.executeQuery();
			
			// 4. 조회된 결과를 VO로 가공
			while(rset.next()) {
				plist.add(new Product(rset.getInt("PRODUCT_NO")
						   , rset.getString("PRODUCT_NAME")
						   , rset.getString("PRODUCT_STATUS")
						   , rset.getInt("PRICE")
						   , rset.getDate("CREATED_AT")
						   , rset.getString("DELETE_STATUS")
						   , rset.getString("DESCRIPTION")
						   , rset.getInt("PRODUCT_VIEWS")
						   , rset.getInt("CATEGORY_NO")
						   , rset.getInt("USER_NO")
						   , rset.getInt("REGION_NO")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 5. 자원반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		// 6. 결과 반환
		return plist;
	}
}
