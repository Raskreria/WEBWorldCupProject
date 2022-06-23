package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import util.Database;
import vo.BoardInfo;

public class BoardInfoDao {
	// 페이지번호를 받아와서 DB에서 페이지 번호에 맞는 게시판 목록을 받아와 list로 전달해주는 dao
	public List<BoardInfo> selectBoardsByPageNumber(String category, int pageNumber) {

		Database db = new Database();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		List<BoardInfo> boardList = new ArrayList<>();
		String table = category + "Info";
		try {
			String sql = "SELECT * FROM " + table + " ORDER BY " + category + "idx DESC LIMIT ?, 10";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNumber - 1) * 10);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int boardIdx = rs.getInt(category + "idx");
				int memberIdx = rs.getInt("memberIdx");
				String title = rs.getString(category + "Title");
				String contents = rs.getString(category + "Contents");
				String file = rs.getString("file");
				String t_pubDate = rs.getString("pubDate");
				System.out.println(t_pubDate);
				t_pubDate = t_pubDate.replace(" ", "T");
				LocalDateTime pubDate = LocalDateTime.parse(t_pubDate);

				BoardInfo nthBoardInfo = new BoardInfo(boardIdx, memberIdx, title, contents, file, pubDate);

				boardList.add(nthBoardInfo);
			}
			return boardList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		return boardList;

	}

	public int count(String category) {
		Database db = new Database();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int amount = 0;
		String table = category + "Info";
		try {
			String sql = "SELECT COUNT(*) AS amount FROM " + table;

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			rs.next();

			amount = rs.getInt("amount");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closeResultSet(rs);
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}

		return amount;
	}

	public BoardInfo selectBoardByBoardIdx(String category, int boardIdx) {

		Database db = new Database();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		BoardInfo boardInfo = null;
		String table = category + "Info";
		try {
			String sql = "SELECT * FROM " + table + " WHERE " + category + "idx = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardIdx);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			int memberIdx = rs.getInt("memberIdx");
			String title = rs.getString(category + "Title");
			String contents = rs.getString(category + "Contents");
			String file = rs.getString("file");
			String t_pubDate = rs.getString("pubDate");
			System.out.println(t_pubDate);
			t_pubDate = t_pubDate.replace(" ", "T");
			LocalDateTime pubDate = LocalDateTime.parse(t_pubDate);

			boardInfo = new BoardInfo(boardIdx, memberIdx, title, contents, file, pubDate);

			return boardInfo;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		return boardInfo;

	}

	public boolean insertBoardInfo(String category, BoardInfo boardInfo) {

		Database db = new Database();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		try {

			String sql = "INSERT INTO " + category + "Info(memberIdx," + category + "Title ," + category
					+ "Contents, file, pubDate) VALUES(?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardInfo.getMemberIdx());
			pstmt.setString(2, boardInfo.getBoardTitle());
			pstmt.setString(3, boardInfo.getBoardContents());
			pstmt.setString(4, boardInfo.getFile());
			pstmt.setString(5, boardInfo.getPubDate().toString());

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

	public boolean updateBoardInfo(BoardInfo boardInfo, String category) {
		Database db = new Database();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		boolean result = false;
		String sql = "UPDATE categoryInfo SET categoryTitle = ?, categoryContents = ? WHERE categoryIdx = ?";
		sql = sql.replace("category", category);

		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardInfo.getBoardTitle());
			pstmt.setString(2, boardInfo.getBoardContents());
			pstmt.setInt(3, boardInfo.getBoardIdx());

			int count = pstmt.executeUpdate();

			result = count == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}

		return result;
	}
	
	public boolean deleteBoradInfoByIdx (int boardIdx, String category) {
		Database db = new Database();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		boolean result = false;
		
		try {
			String sql = "DELETE FROM categoryInfo WHERE categoryidx = ?";
			sql = sql.replace("category", category);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardIdx );
			
			int count = pstmt.executeUpdate();
			
			result = count == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		
		return result;
	}
	
	public void deleteFileByBoardIdx(String category, int boardIdx) {
		Database db = new Database();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			String sql;
			sql = "UPDATE categoryInfo SET file = ? WHERE categoryidx = ?";
			sql = sql.replace("category", category);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, null);
			pstmt.setInt(2, boardIdx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		
	}
	public void addFileByBoardIdx(String category, int boardIdx, String filePath) {
		Database db = new Database();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			String sql;
			sql = "UPDATE categoryInfo SET file = ? WHERE categoryidx = ?";
			sql = sql.replace("category", category);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, filePath);
			pstmt.setInt(2, boardIdx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		
	}
	
	

}
