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
import service.GameService;
import vo.GameInfo;

//test required
@WebServlet("/main/gamesearch")
public class GameSearchController extends HttpServlet {
	//메인 페이지 게임 검색
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 사용자 입력 파라미터 받기
		String gameTitle = request.getParameter("gameTitle");
		
		
		GameService service = new GameService();
		String data =service.loadSearchGameInfoToJson(gameTitle);
		
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(data);
		out.close();
	}

}
