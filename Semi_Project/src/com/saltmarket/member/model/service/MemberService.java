package com.saltmarket.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.saltmarket.common.JDBCTemplate;
import com.saltmarket.common.model.vo.ProfileImg;
import com.saltmarket.common.model.vo.Region;
import com.saltmarket.member.model.dao.MemberDao;
import com.saltmarket.member.model.vo.Member;
import com.saltmarket.product.model.vo.Product;

public class MemberService {
	
	// 로그인 요청 서비스
	public Member loginMember(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, m);
		
		JDBCTemplate.close(conn);
		
		return loginUser;
	}
	
	// 회원 전체 조회
	public ArrayList<Member> selectMemberList() {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		ArrayList<Member> mList = new MemberDao().selectMemberList(conn);
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return mList;
	}
	
	// 회원가입용 서비스
	public int insertMember(Member m) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		int result = new MemberDao().insertMember(conn, m);
		
		// 트랜잭션 처리
		if(result > 0) { // 성공
			JDBCTemplate.commit(conn);
		} else { // 실패
			JDBCTemplate.rollback(conn);
		}
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return result;
	}
	
	// 지역 전체 조회용 서비스
	public ArrayList<Region> selectRegionList() {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		ArrayList<Region> regionList = new MemberDao().selectRegionList(conn);
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return regionList;
	}
	
	// 회원정보 변경용 서비스
	public Member updateMember(Member m) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		// UPDATE 요청
		int result = new MemberDao().updateMember(conn, m);
		
		// SELECT 요청 + 트랜잭션 처리
		Member updateMem = null;
		
		if(result > 0) { // 회원정보 변경 성공 => commit 후 갱신된 회원정보 다시 조회
			
			JDBCTemplate.commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
			
		} else { // 회원정보 변경 실패 => rollback
			
			JDBCTemplate.rollback(conn);
		}
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환 (회원정보 변경 실패 시 null 이 담겨 있음)
		return updateMem;
	}
	
	// 비밀번호 변경용 서비스
	public Member updatePwdMember(Member m, String updatePwd) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		// 비밀번호 변경용 UPDATE 요청 
		int result = new MemberDao().updatePwdMember(conn, m, updatePwd);
		
		// 갱신된 회원 객체 다시 조회해오기
		Member updateMem = null;
		
		if(result > 0) { // 비밀번호 변경 성공 => commit 후 갱신된 회원정보 다시 조회
			
			JDBCTemplate.commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
			
		} else { // 비밀번호 변경 실패 => rollback
			
			JDBCTemplate.rollback(conn);
		}
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환 (비밀번호 변경 실패 시 null 이 담겨 있음)
		return updateMem;
	}

	// 회원탈퇴용 서비스
	public int deleteMember(Member m) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		int result = new MemberDao().deleteMember(conn, m);
		
		// 트랜잭션 처리
		if(result > 0) { // 탈퇴 성공
			JDBCTemplate.commit(conn);
		} else { // 탈퇴 실패
			JDBCTemplate.rollback(conn);
		}
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return result;
	}
	
	// 아이디 중복 확인용 서비스
	public int idCheck(String checkId) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		int count = new MemberDao().idCheck(conn, checkId);
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return count;
	}
	
	// 등급명 조회용 서비스
	public String selectMemberGrade(int userNo) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		String gradeName = new MemberDao().selectMemberGrade(conn, userNo);
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return gradeName;
	}
	
	// 비밀번호 찾기용 서비스
	public String searchPwdMember(Member m) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		String searchPwd = new MemberDao().searchPwdMember(conn, m);
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return searchPwd;
	}
	
	// 아이디 찾기용 서비스
	public String searchIdMember(Member m) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		String searchId = new MemberDao().searchIdMember(conn, m);
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return searchId;
	}

	// 찜 목록 조회용 서비스
	public ArrayList<Product> selectWishList(int userNo) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		ArrayList<Product> wishList = new MemberDao().selectWishList(conn, userNo);
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return wishList;
	}
	
	// 판매내역 조회용 서비스
	public ArrayList<Product> selectSellList(int userNo) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		ArrayList<Product> sellList = new MemberDao().selectSellList(conn, userNo);
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return sellList;
	}
	
	// 판매상품 갯수 조회용 서비스
	public int selectSellCount(int userNo) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		int sellCount = new MemberDao().selectSellCount(conn, userNo);
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return sellCount;
	}
	
	// 프로필 변경용 서비스
	public int updateProfileMember(int userNo, String userName, ProfileImg pImg) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		int result1 = new MemberDao().updateProfileName(conn, userNo, userName);
		
		int result2 = 1;
		
		if(pImg != null) { // pImg 가 null 이 아닐 때 요청, 새로운 첨부파일이 있을 경우
			if(pImg.getFileNo() != 0) { // 기존 파일이 있을 경우(파일번호가 없어야 0)
				
				result2 = new MemberDao().updateProfileImg(conn, userNo, pImg);
				
			} else { // 기존 파일 없이 새로운 파일이 있을 경우
				
				result2 = new MemberDao().insertProfileImg(conn, userNo, pImg);
			}
		}
		
		// 트랜잭션 처리
		if(result1 > 0 && result2 > 0) { // 둘 다 성공했을 경우
			JDBCTemplate.commit(conn);
		} else { // 하나라도 실패할 경우
			JDBCTemplate.rollback(conn);
		}
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return result1 * result2; // 1 또는 0
	}
	
	// 기존 프로필 이미지 조회
	public ProfileImg selectProfileImg(int userNo) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		ProfileImg pImg = new MemberDao().selectProfileImg(conn, userNo);
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return pImg;
	}
	
	// 마이페이지 회원 조회
	public Member selectMyPageMember(int userNo, String userId) {
		
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		// 회원 조회
		Member m = new MemberDao().selectMember(conn, userId);
		
		// 등급명 조회
		String gradeName = new MemberDao().selectMemberGrade(conn, userNo);
		
		// Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 결과 반환
		return m;
	}
}




