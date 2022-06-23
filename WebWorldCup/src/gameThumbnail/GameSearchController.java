package gameThumbnail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GameInfoDao;
import vo.GameInfo;

//test required
@WebServlet("/main/gamesearch")
public class GameSearchController extends HttpServlet {
	//메인 페이지 게임 검색
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 사용자 입력 파라미터 받기
		String gameTitle = request.getParameter("gameTitle");
		
		//2. db에서 제목에 검색 내용 포함하는 List 가져오기
		GameInfoDao dao = new GameInfoDao();
		List<GameInfo> gameInfoList = dao.selectGameInfo(gameTitle);
		
		//3. JSP에서 사용하기 위해 객체로 저장.
		request.setAttribute("gameInfoList", gameInfoList);
		RequestDispatcher rd = request.getRequestDispatcher("/worldcup/index.jsp");
		rd.forward(request, response);
	}

}
