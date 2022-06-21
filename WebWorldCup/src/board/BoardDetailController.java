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
		
		String category = request.getParameter("category");
		int boardIdx = Integer.parseInt(request.getParameter(category+"Idx"));
		
		BoardInfoDao dao = new BoardInfoDao();
		BoardInfo boardInfo = dao.selectBoardByBoardIdx(category,boardIdx);
		
		HttpSession session = request.getSession();
		session.setAttribute("boardInfo", boardInfo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/worldcup/"+category+"_detail.jsp");
		rd.forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
