package com.saltmarket.common.model.service;

import static com.saltmarket.common.JDBCTemplate.*;

import java.sql.Connection;

import com.saltmarket.common.model.dao.BoardReportDao;
import com.saltmarket.common.model.vo.BoardReport;

public class BoardReportService {
	
	public int reportBoard(BoardReport br) {
		
		Connection conn = getConnection();
		int result = new BoardReportDao().reportBoard(conn, br);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
