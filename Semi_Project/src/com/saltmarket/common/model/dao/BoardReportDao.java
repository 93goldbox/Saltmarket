package com.saltmarket.common.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.saltmarket.common.JDBCTemplate;
import com.saltmarket.common.model.vo.BoardReport;

public class BoardReportDao {
	
	private Properties prop = new Properties();

	public BoardReportDao() {

		String fileName = BoardReportDao.class.getResource("/sql/common/boardReport-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int reportBoard(Connection conn, BoardReport br) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = null;
		
		if(br.getType().equals("free")) {
			sql = prop.getProperty("reportFreeboard");
		} else if(br.getType().equals("share")) {
			sql = prop.getProperty("reportShareboard");
		}
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, br.getReportTitle());
			pstmt.setString(2, br.getReportContent());
			pstmt.setInt(3, br.getBoardNo());
			pstmt.setInt(4, br.getUserNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
