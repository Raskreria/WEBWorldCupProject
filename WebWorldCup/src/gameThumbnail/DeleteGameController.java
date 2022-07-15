package gameThumbnail;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GameInfoDao;

@WebServlet("/game/deletegame")
public class DeleteGameController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파라미터 받기
		int gameIdx = Integer.parseInt(request.getParameter("gameIdx"));
		
		//2. 해당 게시판 글의 실제 파일부터 삭제
		GameInfoDao dao = new GameInfoDao();
	
		//3. db에 게시판 글 삭제
		boolean result = dao.deleteGameInfoByGameIdx(gameIdx);
		
		//4. 게시판 글 삭제 성공/실패 처리
		if(result) {
			response.setStatus(HttpServletResponse.SC_OK);
		}else {
			
		}
	}

}
