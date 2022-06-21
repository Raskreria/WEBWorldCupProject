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

@WebServlet("/CommentWriteController")
public class CommentWriteController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("gameIdx") == null) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		int memberIdx=0;
		if(request.getParameter("memberIdx") !=null)
			memberIdx = Integer.parseInt(request.getParameter("memberIdx"));
		int gameIdx = Integer.parseInt(request.getParameter("gameIdx"));
		String name = request.getParameter("name");
		String comment = request.getParameter("comment");
		LocalDateTime commentDate = LocalDateTime.now();
		
		//파라미터 검증 생략
		
		CommentInfo commentInfo = new CommentInfo(gameIdx,name,comment,commentDate,memberIdx);
		CommentInfoDao dao = new CommentInfoDao();
		boolean result = dao.insertCommentInfo(commentInfo);
		if(result) {
			
		}else {
			
		}
		
	}

}
