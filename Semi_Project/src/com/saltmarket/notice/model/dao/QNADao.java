package com.saltmarket.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.saltmarket.common.JDBCTemplate;
import com.saltmarket.common.model.vo.PageInfo;
import com.saltmarket.notice.model.vo.Attachment;
import com.saltmarket.notice.model.vo.QNA;

public class QNADao {
    private Properties prop = new Properties();
	
	public QNADao() {
		
		String fileName = QNADao.class.getResource("/sql/notice/qna-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

    public int insertQNA(Connection conn,  QNA q) {
		
		// INSERT 문 => int (처리된 행의 갯수)

		// 1. 필요한 변수들 먼저 셋팅
		int result = 0;
		PreparedStatement pstmt = null;

		// 실행할 쿼리문
		String sql = prop.getProperty("insertQNA");

		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);

			// 3_1. 미완성된 쿼리문 완성시키기
			pstmt.setString(1, q.getqCategory());
			pstmt.setString(2, q.getqTitle());
			pstmt.setString(3, q.getqContent());
			pstmt.setInt(4, Integer.parseInt(q.getqWriter()));

			// 3_2. 쿼리문 실행 후 결과 받기
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5. 자원 반납 (생성 순서의 역순)
			JDBCTemplate.close(pstmt);
		}

		// 6. 결과 반환
		return result;
	}

	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
		
		// INSERT 문(1회 ~ 4회) => int (처리된 행의 갯수)

		// 1. 필요한 변수들 먼저 셋팅
		int result = 1;
		// insert 를 반복해서 진행 => 하나라도 실패할 경우 실패처리
		// result 를 애초에 1로 셋팅해두고 누적 곱을 구할 예정

		PreparedStatement pstmt = null;

		// 실행할 쿼리문
		String sql = prop.getProperty("insertAttachmentList");

		// PreparedStatement 객체 생성 시 쿼리문을 미리 보냄
		// => 즉, pstmt 객체 1개당 쿼리문 단 1개 실행

		// 첨부파일의 갯수만큼 반복을 돌려가면서 insert 요청 보내기
		
