package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Database;
import vo.BoardInfo;
import vo.GameInfo;

public class GameInfoDao {

	public boolean insertGameInfo(GameInfo gameInfo) {

		Database db = new Database();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		try {

			String sql = "INSERT INTO gameInfo(regMemberIdx,gameTitle,gameImg,regDate) VALUES(?, ?, ?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gameInfo.getRegMemeberIdx());
			pstmt.setString(2, gameInfo.getGameTitle());
			pstmt.setString(3, gameInfo.getGameImg());
			pstmt.setString(4, gameInfo.getRegDate().toString());
			
			
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
	public List<GameInfo> selectGameInfo(int loadNumber, String sortingMethod){
		Database db = new Database();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		List<GameInfo> gameInfoList= new ArrayList<>();
		
		String sql;
		//sortingMethod에 따른 sql 구성
		if(sortingMethod.equals("popularity")) {
			sql="SELECT COUNT(0)AS amount, a.gameIdx, a.gameTitle, a.gameImg "
			+ "FROM gameInfo AS a LEFT OUTER JOIN recordInfo AS b ON a.gameIdx = b.gameIdx "
			+ "group BY a.gameIdx "
			+ "ORDER BY amount ASC LIMIT ?, 10";
		}else {
			sql="SELECT * "
					+ "FROM gameInfo "
					+ "ORDER BY regDate desc LIMIT ?, 10";
		}
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (loadNumber - 1) * 10);
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
		
		String sql = "SELECT * FROM GameInfo WHERE gameTitle LIKE \"%"+searchData+"%\" ";
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
