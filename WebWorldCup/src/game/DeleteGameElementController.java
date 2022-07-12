package game;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ElementInfoDao;
import vo.ElementInfo;

@WebServlet("/game/deleteelement")
public class DeleteGameElementController extends HttpServlet {
	//게시판 글 삭제
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파라미터 받기
		int elementIdx = Integer.parseInt(request.getParameter("elementIdx"));
		
		//2. 해당 게시판 글의 실제 파일부터 삭제
		ElementInfoDao dao = new ElementInfoDao();
		ElementInfo elementInfo = dao.selectElementInfoByElementIdx(elementIdx);
		if(elementInfo.getElementImg() != null) {
			String path = request.getRealPath(elementInfo.getElementImg());
			
			File file = new File(path);
			file.delete();
		}
		
		//3. db에 게시판 글 삭제
		boolean result = dao.deleteElementInfoByElementIdx(elementIdx);
		
		//4. 게시판 글 삭제 성공/실패 처리
		if(result) {
			response.setStatus(HttpServletResponse.SC_OK);
		}else {
			
		}
		
		
	}
}
