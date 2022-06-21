package record;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecordInfoDao;
import vo.RecordInfo;

//test required
@WebServlet("/RecordController")
public class RecordController extends HttpServlet {
	// 게임 결과 페이지 (게임 기록/플레이) 데이터 저장.
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		//1. 파라미터 받기
		int gameIdx = Integer.parseInt(request.getParameter("gameIdx"));
		int memberIdx = Integer.parseInt(request.getParameter("memberIdx"));
		String gameRecord = null;
		if(request.getParameter("gameRecord")!=null) {
			gameRecord = request.getParameter("gameRecord");
		}
		LocalDateTime playDate = LocalDateTime.now();
		
		//2. 합쳐서 db에 기록
		RecordInfo recordInfo = new RecordInfo(gameIdx, memberIdx, gameRecord, playDate);
		RecordInfoDao dao = new RecordInfoDao();
		boolean result = dao.insertRecordInfo(recordInfo);
		
		//3. 성공/실패 처리
		if (result) {

		} else {

		}

	}

}
