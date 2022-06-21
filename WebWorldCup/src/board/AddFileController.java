package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardInfoDao;
//test required
@WebServlet("/AddFileController")
public class AddFileController extends HttpServlet {
	//파일 크기 지정 상수
	private static final int MAXIMUM_FILE_SIZE = 5 * 1024 * 1024;
	
	//게시판 글 수정페이지에서 파일 추가
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파일 관련 파라미터 받기, 파일 저장.
		String path = request.getRealPath("/file/board");
		MultipartRequest multi = new MultipartRequest(request, path, MAXIMUM_FILE_SIZE, "UTF-8", new DefaultFileRenamePolicy());
		String category = multi.getParameter("category");
		int boardIdx = Integer.parseInt(multi.getParameter(category+"Idx"));
		
		//2. 파일경로 가공
		String fileSystemName = multi.getFilesystemName("file");
		String filePath = null;
		if(fileSystemName != null) {
			filePath = "/file/board/" + fileSystemName;
		}
		
		//3. 파일경로 db저장
		BoardInfoDao dao = new BoardInfoDao();
		dao.addFileByBoardIdx(category, boardIdx, filePath);
		
	}

}
