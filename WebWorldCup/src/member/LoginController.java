package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberInfoDao;
import exception.BadParameterException;
import util.Validator;
import vo.MemberInfo;

@WebServlet("/member/login")
public class LoginController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1. 사용자가 입력한 id,pw를 파라미터로 받아오기
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			//2. 파라미터 검증
			Validator validator = new Validator();
			if(!validator.loginValidator(id,pw)) throw new BadParameterException();
			
			//3. 아이디로 회원정보 찾기
			MemberInfoDao dao = new MemberInfoDao();
			MemberInfo memberInfo = dao.selectById(id);
			
			//4. 로그인
			//4-1. 로그인 실패 체크
			if(memberInfo == null || !memberInfo.getPw().equals(pw)) {
				// 4-1. 로그인 실패시 401
				response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
				
			}else {
			// 4-2. 로그인 성공
				// 4-2-1. 로그인 회원 정보 구성
				MemberInfo loginInfo = new MemberInfo();
				loginInfo.setIdx(memberInfo.getIdx());
				loginInfo.setName(memberInfo.getName());
				loginInfo.setId(id);
				loginInfo.setPw(pw);
				// 4-2-2. 로그인 회원 정보 세션에 저장.
				HttpSession session = request.getSession();
				session.setAttribute("loginUserInfo", loginInfo);
				
				// 4-2-3. 로그인 성공시 200
				response.setStatus(HttpServletResponse.SC_OK);
			}
		}catch(BadParameterException e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
	
	}

}
