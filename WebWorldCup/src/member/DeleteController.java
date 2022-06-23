package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberInfoDao;
import vo.MemberInfo;

@WebServlet("/member/delete")
public class DeleteController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션에 저장된 로그인 정보에서 id를 꺼낸다
		
		//회원 탈퇴
		//로그인 상태정보 삭제
		//상태코드 200 설정
		HttpSession session = request.getSession();
		MemberInfo memberInfo = (MemberInfo) session.getAttribute("loginUserInfo");
		String id = memberInfo.getId();
		
		MemberInfoDao dao = new MemberInfoDao();
		dao.deleteMemberInfoById(id);
		
		session.invalidate();
		
		response.setStatus(HttpServletResponse.SC_OK);
	
	}

}
