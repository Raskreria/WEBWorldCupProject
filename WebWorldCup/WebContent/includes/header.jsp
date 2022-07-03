<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 제이쿼리 -->
<script src="/worldcup/js/jquery-3.6.0.min.js"></script>

<header class="p-1	 bg-success text-white">
	<div class="container">
		<div
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
			<!-- 로고 style="color:white" -->
			<a href="${MAIN_PAGE}" style="color: white"> <svg
					xmlns="http://www.w3.org/2000/svg" width="32" height="32"
					fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
					  	<path fill-rule="evenodd"
						d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
						  <path fill-rule="evenodd"
						d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
					</svg>
			</a>
			<ul
				class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
				<li><a href="#">
						<button type="button" class="btn btn-outline-light"
							style="border: 0px">
							<b>페이지 소개</b>
						</button>
				</a></li>
				<li><a href="${BOARD_PAGE}">
						<button type="button" class="btn btn-outline-light"
							style="border: 0px">
							<b>게시판</b>
						</button>
				</a></li>
				<li><a href="#">
						<button type="button" class="btn btn-outline-light"
							style="border: 0px">
							<b>게임 만들기</b>
						</button>
				</a></li>
			</ul>

			<!-- <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
					<input type="search" class="form-control form-control-dark"
						placeholder="Search..." aria-label="Search">
				</form> -->

			<%--로그인이 되어 있다면 --%>
			<c:if test="${loginUserInfo ne null}">
				<b class="mx-3">${loginUserInfo.name}님 </b>
				
				<div class="dropdown text-end">

					<a href="#"
						class="d-block link-dark text-decoration-none dropdown-toggle show"
						id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="true">
						<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
						  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
					</a>
				
					<ul class="dropdown-menu dropdown-menu-dark"
						aria-labelledby="dropdownMenuButton2">
						<li><a class="dropdown-item active" href="${MEMBERINFO_SERVLET}">회원정보 수정</a></li>
						<li><a class="dropdown-item" href="#">지난게임 기록</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a id="logout" class="dropdown-item">로그아웃</a></li>
						<%--로그인한 사용자가 관리자라면 --%>
						<c:if test="${loginUserInfo.id eq 'admin'}">
							<li><a class="dropdown-item"
								href="">관리</a></li>
						</c:if>
					
					</ul>
				</div>


			</c:if>
			<%--로그인이 되어 있지 않다면 --%>
			<c:if test="${loginUserInfo eq null}">
				<div class="text-end">
					<a href="${LOGIN_PAGE}">
						<button type="button" class="btn btn-outline-light me-3">
							<b>로그인</b>
						</button>
					</a> <a href="${JOIN_PAGE}">

						<button type="button" class="btn btn-outline-light me-3">
							<b>회원가입</b>
						</button>

					</a>
				</div>
			</c:if>


		</div>
	</div>
</header>

<script>
			$("#logout").on("click",function(event){ 
				event.preventDefault();
				sessionStorage.removeItem("loginUserInfo");
				alert("로그아웃 되었습니다.");
				location.reload();
			});

</script>
