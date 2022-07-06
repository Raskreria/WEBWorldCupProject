package gameThumbnail;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.GameService;

@WebServlet("/main/list")
public class GameListAJAXController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 파라미터 null여부를 통해 접근 구분
		// - 페이지 첫 접근
		// - 정렬방식 변경을 통한 접근
		// - 스크롤을 내려 추가 목록을 위한 접근
		
		//1. 파라미터 받기
		int loadNumber=1;
		if(request.getParameter("loadNumber")!=null) {
			loadNumber = Integer.parseInt(request.getParameter("loadNumber"));
		}
		String sortingMethod ="popularity";
		if(request.getParameter("sortingMethod")!=null) {
			sortingMethod = request.getParameter("sortingMethod");
		}
		
		GameService service = new GameService();
		String data =service.loadMoreGameInfoToJson(loadNumber, sortingMethod);
		
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(data);
		out.close();

			
	}


}
