package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardInfoDao;


//20220702 만듬 테스트 완료
@WebServlet("/board/amount")
public class BoardAmountController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지사항의 전체 개수를 불러와서 전달한다.
		String category = "notice";
		if(request.getParameter("category") != null) {
			category = request.getParameter("category");
		}
		BoardInfoDao dao = new BoardInfoDao();
		
		int amount = dao.getAmountOfBoard(category);
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(amount);
		
		out.close();
	}

}
