package util;

import java.util.ArrayList;
import java.util.List;

//-아이디 규칙 : 최소 4자, 최대 10까지 입력이 가능하고 영문 대소문자와 숫자를 하나 이상 포함하고 있어야함.
//-비밀번호 규칙 : 최소 6자, 최대 16자까지 입력이 가능하고 영문 대소문자와 숫자를 하나 이상 포함하고 있어야함.
//-이름 규칙 : 3자만 가능, 한글만 가능
//-연락처 규칙 : 010-1111-2222 와 같은 형식만 가능 / 각 자리 마다 하이픈이 반드시 있어야 하고 맨 앞자리는 3자, 중간 자리 4자, 마지막 자리는 4자여 야함.
//-주소 규칙 : 특별시, 광역시, 시, 도만 입력 하도록
//-이메일 규칙 : 반드시 @ 을 포함하고 있어야한다.

public class Validator {

	public boolean idValidator(String id) {
		boolean correctID = false;
		correctID = id.length() >= 4 && id.length()<=10;
		
		if(!correctID) {
//			아이디 길이가 4자 미만이거나 10자 초과했다면 이미 내가 정한 아이디 규칙에 부합하지 않으므로
//			다른 조건을 확인할 필요가 없음
//			아이디 길이가 규칙에 부합하지 않으면 return false; 를 해주는 것
			return false;
		}
		// 아이디가 영문 대소문자와 숫자 하나 이상 포함하고 있는지 확인하는 코드
		// 예) ID123 -> 가능 / id123 -> 불가능(대문자가 없기 떄문) / iD -> 불가능(숫자가 없기 떄문)
		// ID12임 -> 불가능(영문 대소문자와 숫자 하나이상을 포함하고 있지만 그외에 문자인 한글 '임'이 들어있기 때문
		// 자바 수업자료 중 조건문, 반복문과 관련된 과제를 보면 아이디, 비밀번호를 체크하는 부분이 있음
		// 자바의 정규표현식을 공부를 해서 적용해보기 (구글에서 아이디 정규 표현식 이런 키워드로 찾아서 그 정규표현식을 해석할 수 있으면 됨)
//			[a-zA-Z0-9]+ -> 영문 대소문자와 숫자만 가지고 있나요?
		correctID = id.matches("^[a-zA-Z0-9]+$");
		if(!correctID) {
//			아이디에 영문 대소문자와 숫자가 아닌 문자가 들어있을 경우 이미 내가 정한 아이디 규칙에 부합하지 않으므로
//			다른 조건을 확인할 필요가 없음
			return false;
		}
		
//		영문 소문자 하나 이상 포함 여부
//		영문 대문자 하나 이상 포함 여부
//		숫자 하나 이상 포함 여부
		for(int i = 0 ; i<id.length() ; i++) {
			char ch = id.charAt(i);
			
			correctID = ch >= 'a' && ch <= 'z';
			if(correctID) {
				// 아이디에 n번째 문자가 소문자 일 경우
				// id가 소문자를 하나 이상 포함하고 있으므로
				// 그 뒤에 문자를 확인할 필요가 없다.
				break;
			}
		}
		if(!correctID) {
			return false;
		}
		// 영문 대문자 하나 이상 포함 여부
		for(int i = 0 ; i<id.length() ; i++) {
			char ch = id.charAt(i);
			
			correctID = ch >= 'A' && ch <= 'Z';
			if(correctID) {
				// 아이디에 n번째 문자가 소문자 일 경우
				// id가 소문자를 하나 이상 포함하고 있으므로
				// 그 뒤에 문자를 확인할 필요가 없다.
				break;
			}
		}
		if(!correctID) {
			return false;
		}
		// 숫자 하나 이상 포함 여부
		for(int i = 0 ; i<id.length() ; i++) {
			char ch = id.charAt(i);
			
			correctID = ch >= '0' && ch <= '9';
			if(correctID) {
				// 아이디에 n번째 문자가 소문자 일 경우
				// id가 소문자를 하나 이상 포함하고 있으므로
				// 그 뒤에 문자를 확인할 필요가 없다.
				break;
			}
		}
		if(!correctID) {
			return false;
		}
		
		return correctID;
	}
	public boolean pwValidator(String pw) {
		// 비밀번호 규칙을 확인하는 코드
		boolean correctPW = false;
		correctPW = pw.length() >= 6 && pw.length()<=16;
		if(!correctPW) {
			return false;
		}
		correctPW = pw.matches("^[a-zA-Z0-9]+$");
		if(!correctPW) {
			return false;
		}
//		영문 소문자 하나 이상 포함 여부
//		영문 대문자 하나 이상 포함 여부
//		숫자 하나 이상 포함 여부
		for(int i = 0 ; i<pw.length() ; i++) {
			char ch = pw.charAt(i);
			correctPW = ch >= 'a' && ch <= 'z';
			if(correctPW) {
				break;
			}
		}
		if(!correctPW) {
			return false;
		}
		for(int i = 0 ; i<pw.length() ; i++) {
			char ch = pw.charAt(i);
			correctPW = ch >= 'A' && ch <= 'Z';
			if(correctPW) {
				break;
			}
		}
		if(!correctPW) {
			return false;
		}
		for(int i = 0 ; i<pw.length() ; i++) {
			char ch = pw.charAt(i);
			correctPW = ch >= '0' && ch <= '9';
			if(correctPW) {
				break;
			}
		}
		if(!correctPW) {
			return false;
		}
		
		return correctPW;
	}
	public boolean nameValidator(String name) {
		// 이름 규칙을 확인하는 코드
		boolean correctName = false;
		correctName = name.length() == 3;
		if(!correctName) {
			return false;
		}
		// 한글만 포함 여부
		correctName = name.matches("^[가-힣]+$");
		if(!correctName) {
			return false;
		}
		return correctName;
	}
	public boolean telValidator(String tel) {
		// 전화번호 규칙을 확인하는 코드
		String[] telSplit = new String[3];
		telSplit = tel.split("-");
		
		if(telSplit.length!=3) {
			return false;
		}
		else if(telSplit[0].length() != 3) {
			return false;
		}else if(telSplit[1].length() != 4 || telSplit[2].length() != 4) {
			return false;
		}
		return true;
	}
	public boolean addrValidator(String addr) {
		// 주소 규칙을 확인하는 코드
		String[] city = {"서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시", "대전광역시", "울산광역시", "세종특별자치시",
				"경기도", "강원도", "충정북도", "전라북도", "전라남도", "경상북도", "경상남도", "제주특별자치도"};
		//addr 매겨변수에 들어있는 값이 위 배열이 가지고 있는 17개 행정구역이 아닐 경우 false를 반환하도록 하세요;
		//반복문을 돌면서 addr 변수에 들어있는 값이 17개 행정구역 중 하나라면 true를 반환해라.
		for(String cityName : city) {
			if(addr.equals(cityName)) {
				return true;
			}
		}
		return false;
	}
	public boolean emailValidator(String email) {
		// 이메일 규칙을 확인하는 코드
		// 간단하게 이메일 안에 @ 있으면 true / 없으면 false를 반환
		return email.contains("@");
	}
	
	public boolean allValidator (String id, String pw, String pwChk, String name, int age, String addr) {
		
		return true;
	}
	
	public boolean loginValidator(String id, String pw) {
		//idValidator(id);
		//pwValidator(pw);
		return true;
	}
	
}
