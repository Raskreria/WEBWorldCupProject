package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Database;
import vo.GameInfo;

public class GameInfoDao {

	
	public List<GameInfo> selectGameInfo(int loadNumber, String sortingMethod){
		Database db = new Database();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		List<GameInfo> gameInfoList= new ArrayList<>();
		
		String sql;
		//sortingMethod에 따른 sql 구성
		if(sortingMethod.equals("prefer")) {
			sql="SELECT * FROM GameThumbnailInfo ORDER BY ## ASSEND LIMIT ?, 10";
			
		}else {
			sql="";
		}
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (loadNumber - 1) * 8);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int gameIdx = rs.getInt("gameIdx");
				String gameTitle = rs.getString("gameTitle");
				String gameImg = rs.getString("gameImg");
				
				
				
				GameInfo nthGameInfo = new GameInfo(gameIdx, gameTitle, gameImg);
				
				gameInfoList.add(nthGameInfo);
			}
			return gameInfoList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		return gameInfoList;

	}
	

	public List<GameInfo> selectGameInfo(String searchData) {
		Database db = new Database();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		List<GameInfo> gameInfoList= new ArrayList<>();
		
		String sql = "SELECT * FROM GameThumbnailInfo WHERE gameTitle = \"_"+searchData +"_\" ";
		try {
			
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int gameIdx = rs.getInt("gameIdx");
				String gameTitle = rs.getString("gameTitle");
				String gameImg = rs.getString("gameImg");
				
				
				
				GameInfo nthGameInfo = new GameInfo(gameIdx, gameTitle, gameImg);
				
				gameInfoList.add(nthGameInfo);
			}
			return gameInfoList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		return gameInfoList;
	}
}
