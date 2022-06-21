package game;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ElementInfoDao;

//test required
@WebServlet("/ResultReflectController")
public class ResultReflectController extends HttpServlet {
	//게임 결과 반영
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파라미터 받기
		int gameIdx = Integer.parseInt(request.getParameter("gameIdx"));
		int[] resultArray = new int[8];
		for (int count = 0; count < 8; count++) {
			resultArray[count] = Integer.parseInt(request.getParameter("elementIdx"));
		}
		
		//2. db에 결과 반영
		ElementInfoDao dao = new ElementInfoDao();
		boolean result = dao.increaseWinAndSelectCount(resultArray, gameIdx);
		
		//3. 게임 결과 반영 성공/실패
		if (result) {
			response.setStatus(HttpServletResponse.SC_OK);
		} else {

		}
	}
}
