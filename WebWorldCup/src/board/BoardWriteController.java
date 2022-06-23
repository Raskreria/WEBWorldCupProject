package board;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardInfoDao;
import vo.BoardInfo;
import vo.MemberInfo;

@WebServlet("/board/write")
public class BoardWriteController extends HttpServlet {
	private static final int MAXIMUM_FILE_SIZE = 5 * 1024 * 1024;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String path = request.getRealPath("/file/board");
		MultipartRequest multi = new MultipartRequest(request, path, MAXIMUM_FILE_SIZE, "UTF-8", new DefaultFileRenamePolicy());
		
		request.setCharacterEncoding("UTF-8");
		String category = multi.getParameter("category");
		String title = multi.getParameter("title");
		String contents = multi.getParameter("contents");
		LocalDateTime pubDate = LocalDateTime.now();
		
		
		String fileSystemName = multi.getFilesystemName("file");
		String filePath = null;
		if(fileSystemName != null) {
			filePath = "/file/board/" + fileSystemName;
		}
		
		HttpSession session = request.getSession();
		MemberInfo memberInfo = (MemberInfo)session.getAttribute("loginUserInfo");
		int memberIdx = memberInfo.getIdx();
		
		// 공지사항 데이터들을 공지사항 정보로 뭉쳐줌
		BoardInfo boardInfo = new BoardInfo(memberIdx, title, contents, filePath, pubDate);
		
		BoardInfoDao dao = new BoardInfoDao();
		boolean result = dao.insertBoardInfo(category,boardInfo);
		
		if(result) {
			// 공지사항 목록 페이지로 이동
			response.setStatus(HttpServletResponse.SC_OK);
			response.sendRedirect("/worldcup/board_list.jsp");
		} else {
			// 공지사항 추가 실패와 관련된 처리를 함
		}
	}

}
