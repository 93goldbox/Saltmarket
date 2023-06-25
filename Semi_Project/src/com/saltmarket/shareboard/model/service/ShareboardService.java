package com.saltmarket.shareboard.model.service;

import static com.saltmarket.common.JDBCTemplate.close;
import static com.saltmarket.common.JDBCTemplate.commit;
import static com.saltmarket.common.JDBCTemplate.getConnection;
import static com.saltmarket.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.common.model.vo.PageInfo;
import com.saltmarket.common.model.vo.Region;
import com.saltmarket.common.model.vo.Reply;
import com.saltmarket.common.model.vo.SearchInfo;
import com.saltmarket.freeboard.model.dao.FreeboardDao;
import com.saltmarket.freeboard.model.vo.Freeboard;
import com.saltmarket.shareboard.model.dao.ShareboardDao;
import com.saltmarket.shareboard.model.vo.Shareboard;

public class ShareboardService {
	
	public int selectListCount(SearchInfo si) {
		
		Connection conn = getConnection();
		int listCount = new ShareboardDao().selectListCount(conn, si);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Region> selectRegionList() {
		
		Connection conn = getConnection();
		ArrayList<Region> regionList = new ShareboardDao().selectRegionList(conn);
		close(conn);
		return regionList;
	}
	
	public ArrayList<Shareboard> selectList(PageInfo pi, SearchInfo si) {
		
		Connection conn = getConnection();
		ArrayList<Shareboard> list = new ShareboardDao().selectList(conn, pi, si);
		close(conn);
		return list;
	}
	
	public ArrayList<Shareboard> selectBestList(int regionNo) {
		
		Connection conn = getConnection();
		ArrayList<Shareboard> bestList = new ShareboardDao().selectBestList(conn, regionNo);
		close(conn);
		return bestList;
	}
	
	public int increaseCount(int boardNo) {
		
		Connection conn = getConnection();
		int result = new ShareboardDao().increaseCount(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}
	
	public Shareboard selectBoard(int boardNo) {
		
		Connection conn = getConnection();
		Shareboard sb = new ShareboardDao().selectBoard(conn, boardNo);
		close(conn);
		return sb;
	}
	
	public ArrayList<ImgFile> selectImgFile(int boardNo) {
		
		Connection conn = getConnection();
		ArrayList<ImgFile> imgList = new ShareboardDao().selectImgFile(conn, boardNo);
		close(conn);
		return imgList;
	}
	
	
	public int insertBoard(Shareboard sb, ArrayList<ImgFile> imgList) {
		
		Connection conn = getConnection();
		
		// BOARD INSERT 먼저 진행 (부모데이터이므로)
		int result1 = new ShareboardDao().insertBoard(conn, sb);
		
		// 첨부파일부분
		int result2 = 1;
		
		if(imgList != null) {
			result2 = new ShareboardDao().insertImgFile(conn, imgList);
		}
		
		// 트랜잭션 처리
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		// 자원반납
		close(conn);
		
		// 결과반환
		return result1 * result2;
	}
	
	public int updateBoard(Shareboard sb, ArrayList<ImgFile> deleteImgList, ArrayList<ImgFile> updateImgList) {
		
		Connection conn = getConnection();
		
		// 게시글 수정정보 먼저 요청 후 결과받기
		int result1 = new ShareboardDao().updateBoard(conn, sb);
		
		// 삭제버튼이 눌린 이미지파일이 있다면 삭제 요청 보내기
		int result2 = 1;
		
		if(deleteImgList != null) { // 삭제할 이미지가 있을 경우
			result2 = new ShareboardDao().deleteImgFile(conn, deleteImgList);
		}
		
		// 새로운 첨부파일이 있다면 INSERT 요청 보내기
		int result3 = 1;
		
		if(updateImgList != null) { // 첨부할 이미지가 있을 경우
			// cf) insertImgFile() 를 사용할 경우 FREE_BOARD_NO 이 SEQ_FREE_BOARD.CURRVAL 로 들어가기 때문에 오류발생
			result3 = new ShareboardDao().updateImgFile(conn, sb, updateImgList);
		}
		
		// 트랜잭션 처리
		if(result1 > 0 && result2 > 0 && result3 > 0) { // 셋다 성공한 경우만 commit
			commit(conn);
		} else { // 하나라도 실패할 경우 rollback
			rollback(conn);
		}
		
		// 자원반납
		close(conn);
		
		// 결과반환
		return result1 * result2 * result3;
	}
	
	public int deleteBoard(int boardNo) {
		
		Connection conn = getConnection();
		int result = new ShareboardDao().deleteBoard(conn, boardNo);
		
		// 트랜잭션 처리
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		// 자원반납
		close(conn);
		
		// 결과반환
		return result;
	}
	
	public int insertReply(Reply r) {
		
		Connection conn = getConnection();
		int result = new ShareboardDao().insertReply(conn, r);
		
		if(result >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Reply> selectReplyList(int boardNo) {
		
		Connection conn = getConnection();
		ArrayList<Reply> list = new ShareboardDao().selectReplyList(conn, boardNo);
		close(conn);
		return list;
	}

	public int deleteReply(int replyNo) {
		
		Connection conn = getConnection();
		int result = new ShareboardDao().delectReply(conn, replyNo);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateReply(Reply r) {
		
		Connection conn = getConnection();
		int result = new ShareboardDao().updateReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Shareboard selectLike(int boardNo) {
		
		Connection conn = getConnection();
		Shareboard sb = new ShareboardDao().selectLike(conn, boardNo);
		close(conn);
		return sb;
	}
	
	public int updateLike(int boardNo, String type) {
		
		Connection conn = getConnection();
		int result = new ShareboardDao().updateLike(conn, boardNo, type);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}









