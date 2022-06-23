package gameThumbnail;

import java.io.IOException;
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
@WebServlet("/main")
public class GameListController extends HttpServlet {
	// 썸네일 목록 불러오기
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 null여부를 통해 접근 구분
		// - 페이지 첫 접근
		// - 정렬방식 변경을 통한 접근
		// - 스크롤을 내려 추가 목록을 위한 접근
		
		//1. 파라미터 받기
		int loadNumber=1;
		if(request.getParameter("loadCounter")!=null) {
			loadNumber = Integer.parseInt(request.getParameter("loadCounter"));
		}
		String sortingMethod ="popularity";
		if(request.getParameter("sortingMethod")!=null) {
			sortingMethod = request.getParameter("sortingMethod");
		}
		
		//2. db에서 목록 받아서 List로 구성.
		GameInfoDao dao = new GameInfoDao();
		List<GameInfo> gameInfoList = dao.selectGameInfo(loadNumber, sortingMethod);
		
		//3. JSP에서 사용하기 위해 객체로 저장.
		request.setAttribute("gameInfoList", gameInfoList);
		RequestDispatcher rd = request.getRequestDispatcher("/worldcup/index.jsp");
		rd.forward(request, response);
			
	
	}

}
