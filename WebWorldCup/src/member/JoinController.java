package member;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exception.BadParameterException;
import service.MemberService;
import util.Validator;
import vo.MemberInfo;

@WebServlet("/member/join")
public class JoinController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.전달받은 값을 꺼낸다.
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pwChk = request.getParameter("pwChk");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String addr = request.getParameter("addr");
		LocalDateTime joinDate = LocalDateTime.now();
		
		
		try {
			//2. 파라미터 확인
			Validator  validator = new Validator();
			if(!validator.allValidator(id,pw,pwChk,name,age,addr))	 throw new BadParameterException();
			//3. 객체로 만들기.
			MemberInfo newMemberInfo = new MemberInfo(id,pw,name,age,addr,joinDate);
			//4. 사용중인 아이디 인지 확인
			MemberService service = new MemberService();
			if(service.isAlreadyID(id)) {
				response.setStatus(HttpServletResponse.SC_CONFLICT); //사용중인 아이디 409
				return;
			}
			
			int status = service.join(newMemberInfo);
			response.setStatus(status); //성공 200 
			
		}catch(BadParameterException e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST); //파라미터 규칙 위반 400
		}


	}
}
