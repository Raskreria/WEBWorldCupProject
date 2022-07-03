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
import exception.BadParameterException;
import service.MemberService;
import util.Validator;
import vo.MemberInfo;

@WebServlet("/member/update")
public class UpdateController extends HttpServlet {
	//회원정보 수정 페이지 기존 회원 정보 가져오기
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
	//회원정보 수정 반영
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1. 수정할 정보 받아오기
			request.setCharacterEncoding("UTF-8");
			String pw = request.getParameter("newPw");
			String pwChk = request.getParameter("pwChk");
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			String addr = request.getParameter("addr");
			
			//2. 세션에서 유저 아이디 꺼내주기
			HttpSession session = request.getSession();
			MemberInfo loginInfo = (MemberInfo)session.getAttribute("loginUserInfo");
			String id = loginInfo.getId();
			
			//3. 파라미터 검증
			Validator validator = new Validator();
			if(!validator.allValidator(id, pw, pwChk, name, age, addr))
				throw new BadParameterException();
			
			//4. 수정할 회원 정보 합쳐서 구성
			MemberInfo updateMemberInfo = new MemberInfo(id, pw, name, age, addr, null);
			
			//5. 수정하기
			MemberService service = new MemberService();
			service.updateMemberInfo(updateMemberInfo);
			response.setStatus(HttpServletResponse.SC_OK); //성공 200
			
		}catch(BadParameterException e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			//파라미터 검증 실패 409
		}
	}

}
