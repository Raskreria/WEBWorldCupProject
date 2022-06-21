package board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardInfoDao;
import vo.BoardInfo;

//test required
@WebServlet("/board/delete")
public class BoardDeleteController extends HttpServlet {
	//게시판 글 삭제
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파라미터 받기
		String category = request.getParameter("category");
		int boardIdx = Integer.parseInt(request.getParameter(category+"Idx"));
		
		//2. 해당 게시판 글의 실제 파일부터 삭제
		BoardInfoDao dao = new BoardInfoDao();
		BoardInfo boardInfo = dao.selectBoardByBoardIdx(category,boardIdx);
		if(boardInfo.getFile() != null) {
			String path = request.getRealPath(boardInfo.getFile());
			
			File file = new File(path);
			file.delete();
		}
		
		//3. db에 게시판 글 삭제
		boolean result = dao.deleteBoradInfoByIdx(boardIdx, category);
		
		//4. 게시판 글 삭제 성공/실패 처리
		if(result) {
			response.setStatus(HttpServletResponse.SC_OK);
		}else {
			
		}
		
		
	}

}
