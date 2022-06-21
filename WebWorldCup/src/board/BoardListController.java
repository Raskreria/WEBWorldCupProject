package board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardInfoDao;
import vo.BoardInfo;

@WebServlet("/board/list")
public class BoardListController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
				
		BoardInfoDao dao = new BoardInfoDao();
		int amount = dao.count(category);
		System.out.println(amount);
		int startIndex = (pageNumber-1) * 10;
		if( startIndex >= amount) {
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
			return;
		}
		
		List<BoardInfo> boardList = dao.selectBoardsByPageNumber(category,pageNumber);
		
		request.setAttribute("boardList", boardList);
		RequestDispatcher rd = request.getRequestDispatcher("/worldcup/"+category+"_list.jsp");
		rd.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