		try {
			// 2. PreparedStatement 객체 생성
			for(Attachment at : list) {
				// 반복문이 돌 때 마다 미완성된 SQL문을 담은 pstmt 객체 생성
				pstmt = conn.prepareStatement(sql);

				// 반복문이 돌 때 마다 완성형태로 만들기
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());

				// 반복문이 돌 때마다 쿼리문 실행 후 결과 받기 => 누적 곱으로 구하기
				result *= pstmt.executeUpdate();
				// result = result * pstmt.executeUpdate();
				// => 하나라도 실패할 경우 0이 뜰것임!!
			}	

			
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5. 자원 반납 (생성 순서의 역순)
			JDBCTemplate.close(pstmt);
		}

		// 6. 결과 반환
		return result;
	}

	public int insertNewAttachmentList(Connection conn, ArrayList<Attachment> list) {
		
		int result = 1;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertNewAttachmentList");
		
		try {

			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, at.getRefNo());
				pstmt.setString(2, at.getOriginName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setString(4, at.getFilePath());

				result *= pstmt.executeUpdate();

			}	

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public ArrayList<QNA> selectQNAList(Connection conn, QNA q ,PageInfo pi) {
		
		// SELECT 문 => ResultSet (여러 행 조회)

		// 1. 필요한 변수들 먼저 셋팅
		ArrayList<QNA> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 실행할 쿼리문
		String sql = prop.getProperty("selectQNAList");

		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;


			pstmt.setInt(1, Integer.parseInt(q.getqWriter()));
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			// 3_2. 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();

			// 4. 조회 결과를 VO 에 가공
			while(rset.next()) {
				q = new QNA();
				q.setQnaNo(rset.getInt("QNA_NO"));
				q.setqCategory(rset.getString("Q_CATEGORY"));
				q.setqTitle(rset.getString("Q_TITLE"));
				q.setqDate(rset.getDate("Q_DATE"));
				q.setqContent(rset.getString("Q_CONTENT"));
				q.setaContent(rset.getString("A_CONTENT"));
				q.setqWriter(rset.getString("Q_WRITER"));
				list.add(q);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5. 자원 반납 (생성 순서의 역순)
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		// 6. 결과 반환
		return list;
	}

	public QNA selectQNA(Connection conn, int qnaNo) {
		
		// SELECT 문 => ResultSet (여러 행 조회)

		// 1. 필요한 변수들 먼저 셋팅
		QNA q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 실행할 쿼리문
		String sql = prop.getProperty("selectQNA");

		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);

			// 3_1. 미완성된 쿼리문 완성시키기
			pstmt.setInt(1, qnaNo);

			// 3_2. 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();

			// 4. 조회 결과를 VO 에 가공
			if(rset.next()) {
				q = new QNA();
				q.setQnaNo(rset.getInt("QNA_NO"));
				q.setqCategory(rset.getString("Q_CATEGORY"));
				q.setqTitle(rset.getString("Q_TITLE"));
				q.setqContent(rset.getString("Q_CONTENT"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5. 자원 반납 (생성 순서의 역순)
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		// 6. 결과 반환
		return q;
	}

	public ArrayList<QNA> selectManageQNAList(Connection conn) {

        ArrayList<QNA> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectManageQNAList");
        
        try {

            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();

            while(rset.next()) {
                QNA q = new QNA();
				q.setQnaNo(rset.getInt("QNA_NO"));
				q.setqCategory(rset.getString("Q_CATEGORY"));
				q.setqTitle(rset.getString("Q_TITLE"));
				q.setqDate(rset.getDate("Q_DATE"));
				q.setUserId(rset.getString("USER_ID"));
				q.setUserName(rset.getString("USER_NAME"));
				q.setEmail(rset.getString("EMAIL"));
				q.setPhone(rset.getString("PHONE"));
				q.setAnswerStatus(rset.getString("ANSWER_STATUS"));
				list.add(q);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 5. 자원반납
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        // 6. 결과 반환
        return list;
    }


	public int selectListCount(Connection conn) {
		
		// SELECT 문 => ResultSet (1행 1열, 단일값, 숫자값) => int
		
		// 1. 필요한 변수들 먼저 셋팅
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 실행할 쿼리문
		String sql = prop.getProperty("selectListCount");
		
		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 3_1. 미완성된 쿼리문을 완성시키기 => 완성된 쿼리문이기 때문에 패스
			
			// 3_2. 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();
			
			// 4. 조회된 결과를 변수로 가공하기
			if(rset.next()) {
				
				listCount = rset.getInt("COUNT"); // 별칭으로도 데이터 뽑기 가능
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 5. 자원 반납 (생성 순서의 역순)
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		// 6. 결과 반환
		return listCount;
	}

	public ArrayList<Attachment> selectAttachmentList(Connection conn, ArrayList<QNA> list) {
		
		// SELECT 문 => ResultSet (여러 행 조회)

		// 1. 필요한 변수들 먼저 셋팅
		ArrayList<Attachment> aList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 실행할 쿼리문
		String sql = prop.getProperty("selectAttachment");

		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);

			for(QNA q : list) {

				pstmt.setInt(1, q.getQnaNo());

				
				rset = pstmt.executeQuery();
				
				
				
				while(rset.next()) {

				Attachment at = new Attachment();	

					at.setChangeName(rset.getString("CHANGE_NAME"));
					at.setFilePath(rset.getString("FILE_PATH"));
					at.setRefNo(rset.getInt("REF_QNO"));
					
					aList.add(at);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5. 자원 반납 (생성 순서의 역순)
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		// 6. 결과 반환
		return aList;
	}

	public int updateQNA(Connection conn, QNA q){
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateQNA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, q.getqCategory());
			pstmt.setString(2, q.getqTitle());
			pstmt.setString(3, q.getqContent());
			pstmt.setInt(4, q.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updateAttachmentList(Connection conn,ArrayList<Attachment> list) {
		
		// UPDATE 문 => int (처리된 행의 갯수)
		
		// 1. 필요한 변수들 먼저 셋팅
		int result = 1;
		PreparedStatement pstmt = null;
		
		// 실행할 쿼리문
		String sql = prop.getProperty("updateAttachmentList");
		
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileNo());
				
				result *= pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 4. 자원 반납
			JDBCTemplate.close(pstmt);
		}
		
		// 5. 결과 반환
		return result;
	}

	

	public ArrayList<Attachment> selectAttachmentList(Connection conn, int qnaNo) {
		
		// SELECT 문 => ResultSet (여러 행 조회)

		// 1. 필요한 변수들 먼저 셋팅
		ArrayList<Attachment> aList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 실행할 쿼리문
		String sql = prop.getProperty("selectAttachment");

		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, qnaNo);

			rset = pstmt.executeQuery();

			while(rset.next()) {

				Attachment at = new Attachment();	

				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setRefNo(rset.getInt("REF_QNO"));

				aList.add(at);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 5. 자원 반납 (생성 순서의 역순)
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		// 6. 결과 반환
		return aList;
	}

	public QNA selectManageQNA(Connection conn, int qnaNo) {
		
		QNA q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectManageQNA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new QNA();
				q.setQnaNo(rset.getInt("QNA_NO"));
				q.setqCategory(rset.getString("Q_CATEGORY"));
				q.setqTitle(rset.getString("Q_TITLE"));
				q.setqDate(rset.getDate("Q_DATE"));
				q.setqContent(rset.getString("Q_CONTENT"));
				q.setaContent(rset.getString("A_CONTENT"));
				q.setUserId(rset.getString("USER_ID"));
				q.setUserName(rset.getString("USER_NAME"));
				q.setEmail(rset.getString("EMAIL"));
				q.setPhone(rset.getString("PHONE"));
				q.setaDate(rset.getDate("A_DATE"));
				q.setAnswerStatus(rset.getString("ANSWER_STATUS"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5. 자원반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		// 6. 결과 반환
		return q;
	}

	public ArrayList<Attachment> selectManageAttachmentList(Connection conn, int qnaNo) {
		
		ArrayList<Attachment> aList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				aList.add(at);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5. 자원반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		// 6. 결과 반환
		return aList;
	}

	public int insertManageQNA(Connection conn, QNA q) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertManageQNA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, q.getaContent());
			pstmt.setInt(2, q.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5. 자원반납
			JDBCTemplate.close(pstmt);
		}
		// 6. 결과 반환
		return result;
	}

	public int updateManageQNA(Connection conn, QNA q) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateManageQNA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, q.getaContent());
			pstmt.setInt(2, q.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5. 자원반납
			JDBCTemplate.close(pstmt);
		}
		// 6. 결과 반환
		return result;
	}

	public int deleteManageQNA(Connection conn, QNA q) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteManageQNA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, q.getQnaNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5. 자원반납
			JDBCTemplate.close(pstmt);
		}
		// 6. 결과 반환
		return result;
	}

	public int deleteQNA(Connection conn, int qnaNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteQNA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNo);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5. 자원반납
			JDBCTemplate.close(pstmt);
		}
		// 6. 결과 반환
		return result;
	}
}
