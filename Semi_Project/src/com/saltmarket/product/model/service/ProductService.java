package com.saltmarket.product.model.service;

import static com.saltmarket.common.JDBCTemplate.close;
import static com.saltmarket.common.JDBCTemplate.commit;
import static com.saltmarket.common.JDBCTemplate.getConnection;
import static com.saltmarket.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.saltmarket.common.JDBCTemplate;
import com.saltmarket.common.model.vo.Declaration;
import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.common.model.vo.PageInfo;
import com.saltmarket.common.model.vo.Region;
import com.saltmarket.member.model.dao.MemberDao;
import com.saltmarket.member.model.vo.Member;
import com.saltmarket.product.model.dao.ProductDao;
import com.saltmarket.product.model.vo.Category;
import com.saltmarket.product.model.vo.Product;
import com.saltmarket.product.model.vo.WishList;

public class ProductService {

	// 상품 갯수 조회
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectListCount(conn);
		close(conn);
		
		return listCount;
	}
	
	// 상품 갯수 조회(category)
	public int selectListCount(int category) {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectListCount(conn, category);
		close(conn);
		
		return listCount;
	}
	
	// 검색 keyword용 상품 갯수 조회
	public int selectListCount(String keyword) {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectListCount(conn, keyword);
		close(conn);
		
		return listCount;
	}
		
	// 검색어 조회
	public ArrayList<Product> selectSearchList(PageInfo pi, String keyword){
		Connection conn = getConnection();
		ArrayList<Product> searchList = new ProductDao().selectSearchList(conn, pi, keyword);
		close(conn);
		
		return searchList;
	}

	// 상품 전체 조회
	public ArrayList<Product> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Product> plist = new ProductDao().selectList(conn, pi);
		close(conn);
		
		return plist;
	}
	public ArrayList<Product> selectList(){
		Connection conn = getConnection();
		ArrayList<Product> plist = new ProductDao().selectList(conn);
		close(conn);
		
		return plist;
	}
	
	// 다른 프로필 조회: 이름, 염도용
	public Member selectSellerProfile() {
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new ProductDao().selectSellerProfile(conn);
		
		close(conn);
		
		return m;
	}
	public String selectSellerProfileGrade() {
		Connection conn = getConnection();
		
		String g = new ProductDao().selectSellerProfileGrade(conn);
		
		close(conn);
		
		return g;
	}
	
	// 프로필용 상품 조회
	public ImgFile selectProfileImgFile(int productNo){
		Connection conn = getConnection();
		ImgFile imgList = new ProductDao().selectProfileImgFile(conn, productNo);
		close(conn);
		
		return imgList;
	}
	
	// 카테고리 전체 조회
	public ArrayList<Category> selectCategoryList(){
		Connection conn = getConnection();
		
		ArrayList<Category> clist = new ProductDao().selectCategoryList(conn);

		close(conn);
		
		return clist;
	}
	
	// 카테고리 필터링
	public ArrayList<Product> selectCategoryFilter(int categoryNo, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectCategoryFilter(conn, categoryNo, pi);
		close(conn);
		
		return list;
	}
		
	// 조회수 증가
	public int increaseCount(int productNo) {
		Connection conn = getConnection();
		int result = new ProductDao().increaseCount(conn, productNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 상품 상세보기
	public Product selectProduct(int productNo) {
		Connection conn = getConnection();
		Product p = new ProductDao().selectProduct(conn, productNo);
		
		close(conn);
		
		return p;
	}

	// 이미지 목록 조회
	public ArrayList<Product> selectThumbnailList(){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectThumbnailList(conn);
		close(conn);
		
		return list;
	}
	// 이미지 파일 목록 조회
	public ArrayList<ImgFile> selectImgFileList(int productNo){
		Connection conn = getConnection();
		ArrayList<ImgFile> imgList = new ProductDao().selectImgFileList(conn, productNo);
		close(conn);
		
		return imgList;
	}
	
	// 찜체크
	public int selectWishListCheck(int userNo, int productNo) {
		Connection conn = getConnection();
		int count = new ProductDao().selectWishListCheck(conn, userNo, productNo);
		close(conn);
		
		return count;
	}
	// 찜목록
	public ArrayList<WishList> selectWishList(int userNo, int productNo) {
		Connection conn = getConnection();
		ArrayList<WishList> list = new ProductDao().selectWishList(conn, userNo, productNo);
		close(conn);
		
		return list;
	}
	// 찜하기
	public int insertWishList(int userNo, int productNo) {
		Connection conn = getConnection();
		int result = new ProductDao().insertWishList(conn, userNo, productNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	// 찜해제
	public int deleteWishList(int userNo, int productNo) {
		Connection conn = getConnection();
		int result = new ProductDao().deleteWishList(conn, userNo, productNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 신고하기
	public int insertDeclare(int userNo, Declaration d, ArrayList<ImgFile> list) {
		Connection conn = getConnection();
		int result1 = new ProductDao().insertDeclare(conn, userNo, d);
		int result2 = new ProductDao().insertDeclareImg(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	// 소금점수 올리기
	public int updateScore(int userNo, double score) {
		Connection conn = getConnection();
		int result = new ProductDao().updateScore(conn, userNo, score);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 거래......
	
	// 지역 조회
	public Region selectRegion(int userNo) {
		Connection conn = getConnection();
		Region r = new ProductDao().selectRegion(conn, userNo);
		close(conn);
		
		return r;
	}
	// rank
	public ArrayList<Product> selectProductRank(){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductRank(conn);
		close(conn);
		
		return list;
	}
	/////
	
	// 등급명 조회용 서비스
	public String selectMemberGrade(int userNo) {
		Connection conn = getConnection();
		String gradeName = new MemberDao().selectMemberGrade(conn, userNo);
		close(conn);
		
		return gradeName;
	}
	
	// 관리자 신고 조회용 서비스
	public ArrayList<Declaration> selectDeclareList(){
		
		Connection conn = getConnection();
        try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		ArrayList<Declaration> list = new ProductDao().selectDeclareList(conn);

		close(conn);
		
		return list;
	}

	public Declaration selectProductDeclare(int declareNo) {
		
		Connection conn = getConnection();
        try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		Declaration d = new ProductDao().selectProductDeclare(conn, declareNo);
		close(conn);
		
		return d;
	}

	public int updateDeclare(Declaration d) {
		
		Connection conn = getConnection();
        try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		int result = new ProductDao().updateDeclare(conn, d);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public Declaration selectCommunityDeclare(int declareNo) {
		
		Connection conn = getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		Declaration d = new ProductDao().selectCommunityDeclare(conn, declareNo);
		close(conn);
		
		return d;
	}
}
