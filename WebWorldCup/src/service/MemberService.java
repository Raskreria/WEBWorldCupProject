package service;

import javax.servlet.http.HttpServletRequest;

import dao.MemberInfoDao;
import vo.MemberInfo;

public class MemberService {
	
	//아이디가 이미 사용중인지 확인하는 메서드
	public boolean isAlreadyID(String id) {
		MemberInfoDao dao = new MemberInfoDao();
		MemberInfo memberInfo = dao.selectById(id);
		if(memberInfo == null) {
			return false;
		}else {
			return true;
		}
	}
	
	//회원가입 메서드
	public int join(MemberInfo newMemberInfo) {
		MemberInfoDao dao = new MemberInfoDao();
		boolean result = dao.insert(newMemberInfo);
		if(result) {
			return 200;
		}else {
			return 400;
		}
	}
	
	public void updateMemberInfo(MemberInfo updateMemberInfo) {
		MemberInfoDao dao = new MemberInfoDao();
		
		dao.updateById(updateMemberInfo);
	}
	
}
