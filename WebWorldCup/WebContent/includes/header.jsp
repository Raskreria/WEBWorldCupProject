<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<header class="p-1	 bg-success text-white">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<!-- 로고 style="color:white" -->
				<a href="#" style="color:white">
					<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
					  	<path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
						  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
					</svg>
				</a>
				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li>
					<button type="button" class="btn btn-outline-light" style="border:0px"> <b>페이지 소개</b> </button>
					</li>
					<li>
					<button type="button" class="btn btn-outline-light" style="border:0px"> <b>게시판</b> </button>
					</li>
					<li>
					<button type="button" class="btn btn-outline-light" style="border:0px"> <b>게임 만들기</b> </button>
					</li>
				</ul>

				<!-- <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
					<input type="search" class="form-control form-control-dark"
						placeholder="Search..." aria-label="Search">
				</form> -->

				<div class="text-end">
					<a href="${LOGIN_PAGE}">
						<button type="button" class="btn btn-outline-light me-3"> 
							<b>로그인</b> 
						</button>
					</a>
					<a href="${JOIN_PAGE}">
						
						<button type="button" class="btn btn-outline-light me-3">
							<b>회원가입</b> 
						</button>
					
					</a>
				</div>
			</div>
		</div>
	</header>
