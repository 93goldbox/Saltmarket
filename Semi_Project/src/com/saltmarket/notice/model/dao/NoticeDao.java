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
import com.saltmarket.notice.model.vo.Notice;

public class NoticeDao {

    private Properties prop = new Properties();

    public NoticeDao() {
        String fileName = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
        try {
            prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
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

    public ArrayList<Notice> selectNoticeList(Connection conn, PageInfo pi) {

        ArrayList<Notice> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectNoticeList");
        
        try {

            pstmt = conn.prepareStatement(sql);
            
            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

            rset = pstmt.executeQuery();

            while(rset.next()) {
                list.add(new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("NOTICE_TITLE"),
                                    rset.getDate("CREATE_DATE")));
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

	// 관리자용 목록 조회
	public ArrayList<Notice> selectManageNoticeList(Connection conn) {

        ArrayList<Notice> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectManageNoticeList");
        
        try {

            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();

            while(rset.next()) {
                list.add(new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("NOTICE_TITLE"),
									rset.getString("NOTICE_CONTENT"),
                                    rset.getDate("CREATE_DATE"),
									rset.getInt("NOTICE_VIEWS"),
									rset.getString("DELETE_STATUS")));
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

	public ArrayList<Notice> selectCsNoticeList(Connection conn) {
		
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCsNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("NOTICE_TITLE"),
                                    rset.getDate("CREATE_DATE")));
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

	public int increaseViewCount(Connection conn, int noticeNo) {
        
        // UPDATE 문 => int(처리된 행의 갯수)
        // 1. 필요한 변수들 먼저 셋팅
        int result = 0;
        PreparedStatement pstmt = null;
        
        // 실행할 쿼리문 
        String sql = prop.getProperty("increaseViewCount");
        
        // 2. PreparedStatement 객체 생성
        try {
            
            pstmt = conn.prepareStatement(sql);
            
            // 3_1. 미완성된 쿼리문 완성시키기
            pstmt.setInt(1, noticeNo);
            
            // 3_2. 쿼리문 실행 후 결과받기
            result = pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 4. 자원반납
            JDBCTemplate.close(pstmt);
        }
        // 5. 결과 반환
        return result;
    }
	public Notice selectNotice(Connection conn, int noticeNo) {
        
        // SELECT 문 => ResultSet(조회된 행의 갯수)
        // 1. 필요한 변수들 먼저 셋팅
        Notice n = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        // 실행할 쿼리문 
        String sql = prop.getProperty("selectNotice");
        
        // 2. PreparedStatement 객체 생성
        try {
            
            pstmt = conn.prepareStatement(sql);
            
            // 3_1. 미완성된 쿼리문 완성시키기
            pstmt.setInt(1, noticeNo);
            
            // 3_2. 쿼리문 실행 후 결과받기
            rset = pstmt.executeQuery();
            
            // 4. ResultSet 으로부터 조회된 내용물 VO에 담기
            // => 한행 조회
            if(rset.next()) {
                n = new Notice(rset.getInt("NOTICE_NO"),
                               rset.getString("NOTICE_TITLE"),
                               rset.getString("NOTICE_CONTENT"),
                               rset.getInt("NOTICE_VIEWS"),
                               rset.getDate("CREATE_DATE"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 5. 자원반납
            JDBCTemplate.close(rset);
            JDBCTemplate.close(pstmt);
        }
        // 6. 결과 반환
        return n;
    }

    public int insertNotice(Connection conn,  Notice n) {
		
		// INSERT 문 => int (처리된 행의 갯수)

		// 1. 필요한 변수들 먼저 셋팅
		int result = 0;
		PreparedStatement pstmt = null;

		// 실행할 쿼리문
		String sql = prop.getProperty("insertNotice");

		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);

			// 3_1. 미완성된 쿼리문 완성시키기
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());

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
		
		int result = 1;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertAttachmentList");
		
		try {

			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());

				result *= pstmt.executeUpdate();

			}	

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(pstmt);
		}

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

	public ArrayList<Attachment> selectAttachmentList(Connection conn, int noticeNo) {
		
		// SELECT 문 => ResultSet (여러 행 조회)

		// 1. 필요한 변수들 먼저 셋팅
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 실행할 쿼리문
		String sql = prop.getProperty("selectAttachment");

		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);

			// 3_1. 미완성된 쿼리문 완성시키기
			pstmt.setInt(1, noticeNo);

			// 3_2. 쿼리문 실행 후 결과 받기
			rset = pstmt.executeQuery();

			// 4. 조회 결과를 VO 에 가공
			while(rset.next()) {
				Attachment at = new Attachment();
				
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				
				list.add(at);
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

	public int updateNotice(Connection conn, Notice n) {
		
		// UPDATE 문 => int (처리된 행의 갯수)
		
		// 1. 필요한 변수들 먼저 셋팅
		int result = 0;
		PreparedStatement pstmt = null;
		
		// 실행할 쿼리문
		String sql = prop.getProperty("updateNotice");
		
		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 3_1. 미완성된 쿼리문 완성시키기
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());
			
			// 3_2. 쿼리문 실행 후 결과 받기
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 4. 자원 반납
			JDBCTemplate.close(pstmt);
		}
		
		// 5. 결과 반환
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
	public int deleteNotice(Connection conn, int noticeNo) {
		
		// UPDATE 문 => int (처리된 행의 갯수)
		
		// 1. 필요한 변수들 먼저 셋팅
		int result = 0;
		PreparedStatement pstmt = null;
		
		// 실행할 쿼리문
		String sql = prop.getProperty("deleteNotice");
		
		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 3_1. 미완성된 쿼리문 완성시키기
			pstmt.setInt(1, noticeNo);
			
			// 3_2. 쿼리문 실행 후 결과 받기
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 4. 자원 반납
			JDBCTemplate.close(pstmt);
		}
		
		// 5. 결과 반환
		return result;
	}
}
