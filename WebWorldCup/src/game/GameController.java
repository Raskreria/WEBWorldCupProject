package game;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ElementInfoDao;
import service.ElementService;
import vo.ElementInfo;
// test required
@WebServlet("/game/playdata")
public class GameController extends HttpServlet {
	// 게임 진행을 위한 데이터 가져오기
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파라미터 받아오기
		int gameIdx = Integer.parseInt(request.getParameter("gameIdx"));
		
		ElementService service = new ElementService();
		String data = service.loadElementInfoToJson(gameIdx);
		
		System.out.println(data);
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(data);
		out.close();

	}

}
