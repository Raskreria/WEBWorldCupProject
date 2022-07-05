package game;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ElementInfoDao;
import vo.ElementInfo;
// test required
@WebServlet("/game/playdata")
public class GameController extends HttpServlet {
	// 게임 진행을 위한 데이터 가져오기
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파라미터 받아오기
		int gameIdx = Integer.parseInt(request.getParameter("gameIdx"));
		
		//2. db에서 게임진행에 필요한 데이터를 받아 List로 구성하기	
		ElementInfoDao dao = new ElementInfoDao();
		List<ElementInfo> elementInfoList = dao.selectElementsByGameIdx(gameIdx);
		
		
		//3. JSP에서 사용하기 위해 객체로 저장.
		request.setAttribute("elementInfoList", elementInfoList);
		RequestDispatcher rd = request.getRequestDispatcher("/game/play.jsp");
		rd.forward(request, response);
	}

}
