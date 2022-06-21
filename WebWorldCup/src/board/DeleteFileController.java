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
@WebServlet("/board/deletefile")
public class DeleteFileController extends HttpServlet {
	//게시판 글 수정페이지 파일 삭제
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파라미터 받기	
		String category = request.getParameter("category");
		int boardIdx = Integer.parseInt(request.getParameter(category+"Idx"));
		
		//2. 파라미터로 해당 파일 경로 받아오기
		BoardInfoDao dao = new BoardInfoDao();
		BoardInfo boardInfo = dao.selectBoardByBoardIdx(category, boardIdx);
		String filePath = boardInfo.getFile();
		
		//3. db에 파일경로 삭제
		dao.deleteFileByBoardIdx(category,boardIdx);
		
		//4. 실제 해당 경로에 있는 파일 삭제
		File file = new File(request.getRealPath(filePath));
		
		//5. 파일 삭제 성공/실패 처리
		if(file.delete()) {
			response.setStatus(HttpServletResponse.SC_OK);
		}else {
			
		}
	}

}
