package record;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecordInfoDao;
import vo.RecordInfo;
// test required
@WebServlet("/record/list")
public class RecordListController extends HttpServlet {
	// 지난 게임 기록 가져오기
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파라미터 받기
		int memberIdx = Integer.parseInt(request.getParameter("memberIdx"));
		int loadNumber = Integer.parseInt(request.getParameter("loadCount"));
		
		//2. db에서 기록 가져와서 List로 구성
		RecordInfoDao dao = new RecordInfoDao();
		List<RecordInfo> recordInfoList = dao.selectRecordsByMemberIdx(memberIdx, loadNumber);
		
		//3. JSP에서 사용하기 위해 객체로 저장.
		request.setAttribute("recordInfoList", recordInfoList);
		RequestDispatcher rd = request.getRequestDispatcher("/worldcup/index.jsp");
		rd.forward(request, response);
		
		
	}
}
