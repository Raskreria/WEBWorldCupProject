package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardInfoDao;

//게시판 글 좋아요 컨트롤러 0704에 추가함
// 미완
@WebServlet("/board/likes")
public class BoardLikesController extends HttpServlet {
	// 한번 누르면 종아요 1 올라가고 한번 더 누르면 -1 되어서 다시 원래대로 돌아오게 하고 싶음
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		int boardIdx = Integer.parseInt(request.getParameter(category+"Idx"));
		int updown = Integer.parseInt(request.getParameter("updown"));
		BoardInfoDao dao = new BoardInfoDao();
		//좋아요 1 올리기
		int likes = dao.updownLikesByBoardIdx(category, boardIdx , updown);
		
		PrintWriter out = response.getWriter();
		out.print(likes);
	}

}
