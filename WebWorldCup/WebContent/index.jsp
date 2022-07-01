<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- URLs.jsp -->
<%@ include file="/includes/URLs.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월드컵 메인 페이지</title>
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

<!-- nav css -->
<link rel="stylesheet" href="/worldcup/css/nav.css">
<!-- URLs.js -->
<script src="../js/URLs.js"></script>
</head>
<body>

	<!-- 헤더 -->
	<%@ include file="/includes/header.jsp"%>

	<!-- NAV -->
	<nav class="bg-light">
		<div class="container border border-dark border-3 mt-3 p-2 bg-white">
			<div class="row">
				<div class="data_area col-1 pl-2">

					<h5 class="Ntxt_today_webtoon">한눈에 보기</h5>
					<p class="date" id="curDate">6월 25일 토요일</p>

					<ul id="listMenu" class="p-0 mt-5 pt-5">
						<li class=""><a href="javascript:void(0);"
							onclick="nclk_v2(event,'twt.byuser')"><span
								class="Ntxt_popular">인기순</span></a></li>
						<li class=""><a href="javascript:void(0);"
							onclick="nclk_v2(event,'twt.byupdate')"><span
								class="Ntxt_update">최신순</span></a></li>
						<li class="sel"><a href="javascript:void(0);"
							onclick="nclk_v2(event,'twt.byscore')"><span
								class="Ntxt_star_rate">별점순</span></a></li>
					</ul>
				</div>

				<div id="carouselExampleDark"
					class="carousel carousel-dark slide col-6" data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleDark"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleDark"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleDark"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active" data-bs-interval="2000">
							<img src="https://via.placeholder.com/400x200.jpg"
								class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5>First slide label</h5>
								<p>Some representative placeholder content for the first
									slide.</p>
							</div>
						</div>
						<div class="carousel-item" data-bs-interval="2000">
							<img src="https://via.placeholder.com/400x200.jpg"
								class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5>Second slide label</h5>
								<p>Some representative placeholder content for the second
									slide.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img src="https://via.placeholder.com/400x200.jpg"
								class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5>Third slide label</h5>
								<p>Some representative placeholder content for the third
									slide.</p>
							</div>
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleDark" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleDark" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</nav>

	<section>


		<div class="album py-1 bg-light">
			<div class="container p-0">
				<!-- 					 게임검색 / 정렬방식 -->
				<div class="row my-2">
					<!-- 					게임 검색 -->
					<form class="col-5 d-flex py-2">
						<input class="form-control me-2" type="search" placeholder="게임검색"
							aria-label="Search">
						<button class="btn btn-outline-success" type="submit">
							<svg style="display: inline-block"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  								<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
							</svg>
						</button>
					</form>

					<!-- 				정렬 방식 -->
					<select class="form-select form-select-sm w-25 p-2 my-2"
						aria-label=".form-select-sm example">
						<option value="1" selected>인기순</option>
						<option value="2">최신순</option>
					</select>

				</div>
				<!-- 					썸네일 목록-->
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3" id="thumbnailList">
					<!-- 					썸네일 -->
					<c:forEach items="${gameInfoList}" var="nthGameInfo">
						<div class="col-xs-6 col-sm-3 col-lg-2.4">
							<div class="card shadow-sm">
								<img src="http://localhost/worldcup/${nthGameInfo.gameImg}"
									class="d-block w-100" alt="...">
									<h1>${nthGameInfo.gameImg}</h1>
								<div class="card-body">
									<p class="card-text">${nthGameInfo.gameTitle}</p>
									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">
											<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
											<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
										</div>
										<small class="text-muted">9 mins</small>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					


				</div>
			</div>
		</div>
	</section>


	<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(window).scroll(
				function() { //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
					if ($(window).scrollTop()+150 >= $(document).height() - $(window).height() ) {
						for(var i =0 ; i<10 ; i++){
							
							$("#thumbnailList").append("<div class=\"col-xs-6 col-sm-3 col-lg-2.4\">"
									+ "						<div class=\"card shadow-sm\">"
									+ "							<img src=\"https://via.placeholder.com/300x180.jpg\""
									+ "								class=\"d-block w-100\" alt=\"...\">"
									+ "							<div class=\"card-body\">"
									+ "								<p class=\"card-text\">각종 버튼 위치</p>"
									+ "								<div class=\"d-flex justify-content-between align-items-center\">"
									+ "									<div class=\"btn-group\">"
									+ "										<button type=\"button\" class=\"btn btn-sm btn-outline-secondary\">View</button>"
									+ "										<button type=\"button\" class=\"btn btn-sm btn-outline-secondary\">Edit</button>"
									+ "									</div>"
									+ "									<small class=\"text-muted\">9 mins</small>"
									+ "								</div>"
									+ "							</div>"
									+ "						</div>"
									+ "					</div>");
						}
					}
				});
	</script>

</body>
</html>