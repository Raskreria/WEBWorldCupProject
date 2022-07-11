package gameComment;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentInfoDao;
import vo.CommentInfo;

@WebServlet("/comment/write")
public class CommentWriteController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String category = request.getParameter("category");
		int categoryIdx = Integer.parseInt(request.getParameter(category+"Idx"));
		int memberIdx = Integer.parseInt(request.getParameter("memberIdx"));
		String name = request.getParameter("name");
		String comment = request.getParameter("comment");
		LocalDateTime commentDate = LocalDateTime.now();
		
		//파라미터 검증 생략
		
		CommentInfo commentInfo = new CommentInfo(category, categoryIdx, memberIdx, name, comment, commentDate);
		CommentInfoDao dao = new CommentInfoDao();
		boolean result = dao.insertCommentInfo(commentInfo);
		if(result) {
			
		}else {
			
		}
		
	}

}
