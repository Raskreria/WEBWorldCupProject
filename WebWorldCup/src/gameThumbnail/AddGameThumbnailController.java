package gameThumbnail;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.GameInfoDao;
import vo.GameInfo;

//미완성 
@WebServlet("/game/addthumbnail")
public class AddGameThumbnailController extends HttpServlet {

	//파일 크기 지정 상수
	private static final int MAXIMUM_FILE_SIZE = 5 * 1024 * 1024;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 이미지 관련 파라미터 받기, 파일 저장.
		String path = request.getRealPath("/file/game/thumbnail");
		MultipartRequest multi = new MultipartRequest(request, path, MAXIMUM_FILE_SIZE, "UTF-8", new DefaultFileRenamePolicy());
		int regMemberIdx =Integer.parseInt(multi.getParameter("regMemberIdx")); 
		String gameTitle = multi.getParameter("gameTitle");
		
		//2. 파일경로 가공
		String fileSystemName = multi.getFilesystemName("file");
		String filePath = null;
		if(fileSystemName != null) {
			filePath = "/file/game/thumbnail" + fileSystemName;
		}
		
		GameInfo gameInfo = new GameInfo(0,regMemberIdx,gameTitle,filePath);
		//3. 파일경로 db저장
		GameInfoDao dao = new GameInfoDao();
		dao.insertGameInfo(gameInfo);
		
	}

}
