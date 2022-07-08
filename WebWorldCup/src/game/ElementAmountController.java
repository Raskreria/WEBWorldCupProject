package game;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ElementInfoDao;

@WebServlet("/element/amount")
public class ElementAmountController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int gameIdx = 1;
		if(request.getParameter("gameIdx") != null) {
			gameIdx = Integer.parseInt(request.getParameter("gameIdx"));
		}
		ElementInfoDao dao = new ElementInfoDao();
		
		int amount = dao.getAmountOfElementByGameIdx(gameIdx);
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(amount);
		
		out.close();
	}



}
