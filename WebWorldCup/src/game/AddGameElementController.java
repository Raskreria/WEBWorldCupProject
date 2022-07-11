package game;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ElementInfoDao;
import vo.ElementInfo;
//게임만들기 페이지에서 요소 데이터 추가
//테스트 완료 0703
@WebServlet("/game/addelement")
public class AddGameElementController extends HttpServlet {
	private static final int MAXIMUM_FILE_SIZE = 5 * 1024 * 1024;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String path = request.getRealPath("/file/game/element");
		MultipartRequest multi = new MultipartRequest(request, path, MAXIMUM_FILE_SIZE, "UTF-8",
				new DefaultFileRenamePolicy());

		request.setCharacterEncoding("UTF-8");
		int gameIdx = Integer.parseInt(multi.getParameter("gameIdx"));
		String elementTitle = multi.getParameter("elementTitle");

		//2. 파일경로 가공
		String fileSystemName = multi.getFilesystemName("elementImg");
		String filePath = null;
		if(fileSystemName != null) {
			filePath = "file/game/element/" + fileSystemName;
		}


		ElementInfo elementInfo = new ElementInfo();
		elementInfo.setGameIdx(gameIdx);
		elementInfo.setElementTitle(elementTitle);
		elementInfo.setElementImg(filePath);
		
		//3. 파일경로 db저장
		ElementInfoDao dao = new ElementInfoDao();
		dao.insertElementInfo(elementInfo);
		elementInfo = dao.selectThisElementInfo(elementInfo);
		
		PrintWriter out = response.getWriter();
		out.print(elementInfo.getElementIdx());


	}

}
