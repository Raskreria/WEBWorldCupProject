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
import vo.CommentInfo;
import vo.ElementInfo;
import vo.GameInfo;

public class CommentInfoDao {
	public List<CommentInfo> selectCommentInfoList(String category, int loadNumber) {
		Database db = new Database();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		List<CommentInfo> commentInfoList = new ArrayList<>();
		
		String sql = "SELECT * 	FROM commentinfo WHERE category=? ORDER BY commentDate ASC LIMIT ?, 10";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2, (loadNumber - 1) * 10);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String name  = rs.getString("name");
				String comment = rs.getString("comment");
				String t_commentDate = rs.getString("commentDate");
				t_commentDate = t_commentDate.substring(0, 19);
				t_commentDate = t_commentDate.replace(' ', 'T');
				LocalDateTime commentDate = LocalDateTime.parse(t_commentDate);

				CommentInfo nthCommentInfo = new CommentInfo(name,comment,commentDate);

				commentInfoList.add(nthCommentInfo);
			}
			return commentInfoList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		return commentInfoList;
	}

	public boolean insertCommentInfo(CommentInfo commentInfo) {

		Database db = new Database();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		try {

			String sql = "INSERT INTO commentInfo(category, categoryIdx, memberIdx, name, comment, commentDate) VALUES(?, ?, ?, ?, ?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, commentInfo.getCategory());
			pstmt.setInt(2, commentInfo.getCategoryIdx());
			pstmt.setInt(3, commentInfo.getMemberIdx());
			pstmt.setString(4, commentInfo.getName());
			
			pstmt.setString(6, commentInfo.getCommentDate().toString());
			if (commentInfo.getMemberIdx() == 0) {
				pstmt.setString(5, null);
			} else {
				pstmt.setInt(5, commentInfo.getMemberIdx());
			}
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

}
