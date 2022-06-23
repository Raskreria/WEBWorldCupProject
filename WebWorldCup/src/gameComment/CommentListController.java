package gameComment;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentInfoDao;
import vo.CommentInfo;

@WebServlet("/comment/list")
public class CommentListController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("gameIdx") == null) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		int loadNumber = 1;
		if(request.getParameter("loadCount") != null) {
			loadNumber = Integer.parseInt(request.getParameter("loadCount"));
		}

		int gameIdx = Integer.parseInt(request.getParameter("gameIdx"));
		
		CommentInfoDao dao = new CommentInfoDao();
		List<CommentInfo> commentInfoList = dao.selectCommentsByGameIdx(gameIdx, loadNumber);
		
	
		
		request.setAttribute("commentInfoList", commentInfoList);
		RequestDispatcher rd = request.getRequestDispatcher("/worldcup/index.jsp");
		rd.forward(request, response);	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
