package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardInfoDao;
import vo.BoardInfo;


@WebServlet("/board/detail")
public class BoardDetailController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//상세보기 페이지를 위한 데이터 세션에 저장
		String category = request.getParameter("category");
		int boardIdx = Integer.parseInt(request.getParameter(category+"Idx"));
		
		BoardInfoDao dao = new BoardInfoDao();
		BoardInfo boardInfo = dao.selectBoardByBoardIdx(category,boardIdx);
		
		request.setAttribute("boardInfo", boardInfo);
		
		//조회수 1 올리기
		dao.increaseViewsByBoardIdx(category, boardIdx);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/board/detail.jsp");
		rd.forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
