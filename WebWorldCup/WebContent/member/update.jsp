<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- URLs.jsp -->
<%@ include file="/includes/URLs.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- 	join.css -->
<link rel="stylesheet" href="/worldcup/css/join.css">
<!--  logo.css -->
<link rel="stylesheet" href="../css/logo.css">
</head>
<body class="text-center">

	<main class="form-signin">
		<form action="${MEMBERINFO_UPDATE_SERVLET}" method="POST">
			<h1 class="h3 mb-3 fw-normal">
				<a href="${MAIN_PAGE}" id="logo"> <svg
						xmlns="http://www.w3.org/2000/svg" width="70" height="70"
						fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
 			 		<path fill-rule="evenodd"
							d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
  					<path fill-rule="evenodd"
							d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
				</svg>
				</a>
			</h1>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="Id" name="id" disabled value="${memberInfo.id}"> <label for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingCurrentPassword"
					placeholder="CurrentPassword" name="currentPw"> <label
					for="floatingCurrentPassword">현재 비밀번호</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingNewPassword"
					placeholder="NewPassword" name="newPw"> <label
					for="floatingNewPassword">새 비밀번호</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control"
					id="floatingNewPasswordCheck" placeholder="NewPasswordCheck" name="pwChk">
				<label for="floatingNewPasswordCheck">새 비밀번호 확인</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingName"
					placeholder="Name" name="name" value="${memberInfo.name}"> <label for="floatingName">이름</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingAge"
					placeholder="Age" name="age" value="${memberInfo.age}"> <label for="floatingAge">나이</label>
			</div>

			<div class="form-floating">
				<input type="text" class="form-control" id="floatingAddr"
					placeholder="Addr" name="addr" disabled value="${memberInfo.addr}"> <label
					for="floatingAddr">주소</label>

				<button class="btn btn-outline-success p-3 m-0" id="address-btn"
					type="button">
					<svg style="display: inline-block"
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							<path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
					</svg>
				</button>
			</div>

			<div class="form-floating">
				<input type="text" class="form-control" id="floatingZoneCode"
					placeholder="Addr" name="zoneCode" disabled> <label
					for="zoneCode">우편번호</label>
			</div>




			

			<button id="submit_btn" class="w-100 btn btn-lg btn-secondary"
				type="submit">회원정보 수정</button>
		</form>
	</main>
	<!-- 		제이쿼리 -->
	<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
	
	<!-- 	 	URLs.js -->
	<script src="/worldcup/js/URLs.js"></script>
	
	<!-- 		다음 주소 서비스 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
	<script type="text/javascript">
// 		다음 주소 서비스 버튼 클릭 ajax
			$("#address-btn").on("click",function(){
		        
		        new daum.Postcode({
		        oncomplete: function(data) {
		            var addr;
		            if(data.userSelectedType === 'R'){
		                addr = data.roadAddress;
		                //도로명 선택
		            }else{
		                addr = data.jibunAddress;
		                //지번선택
		            }
	
		            
		            $("#floatingAddr").val(addr);
		            $("#floatingZoneCode").val(data.zonecode);
		            //우편번호
			       }
		        }).open();
		});
		
// 			회원가입 버튼 클릭시
		$("#submit_btn").on("click",
				function(event) {
					event.preventDefault();
					// 	 alert("회원가입버튼의 기본 클릭이벤트가 무시되었음.")
					// 사용자가 입력한 값 검증
					// (회원 가입 서블릿에서 정규표현식으로 검증했듯이 자바스크립트의 정규표현식을 사용해서 검증)
					// 2. 현재 비밀번호 검증
					let $currentPw = $("#floatingCurrentPassword");
					// 3. 새 비밀번호 검증
					let $newPw = $("#floatingNewPassword");
					// 3. 비밀번호 확인 검증
					let $pwChk = $("#floatingNewPasswordCheck");
					// 4. 이름 검증
					let $name = $("#floatingName");
					
					let $age = $("#floatingAge");
					// 6. 주소 검증
					let $addr = $("#floatingAddr");
					// 7. 이메일 검증
					let $zoneCode = $("#floatingZoneCode");
					
					
					

					let newPw = $newPw.val();
					let pwChk = $pwChk.val();
					let name = $name.val();
					let age = $age.val();
					let addr = $addr.val();
					let zoneCode = $zoneCode.val();
					
					
					console.log("newPw = " + newPw);
					console.log("pwChk = " + pwChk);
					console.log("name = " + name);
					console.log("age = " + age);
					console.log("addr = " + addr);
					console.log("zoneCode = " + zoneCode);

					$.ajax({
						url : MEMBERINFO_UPDATE_SERVLET,
						type : "POST",
						data : "newPw=" + newPw + "&pwChk=" + pwChk
								+ "&name=" + name + "&age="
								+ age+ "&addr="
								+ addr + "&zoneCode=" + zoneCode,
						success : function() {
							//회원가입에 성공했을 경우
							alert("회원 정보가 수정 되었습니다! 메인 페이지로 이동합니다.");
							location.href = MAIN_PAGE;
						},
						error : function(response) {
							console.log(response);
							//회원 가입에 실패했을 경우
							if (response.status == 409) {
								alert("아이디가 이미 사용중입니다.");
							} else if (response.status == 400) {
								//2.파라미터가 규칙에 맞지 않을 떄 : 400
								alert("가입 정보를 올바르게 입력하세요.");
							}

						}
					});
				});
	</script>
</body>
</html>