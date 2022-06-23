package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardInfoDao;
import util.Validator;
import vo.BoardInfo;

//test required
@WebServlet("/board/update")
public class BoardUpdateController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.파일을 제외하고 수정할 파라미터를 받는다.
		request.setCharacterEncoding("UTF-8");
		String category = request.getParameter("category");
		int boardIdx = Integer.parseInt(request.getParameter(category+"Idx"));
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		
//		Validator validator = new Validator();
//		validator.allValidator();
		
		//2. 파라미터를 합친다.
		BoardInfo boardInfo = new BoardInfo(boardIdx, title, contents);
		
		//3. 수정한다.
		BoardInfoDao dao = new BoardInfoDao();
		boolean result = dao.updateBoardInfo(boardInfo, category);
		
		//4. 수정 성공/실패에 따른 처리
		if(result) {
			response.setStatus(HttpServletResponse.SC_OK);
		}else {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
	}
	
}
