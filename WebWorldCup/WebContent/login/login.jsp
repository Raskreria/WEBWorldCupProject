<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
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
<!-- 	login.css -->
<link rel="stylesheet" href="../css/login.css">
<!--  logo.css -->
 <link rel="stylesheet" href="../css/logo.css">
</head>
<body class="text-center">

	<!-- URLs.jsp -->
	<%@ include file="/includes/URLs.jsp"%>
	
	<main class="form-signin">
		<form>
			<h1 class="h3 mb-3 fw-normal">
				<a href="${MAIN_PAGE}" id="logo">
				<svg xmlns="http://www.w3.org/2000/svg" width="70" height="70"fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
 			 		<path fill-rule="evenodd"d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
  					<path fill-rule="evenodd"d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
				</svg>
				</a>
			</h1>

			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"placeholder="Id"> 
				<label for="floatingInput">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
 							<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
					</svg>
					아이디
				</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"placeholder="Password"> 
				<label for="floatingPassword">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"fill="currentColor" class="bi bi-key" viewBox="0 0 16 16">
  					<path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z" />
  					<path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
				</svg>
				비밀번호
				</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					아이디 기억하기
				</label> 
			</div>
			
			<button id="loginbtn" class="w-100 btn btn-lg btn-dark my-1"type="button">로그인</button>
			<button id="joinbtn" class="w-100 btn btn-lg btn-dark"type="button">회원가입</button>


		</form>
		<hr/>
		<button id="loginbtn" class="w-100 btn btn-lg btn-warning my-1"type="button">카카오로 이용하기</button>
		<button id="joinbtn" class="w-100 btn btn-lg btn-primary mb-1"type="button">페이스북으로 이용하기</button>
		<button id="joinbtn" class="w-100 btn btn-lg btn-success"type="button">네이버로 이용하기</button>
		
				
	</main>
	
	<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
	   <script src="../js/URLs.js"></script>
	<script type="text/javascript">

		$("#loginbtn").on("click", function() {

			let id = $("#floatingInput").val();
			let pw = $("#floatingPassword").val();
			console.log(id);
			console.log(pw);


			$.ajax({
				url : LOGIN_SERVLET,
				type : "POST",
				data : "id=" + id + "&pw=" + pw,
				success : function(result) {
					alert("로그인 성공 메인 페이지로 이동합니다.");
					location.href = MAIN_PAGE;
				},
				error : function(result) {
					if (result.status == 400) {
						alert("아이디와 비밀번호를 바르게 입력해주세요");
					} else {
						alert("아이디 비밀번호가 일치하지 않습니다.");
					}

				}
			});
		});
		$("#joinbtn").on("click", function() {
			location.href = JOIN_PAGE;
		});
	</script>
</body>
</html>