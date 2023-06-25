package com.saltmarket.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.saltmarket.common.JDBCTemplate;
import com.saltmarket.common.model.vo.ProfileImg;
import com.saltmarket.common.model.vo.Region;
import com.saltmarket.member.model.vo.Member;
import com.saltmarket.product.model.vo.Product;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, Member m) {
		
		// 변수 셋팅
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 실행할 쿼리문
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(rset.getInt("USER_NO")
						             , rset.getString("USER_ID")
						             , rset.getString("USER_PWD")
						             , rset.getString("USER_NAME")
						             , rset.getString("PHONE")
						             , rset.getString("EMAIL")
						             , rset.getString("ADDRESS")
						             , rset.getDate("ENROLL_DATE")
						             , rset.getString("STATUS")
						             , rset.getDouble("SALTY_SCORE")
						             , rset.getInt("GRADE_NO")
						             , rset.getInt("REGION_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return loginUser;
	}
	
	public ArrayList<Member> selectMemberList(Connection conn) {
		
		// SELECT 문 => ResultSet (여러행 조회)
		// 필요한 변수, 쿼리문 셋팅
		ArrayList<Member> mList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberList");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 조회된 결과를 VO 로 가공
			while(rset.next()) {
				mList.add(new Member(rset.getInt("USER_NO")
			                       , rset.getString("USER_ID")
			                       , rset.getString("USER_PWD")
			                       , rset.getString("USER_NAME")
			                       , rset.getString("PHONE")
			                       , rset.getString("EMAIL")
			                       , rset.getString("ADDRESS")
			                       , rset.getDate("ENROLL_DATE")
			                       , rset.getString("STATUS")
			                       , rset.getDouble("SALTY_SCORE")
			                       , rset.getInt("GRADE_NO")
			                       , rset.getInt("REGION_NO")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return mList;
	}
	
	public int insertMember(Connection conn, Member m) {
		
		// INSERT 문  => int (처리된 행의 갯수)
		// 필요한 변수, 쿼리문 셋팅
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getAddress());
			
			// 쿼리문 실행 후 결과 받기
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 자원 반납
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return result;
	}
	
	public ArrayList<Region> selectRegionList(Connection conn) {
		
		// SELECT 문 => ResultSet (여러행 조회) => ArrayList<Region>
		// 필요한 변수, 쿼리문 셋팅
		ArrayList<Region> regionList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRegionList");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 조회된 결과를 VO 로 가공
			while(rset.next()) {
				
				regionList.add(new Region(rset.getInt("REGION_NO")
										, rset.getString("REGION_NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return regionList;
	}
	
	public int updateMember(Connection conn, Member m) {
		
		// UPDATE 문 => int (처리된 행의 갯수)
		// 필요한 변수, 쿼리문 셋팅
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getAddress());
			pstmt.setInt(5, m.getRegionNo());
			pstmt.setString(6, m.getUserId());
			
			// 쿼리문 실행 후 결과 받기
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return result;
	}
	
	public Member selectMember(Connection conn, String userId) {
		
		// SELECT 문 => ResultSet 객체 (단일행 조회) => Member 객체
		// 필요한 변수, 쿼리문 셋팅
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setString(1, userId);
			
			// 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 조회된 결과를 VO 로 가공
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
			// 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return m;
	}
	
	public int updatePwdMember(Connection conn, Member m, String updatePwd) {
		
		// UPDATE 문 => int (처리된 행의 갯수)
		// 필요한 변수, 쿼리문 셋팅
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, m.getUserId());
			pstmt.setString(3, m.getUserPwd());
			
			// 쿼리문 실행 후 결과 받기
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return result;
	}

	public int deleteMember(Connection conn, Member m) {
		
		// DELETE 문 => int (처리된 행의 갯수)
		// 필요한 변수, 쿼리문 셋팅
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			
			// 쿼리문 실행 후 결과 받기
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return result;
	}
	
	public int idCheck(Connection conn, String checkId) {
		
		// SELECT 문 => ResultSet (단일행, 숫자 1개)
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성
			pstmt.setString(1, checkId);
			
			// 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 조회된 결과를 변수에 담기
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return count;
	}
	
	public String selectMemberGrade(Connection conn, int userNo) {
		
		// SELECT 문 => ResultSet (단일행 조회)
		// 필요한 변수, 쿼리문 셋팅
		String gradeName = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberGrade");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setInt(1, userNo);
			
			// 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 조회된 결과를 변수에 담기
			if(rset.next()) {
				gradeName = rset.getString("GRADE_NAME");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return gradeName;
	}
	
	public String searchPwdMember(Connection conn, Member m) {
		
		// SELECT문 => ResultSet (단일행) => Member 객체
		// 필요한 변수, 쿼리문 셋팅
		String searchPwd = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchPwdMember");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getEmail());
			
			// 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 조회된 결과를 변수에 담기
			if(rset.next()) {
				searchPwd = rset.getString("USER_PWD");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return searchPwd;
	}
	
	public String searchIdMember(Connection conn, Member m) {
		
		// SELECT문 => ResultSet (단일행) => Member 객체
		// 필요한 변수, 쿼리문 셋팅
		String searchId = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchIdMember");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getEmail());
			
			// 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 조회된 결과를 변수에 담기
			if(rset.next()) {
				searchId = rset.getString("USER_ID");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return searchId;
	}
	
	public ArrayList<Product> selectWishList(Connection conn, int userNo) {
		
		// SELECT문 => ResultSet (여러행 조회) => ArrayList<Product> 객체
		// 필요한 변수, 쿼리문 셋팅
		ArrayList<Product> wishList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWishList");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setInt(1, userNo);
			
			// 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 조회된 결과를 VO 로 가공
			while(rset.next()) {
				wishList.add(new Product(rset.getInt("PRODUCT_NO")
						               , rset.getString("PRODUCT_NAME")
						               , rset.getInt("PRICE")
						               , rset.getDate("CREATED_AT")
						               , rset.getString("FILE_PATH")
						               , rset.getString("CHANGE_FILE_NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return wishList;
	}
	
	public ArrayList<Product> selectSellList(Connection conn, int userNo) {
		
		// SELECT문 => ResultSet (여러행 조회) => ArrayList<Product> 객체
		// 필요한 변수, 쿼리문 셋팅
		ArrayList<Product> sellList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSellList");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setInt(1, userNo);
			
			// 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 조회된 결과를 VO 로 가공
			while(rset.next()) {
				sellList.add(new Product(rset.getInt("PRODUCT_NO")
						               , rset.getString("PRODUCT_NAME")
						               , rset.getInt("PRICE")
						               , rset.getDate("CREATED_AT")
						               , rset.getString("FILE_PATH")
						               , rset.getString("CHANGE_FILE_NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}	
		// 결과 반환
		return sellList;
	}
	
	public int selectSellCount(Connection conn, int userNo) {
		
		// SELECT문 => ResultSet (단일행 조회) => int
		int sellCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSellCount");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setInt(1, userNo);
			
			// 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 조회된 결과를 변수에 담기
			if(rset.next()) {
				sellCount = rset.getInt("PCOUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return sellCount;
	}
	
	public int updateProfileName(Connection conn, int userNo, String userName) {
		
		// UPDATE문 => int (처리된 행의 갯수)
		// 필요한 변수, 쿼리문 셋팅
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProfileName");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setString(1, userName);
			pstmt.setInt(2, userNo);
			
			// 쿼리문 실행 후 결과 받기
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return result;
	}
	
	// 기존 프로필 이미지 조회용 서비스
	public ProfileImg selectProfileImg(Connection conn, int userNo) {
		
		// SELECT 문 => ResultSet (단일행) => ProfileImg 객체
		// 필요한 변수, 쿼리문 셋팅
		ProfileImg pImg = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProfileImg");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setInt(1, userNo);
			
			// 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 조회된 결과를 VO 로 가공
			if(rset.next()) {
				pImg = new ProfileImg();
				pImg.setFileNo(rset.getInt("FILE_NO"));
				pImg.setOriginName(rset.getString("ORIGIN_NAME"));
				pImg.setChangeName(rset.getString("CHANGE_NAME"));
				pImg.setFilePath(rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return pImg;
	}
	
	// 기존 프로필 이미지 변경용 서비스
	public int updateProfileImg(Connection conn, int userNo, ProfileImg pImg) {
		
		// UPDATE문 => int (처리된 행의 갯수)
		// 필요한 변수, 쿼리문 셋팅
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProfileImg");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setString(1, pImg.getOriginName());
			pstmt.setString(2, pImg.getChangeName());
			pstmt.setString(3, pImg.getFilePath());
			pstmt.setInt(4, userNo);
			pstmt.setInt(5, pImg.getFileNo());
			
			// 쿼리문 실행 후 결과 받기
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return result;
	}
	
	// 새로운 프로필 이미지 추가용 서비스
	public int insertProfileImg(Connection conn, int userNo, ProfileImg pImg) {
		
		// INSERT문 => int (처리된 행의 갯수)
		// 필요한 변수, 쿼리문 셋팅
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProfileImg");
		
		try {
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 미완성된 쿼리문 완성시키기
			pstmt.setString(1, pImg.getOriginName());
			pstmt.setString(2, pImg.getChangeName());
			pstmt.setString(3, pImg.getFilePath());
			pstmt.setInt(4, userNo);
			
			// 쿼리문 실행 후 결과 받기
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return result;
	}
}




