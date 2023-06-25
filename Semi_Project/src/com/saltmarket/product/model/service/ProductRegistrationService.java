package com.saltmarket.product.model.service;

import static com.saltmarket.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.common.model.vo.Region;
import com.saltmarket.product.model.dao.ProductRegistrationDao;
import com.saltmarket.product.model.vo.Product;

public class ProductRegistrationService {

		// 지역 전체 조회용 서비스
		public ArrayList<Region> selectRegionList() {
			
			// 1. Connection객체 생성
			Connection conn = getConnection();
			
			// 2. Dao로 만들어진 Connection과 전달값 전달 후 결과 받기
			ArrayList<Region> regionList = new ProductRegistrationDao().selectRegionList(conn);
			
			// 3. 트랙잭션 처리 => SELECT문이므로 패스
			
			// 4. Connection반납
			close(conn);
			
			// 결과반납
			return regionList;
		}
		
		// 상품 등록 Service
		public int insertProduct(Product p, ImgFile img) {
			
			// 1. Connection 객체 생성
			Connection conn = getConnection();
			
			// 2. Dao 로 만들어진 Connection 과 전달값 넘기면서 요청후 결과 받기
			// 일단, product 정보만 insert
			int result1 = new ProductRegistrationDao().insertProduct(conn, p);
			
			// result1 에는 1 또는 0이 들어있음
			
			// 2_2. 이미지 파일의 INSERT 진행 
			
			
			int result2 = new ProductRegistrationDao().insertProductImg(conn, img);
			
			
			// 3. 트랜잭션 처리
			
			if(result1>0 && result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			// 4. Connection 반납
			 close(conn);
			 
			 // 5. 결과 반환
			 return result1*result2;
		}
		
		// 상품 삭제 Service
		
		public int deleteProduct(int productNo) {
			
			Connection conn = getConnection();
			
			int result = new ProductRegistrationDao().deleteProduct(conn, productNo);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			close(conn);
			return result;
		}
		
		// 이미지 조회용 Service
		
		public ImgFile selectImgFileList(int productNo) {
			
			Connection conn = getConnection();
			ImgFile img = new ProductRegistrationDao().selectImgFileList(conn, productNo);
			close(conn);
			return img;
			
		}
		
		// 상품 수정용 서비스
		public int updateProduct(Product p, ImgFile img) {
						
			Connection conn = getConnection();
			
			int result1 = new ProductRegistrationDao().updateProduct(conn, p);
			
			int result2 = 1;
			
			result2 = new ProductRegistrationDao().updateImg(conn, img);
			
			if(result1>0 && result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			// 4. Connection 반납
			 close(conn);
			 
			 // 5. 결과 반환
			 return result1*result2;
		}
		
		// 상품 전체 조회용 서비스
		public ArrayList<Product> selectProductList() {
			
			Connection conn = getConnection();
			ArrayList<Product> plist = new ProductRegistrationDao().selectProductList(conn);
			close(conn);
			
			return plist;
			
		}
		
}
		

