package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberInfoDao;
import vo.MemberInfo;

//삭제요망 updateController doGet 메서드에 넣음
@WebServlet("/deleteplz")
public class SearchLoginInfoController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberInfo memberInfo = (MemberInfo)session.getAttribute("loginUserInfo");
		String id = memberInfo.getId();
		
		MemberInfoDao dao = new MemberInfoDao();
		MemberInfo searchMemberInfo = dao.selectById(id);
		
		request.setAttribute("memberInfo", searchMemberInfo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/member/update.jsp");
		rd.forward(request, response);
		
	}


}
