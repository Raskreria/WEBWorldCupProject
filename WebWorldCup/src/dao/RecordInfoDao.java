package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import util.Database;
import vo.RecordInfo;

public class RecordInfoDao {

	
	public boolean insertRecordInfo(RecordInfo recordInfo) {
		Database db = new Database();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		try {

			String sql = "INSERT INTO recordInfo(gameIdx,playMemberIdx,gameRecord,playDate) VALUES(?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recordInfo.getGameIdx());
			if(recordInfo.getMemberIdx() == 0) {
				pstmt.setString(2, null);
			}else {
				pstmt.setInt(2, recordInfo.getMemberIdx());
			}
			pstmt.setString(3, recordInfo.getGameRecord());
			pstmt.setString(4, recordInfo.getPlayDate().toString());
			
			
			int count = pstmt.executeUpdate();

			return count == 1;
		} catch (SQLException e) {
			e.printStackTrace();

			return false;
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
	}
	
	public List<RecordInfo> selectRecordsByMemberIdx(int memberIdx, int loadNumber) {
		Database db = new Database();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		List<RecordInfo> recordInfoList = new ArrayList<>();
		
		String sql = "SELECT * FROM recordInfo WHERE playMemberIdx = ? ORDER BY playDate ASC LIMIT ?, 10";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberIdx);
			pstmt.setInt(2, (loadNumber - 1) * 10);
			
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int gameIdx  = rs.getInt("gameIdx");
				int playMemberIdx= rs.getInt("playMemberIdx");
				String gameRecord = rs.getString("gameRecord");
				String t_playDate = rs.getString("playDate");
				t_playDate = t_playDate.substring(0, 19);
				t_playDate = t_playDate.replace(' ', 'T');
				LocalDateTime playDate = LocalDateTime.parse(t_playDate);

				RecordInfo nthRecordInfo = new RecordInfo(gameIdx,playMemberIdx,gameRecord,playDate);

				recordInfoList.add(nthRecordInfo);
			}
			return recordInfoList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		return recordInfoList;
	}
}
