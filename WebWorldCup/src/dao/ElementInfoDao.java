package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Database;
import vo.ElementInfo;
import vo.GameInfo;

public class ElementInfoDao {

	public List<ElementInfo> selectElementsByGameIdx(int gameIdx) {
		Database db = new Database();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		List<ElementInfo> elementInfoList = new ArrayList<>();

		String sql = "SELECT * from ElementInfo WHERE gameIdx =" + gameIdx + " order by rand() LIMIT 16";

		try {

			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int elementIdx = rs.getInt("gameIdx");
				String elementTitle = rs.getString("elementTitle");
				String elementImg = rs.getString("elementImg");

				ElementInfo nthElementInfo = new ElementInfo(elementIdx, elementTitle, elementImg);

				elementInfoList.add(nthElementInfo);
			}
			return elementInfoList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		return elementInfoList;
	}

	public boolean increaseWinAndSelectCount(int[] resultArray, int gameIdx) {

		Database db = new Database();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		boolean result = false;
		int[] reflectArray = { 1, 2, 1, 3, 1, 2, 1, 4 };

		try {
			String sql;

			sql = "UPDATE ElementInfo SET elementWinCount = elementWinCount+1 WHERE elementIdx = ? AND gameIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resultArray[7]);
			pstmt.setInt(2, gameIdx);

			pstmt.executeUpdate();

			for (int i = 0; i < 8; i++) {
				sql = "UPDATE ElementInfo SET elementSelectCount = elementSelectCount + ? WHERE elementIdx = ? AND gameIdx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, reflectArray[i]);
				pstmt.setInt(2, resultArray[i]);
				pstmt.setInt(3, gameIdx);
				pstmt.executeUpdate();

			}

			result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		return result;
	}

	public boolean insertElementInfo(ElementInfo elementInfo) {
		Database db = new Database();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		try {

			String sql = "INSERT INTO elementInfo(gameIdx,elementTitle,elementImg) VALUES(?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, elementInfo.getGameIdx());
			pstmt.setString(2, elementInfo.getElementTitle());
			pstmt.setString(3, elementInfo.getElementImg());

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
