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
import vo.MemberInfo;

public class MemberInfoDao {
	
	public MemberInfo selectById(String id) {
		Database db = new Database();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		MemberInfo memberInfo = null;
		try {
			String sql = "SELECT * FROM memberInfo WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int idx = rs.getInt("memberIdx");
				
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				
				String t_joinDate = rs.getString("joinDate");
				System.out.println(t_joinDate);
				// parse() 메서드를 사용해서 날짜 정보처럼 생긴 문자열을 날짜 정보(LocalDateTime)으로 변환 할 수 있는데
				// Text '2022-05-09 00:00:00.0' could not be parsed at index 10
				// 날짜 정보처럼 생긴 문자열은 yyyy-MM-ddTHH:mm:ss와 같은 형식이여야함.
				// #1. t_joinDate에 들어있는 밀리초를 떼기
				t_joinDate = t_joinDate.substring(0, 19);
				System.out.println(t_joinDate);
				//또는
//				t_joinDate = t_joinDate.split(".")[0];
				// #2. t_joinDate의 중간에 들어있는 공백문자를 T로 바꾸기 
				t_joinDate = t_joinDate.replace(' ', 'T');
				System.out.println(t_joinDate);
				LocalDateTime joinDate = LocalDateTime.parse(t_joinDate);
				
				
				memberInfo = new MemberInfo(idx,id,pw,name,age,addr,joinDate);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		return memberInfo;
	}
	

	
	public boolean insert(MemberInfo newMemberInfo) {
		Database db = new Database();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO memberInfo(id, pw, name, age, addr, joinDate) VALUES(?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newMemberInfo.getId());
			pstmt.setString(2, newMemberInfo.getPw());
			pstmt.setString(3, newMemberInfo.getName());
			pstmt.setInt(4, newMemberInfo.getAge());
			pstmt.setString(5, newMemberInfo.getAddr());
			pstmt.setString(6, newMemberInfo.getJoinDate().toString());
			
			// 4. stmt 를 통해서 쿼리 실행 및 결과 전달
			int count = pstmt.executeUpdate();
			return count == 1;
		} catch (SQLException e ) {
			e.printStackTrace();
			
			return false;
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
	}
	
	
	public boolean updateById(MemberInfo updateMemberInfo) {
		Database db = new Database();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		boolean result = false;
		
		try {
			String sql = "UPDATE memberInfo SET pw = ?, name = ?, age = ?, addr = ? WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateMemberInfo.getPw());
			pstmt.setString(2, updateMemberInfo.getName());
			pstmt.setInt(3, updateMemberInfo.getAge());
			pstmt.setString(4, updateMemberInfo.getAddr());
			pstmt.setString(5, updateMemberInfo.getId());
			
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
	
	public void deleteMemberInfoById(String id) {
		Database db = new Database();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		boolean result = false;
		
		try {
			String sql = "DELETE FROM memberInfo WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		
	}
	
}
