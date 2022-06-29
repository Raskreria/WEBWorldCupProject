<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


	<!-- URLs.jsp -->
	<%@ include file="/includes/URLs.jsp"%>
	
	
	<main class="form-signin">
		<form action="${JOIN_SERVLET}" method="POST">
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
					placeholder="Id" name="id"> <label for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="Password" name="pw"> <label
					for="floatingPassword">비밀번호</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control"
					id="floatingPasswordCheck" placeholder="Password" name="pwChk">
				<label for="floatingPasswordCheck">비밀번호 확인</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingName"
					placeholder="Name" name="name"> <label for="floatingName">이름</label>
			</div>
			
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingAddr"
					placeholder="Addr" name="addr" disabled> <label id="address" for="floatingName">주소</label>
					
				
					<button id="addressbtn" type="button">주소 검색</button>
					<h1 id="zonecode"></h1>
			</div>
			<div class="form-floating">
				<input type="email" class="form-control" id="floatingEmail"
					placeholder="Email" name="email"> <label for="floatingName">이메일</label>
			</div>


			<div class="form-floating">
				<ul class="list-group">
					<li class="list-group-item">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="term1"> <label class="form-check-label" for="term1">
								모든 약관 동의 </label>
						</div>
					</li>
					<li class="list-group-item">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="term2"> <label class="form-check-label" for="term2">
								이용 약관 동의 </label>
						</div>
						<div class="terms">실컷 이용해 먹겠습니다</div>
					</li>
					<li class="list-group-item">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="term3"> <label class="form-check-label" for="term3">
								개인정보 수집 및 이용 동의 </label>
						</div>
						<div class="terms">개인정보는 이제 제껍니다.</div>
					</li>
				</ul>
			</div>

			<button id="submit_btn" class="w-100 btn btn-lg btn-secondary"
				type="submit">회원가입</button>
		</form>
		</main>
<!-- 		제이쿼리 -->
		<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
<!-- 		다음 주소 서비스 -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">
// 		다음 주소 서비스 버튼 클릭 ajax
			$("#addressbtn").on("click",function(){
		        
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
	
		            
		            $("#address").text(addr);
		            $("#zonecode").text(data.zonecode);
		            //우편번호
			       }
		        }).open();
		    });
		</script>
</body>
</html>