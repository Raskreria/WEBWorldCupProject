package game;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ElementService;

@WebServlet("/game/ranking")
public class ElementRankingListController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int gameIdx = Integer.parseInt(request.getParameter("gameIdx"));

		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		String sortingMethod = "elementWinCount";
		if(request.getParameter("sortingMethod") != null) {
			sortingMethod = request.getParameter("sortingMethod");
		}

		String order = "DESC";
		if(request.getParameter("order") != null) {
			sortingMethod = request.getParameter("order");
		}
		
		ElementService service = new ElementService();
		String data = service.loadElementInfoRankingToJson(gameIdx, pageNumber, sortingMethod, order);
		
		System.out.println(data);
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(data);
		out.close();
	}
}
