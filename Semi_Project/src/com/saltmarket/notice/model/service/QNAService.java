package com.saltmarket.notice.model.service;

import static com.saltmarket.common.JDBCTemplate.close;
import static com.saltmarket.common.JDBCTemplate.commit;
import static com.saltmarket.common.JDBCTemplate.getConnection;
import static com.saltmarket.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.saltmarket.common.model.vo.PageInfo;
import com.saltmarket.notice.model.dao.NoticeDao;
import com.saltmarket.notice.model.dao.QNADao;
import com.saltmarket.notice.model.vo.Attachment;
import com.saltmarket.notice.model.vo.QNA;

public class QNAService {
    public int insertQNA(QNA q, ArrayList<Attachment> list) {
        
        Connection conn = getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 2. Dao로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		// 2_1. BOARD INSERT 먼저 진행
		int result1 = new QNADao().insertQNA(conn, q);

		// 2_2. ATTACHMENT INSERT 진행 (자식데이터)
		// 무조건 적어도 1번은 insert 가 되야함
		int result2 = new QNADao().insertAttachmentList(conn, list);
		
		
		// 3. 트랜잭션 처리
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		// 4. Connection 반납
		close(conn);

		// 5. 결과 반환
		return result1 * result2;
	}

	public int selectListCount() {
        
        Connection conn = getConnection();
        try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        int listCount = new NoticeDao().selectListCount(conn);
		
		// 3. 트랜잭션 처리 => SELECT 문 이므로 패스
		
		// 4. Connection 객체 반납
		close(conn);
		
		// 5. 결과 반환
		return listCount;
	}

	public ArrayList<QNA> selectQNAList(QNA q, PageInfo pi) {
		// 1. Connection 객체 생성
		Connection conn = getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 2. Dao로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		ArrayList<QNA> list = new QNADao().selectQNAList(conn, q, pi);

		// 3. 트랜잭션 처리 => SELECT 문 패스

		// 4. Connection 반납
		close(conn);

		// 5. 결과 반환
		return list;
	}

	public QNA selectQNA(int qnaNo) {
		// 1. Connection 객체 생성
		Connection conn = getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 2. Dao로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		QNA q = new QNADao().selectQNA(conn, qnaNo);

		// 3. 트랜잭션 처리 => SELECT 문 패스

		// 4. Connection 반납
		close(conn);

		// 5. 결과 반환
		return q;
	}

	public ArrayList<QNA> selectManageQNAList() {
		
		// 1. Connection 객체 생성
		Connection conn = getConnection();
        try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 2. Dao 로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		ArrayList<QNA> list = new QNADao().selectManageQNAList(conn);
		
		// 3. 트랜잭션 처리 => SELECT 문 패스
		
		// 4. Connection 반납
		close(conn);
		
		// 5. 결과 반환
		return list;
	}

	// 첨부파일 리스트 조회용 서비스
	public ArrayList<Attachment> selectAttachmentList(ArrayList<QNA> list){
		// 1. Connection 객체 생성
		Connection conn = getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 2. Dao로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		ArrayList<Attachment> aList = new QNADao().selectAttachmentList(conn, list);

		// 3. 트랜잭션 처리 => SELECT 문 패스

		// 4. Connection 반납
		close(conn);

		// 5. 결과 반환
		return aList;
	}

	public ArrayList<Attachment> selectAttachmentList(int qnaNo) {
		// 1. Connection 객체 생성
		Connection conn = getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 2. Dao로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		ArrayList<Attachment> list = new QNADao().selectAttachmentList(conn, qnaNo);

		// 3. 트랜잭션 처리 => SELECT 문 패스

		// 4. Connection 반납
		close(conn);

		// 5. 결과 반환
		return list;
	}

	public QNA selectManageQNA(int qnaNo) {
		// 1. Connection 객체 생성
		Connection conn = getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 2. Dao로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		QNA q = new QNADao().selectManageQNA(conn, qnaNo);

		// 3. 트랜잭션 처리 => SELECT 문 패스

		// 4. Connection 반납
		close(conn);

		// 5. 결과 반환
		return q;
	}

	public int updateQNA(QNA q, ArrayList<Attachment> list) {
		
		// 1. Connection 생성
		Connection conn = getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 2. Dao 로 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		// 2_1. BOARD UPDATE 하는 요청 먼저 실행
		int result1 = new QNADao().updateQNA(conn, q);
		
		// 경우에 따라 서로 다른 요청을 보내야함
		
		int result2 = 0;
		
		
		if(!list.isEmpty()) { // 새롭게 첨부된 파일이 있을 경우
			
			for(int i = 0; i < list.size(); i++) {

				if(list.get(i).getFileNo() != 0) { // 기존에 있던 파일이라면
					result2 = new QNADao().updateAttachmentList(conn, list);
					
				} else { // 새로운 파일이라면
					result2 = new QNADao().insertNewAttachmentList(conn, list);
					
				}	
			}
		} else {
			result2 = 1;
		}


		
		// 3. 트랜잭션 처리
		if(result1 > 0 && result2 > 0) { // 둘 다 성공할 경우만 commit
			commit(conn);
		} else { // 하나라도 실패할 경우 rollback
			rollback(conn);
		}
		
		// 4. Connection 반납
		close(conn);
		
		return result1 * result2;
	}
	
	// 이건 관리자용
	public ArrayList<Attachment> selectManageAttachmentList(int qnaNo) {
		
		// 1. Connection 생성
		Connection conn = getConnection();
		
		// 2. Dao 로 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		ArrayList<Attachment> list = new QNADao().selectManageAttachmentList(conn, qnaNo);
		
		// 3. 트랜잭션 처리 => 패스
		
		// 4. Connection 반납
		close(conn);
		
		// 5. 결과 반환
		return list;
	}

	public int insertManageQNA(QNA q){
		// 1. Connection 객체 생성
		Connection conn = getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 2. Dao로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		int result = new QNADao().insertManageQNA(conn, q);

		// 3. 트랜잭션 처리
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		// 4. Connection 반납
		close(conn);

		// 5. 결과 반환
		return result;
	}

	public int updateManageQNA(QNA q) {
		// 1. Connection 객체 생성
		Connection conn = getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 2. Dao로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		int result = new QNADao().updateManageQNA(conn, q);

		// 3. 트랜잭션 처리
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		// 4. Connection 반납
		close(conn);

		// 5. 결과 반환
		return result;
	}

	public int deleteManageQNA(QNA q) {
		// 1. Connection 객체 생성
		Connection conn = getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 2. Dao로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		int result = new QNADao().deleteManageQNA(conn, q);

		// 3. 트랜잭션 처리
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		// 4. Connection 반납
		close(conn);

		// 5. 결과 반환
		return result;
	}

	public int deleteQNA(int qnaNo) {
		// 1. Connection 객체 생성
		Connection conn = getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 2. Dao로 만들어진 Connection 과 전달값을 넘기면서 요청 후 결과 받기
		int result = new QNADao().deleteQNA(conn, qnaNo);

		// 3. 트랜잭션 처리
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		// 4. Connection 반납
		close(conn);

		// 5. 결과 반환
		return result;
	}
}
