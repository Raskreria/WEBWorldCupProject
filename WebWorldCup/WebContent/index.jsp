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

<!-- index css -->
<link rel="stylesheet" href="/worldcup/css/index.css">
<!-- URLs.js -->
<script src="../js/URLs.js"></script>
</head>
<body>

	<!-- 헤더 -->
	<%@ include file="/includes/header.jsp"%>

	<!-- NAV -->
	<nav class="bg-light pt-3">
		<div class="container border border-dark border-3 p-2 bg-white">
			<div class="row">
				<div class="data_area col-1 pl-2">
					
					<h5 class="atAGlance">한눈에 보기</h5>
					<p class="date" id="curDate">6월 25일 토요일</p>

					<ul id="listMenu" class="p-0 mt-5 pt-5">
						<li class=""><a href="">
							<span>인기순</span>
						</a></li>
						<li class=""><a href="">
							<span>최신순</span>
						</a></li>
					</ul>
				</div>

				<div id="carouselExampleDark"
					class="carousel carousel-dark slide col-5" data-bs-ride="carousel">
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
						<div class="carousel-item active" data-bs-interval="5000">
							<div class="carouselImgBox">
								<img id="carouselImg1"src="https://via.placeholder.com/400x200.jpg"
									class="d-block w-100" alt="...">
							</div>
							<div id="carouselTitleWrapper1" class="carousel-caption d-none d-md-block">
								<h5 id="carouselTitle1">First slide label</h5>
								
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
				</div >
				<div class="col-3">
				주간 인기순
				</div>
				<div class="col-3">
				월간 인기순
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
					<div class="col-5 d-flex py-2">
						<input id="searhData" class="form-control me-2" type="search" placeholder="게임검색"
							aria-label="Search">
						<button id="searhbtn" class="btn btn-outline-success" type="button">
							<svg style="display:inline-block"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	 								<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
							</svg>
						</button>
					</div>
					<!-- 				정렬 방식 -->
					<select id="sortingMethodSelect"class="form-select form-select-sm w-25 p-2 my-2"
						aria-label=".form-select-sm example">
						<option value="popularity">인기순</option>
						<option value="last">최신순</option>
					</select>
				</div>
				
				
				<!-- 					썸네일 목록-->
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3" id="thumbnailList">
				<!-- 					썸네일 -->

				</div>
			</div>
		</div>
	</section>
<!-- 제이쿼리 -->
<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
	<script src="/worldcup/js/URLs.js"></script>
	<script type="text/javascript">
		//스크롤 내리면 추가 게임썸네일
		let loadNumber = 1;
	
		let sortingMethod;
		let parameters = location.search;
		parameters = parameters.substr(1, parameters.length);
		parameters = parameters.split("=");
		sortingMethod = parameters[1];
		if(sortingMethod == undefined){
			sortingMethod = "popularity";
		}
		
		
		let today = new Date()  
		let week = new Array('일', '월', '화', '수', '목', '금', '토');   
		$("#curDate").text((today.getMonth()+1)+"월 "+today.getDate()+"일 "+week[today.getDay()] +"요일");
		
		
		let gameInfoList;
		$.ajax({
			url : MAIN_THUMBNAIL_SERVLET+"?loadNumber="+loadNumber+"&sortingMethod="+sortingMethod,
			type : "GET",
			success : function(result) {
				

				result = JSON.parse(result);
				if(result==null){
					return;
				}
				gameInfoList = result.gameInfoList;
				
				for(var i = 0 ; i<gameInfoList.length; i++ ){
					$("#thumbnailList").append("<div class=\"col-xs-6 col-sm-3 col-lg-2.4\">"
													+"<div class=\"card shadow-sm\">"
													+"<div class=\"imgBox\">"
														+"<img src=\""+gameInfoList[i].gameImg+"\" "
															+"class=\"d-block w-100\" alt=\"...\">"
															+"</div>"
														+"<div class=\"card-body\">"
															+"<p class=\"card-text\">"+gameInfoList[i].gameTitle+"</p>"
															+"<div class=\"d-flex justify-content-between align-items-center\">"
																+"<div class=\"btn-group\">"
																	+"<a href=\"/worldcup/game/play.jsp?gameIdx="+gameInfoList[i].gameIdx+"&gameTitle="+gameInfoList[i].gameTitle+"\" target=\"_blank\" >"
																		+"<button type=\"button\" class=\"btn btn-sm btn-danger\">게임시작</button>"
																	+"</a>"
																	+"<a href=\"/worldcup/game/ranking.jsp?gameIdx="+gameInfoList[i].gameIdx+"\">"
																	+"<button type=\"button\" class=\"btn btn-sm btn-warning\">랭킹보기</button>"
																	+"</a>"
																	+"<button onclick=\"clip(); return false;\" type=\"button\" class=\"btn btn-sm btn-info\">공유</button>"
																+"</div>"
															+"</div>"
														+"</div>"
													+"</div>"
												+"</div>");
				}
				$("#carouselImg1").attr("src",gameInfoList[0].gameImg);
				$("#carouselTitle1").text(gameInfoList[0].gameTitle);
				for(var i = 1 ; i<3; i++ ){
					$(".carousel-inner").append("<div class=\"carousel-item\" data-bs-interval=\"5000\">"
							+"<div class=\"carouselImgBox\">"
								+"<img id=\"carouselImg"+(i+1)+"\"src=\""+gameInfoList[i].gameImg+"\""
									+"class=\"d-block w-100\" alt=\"...\">"
							+"</div>"
							+"<div id=\"carouselTitleWrapper"+(i+1)+"\" class=\"carousel-caption d-none d-md-block\">"
								+"<h5 id=\"carouselTitle"+(i+1)+"\">"+gameInfoList[i].gameTitle+"</h5>"
							+"</div>"
						+"</div>");
				}

			},
			error : function(error) {
				alert("에러발생");
			}
		});
		
		
		$(window).scroll(
				function() { //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
					if(loadNumber == undefined)
						return;
					
					if ($(window).scrollTop()+150 >= $(document).height() - $(window).height() ) {
						
						
						
						loadNumber++;
						//same with under ajax
						$.ajax({
							url : MAIN_THUMBNAIL_SERVLET+"?loadNumber="+loadNumber+"&sortingMethod="+sortingMethod,
							type : "GET",
							success : function(result) {
								

								result = JSON.parse(result);
								if(result==null){
									return;
								}
								gameInfoList = result.gameInfoList;
								
								for(var i = 0 ; i<gameInfoList.length; i++ ){
									$("#thumbnailList").append("<div class=\"col-xs-6 col-sm-3 col-lg-2.4\">"
																	+"<div class=\"card shadow-sm\">"
																	+"<div class=\"imgBox\">"
																		+"<img src=\""+gameInfoList[i].gameImg+"\" "
																			+"class=\"d-block w-100\" alt=\"...\">"
																			+"</div>"
																		+"<div class=\"card-body\">"
																			+"<p class=\"card-text\">"+gameInfoList[i].gameTitle+"</p>"
																			+"<div class=\"d-flex justify-content-between align-items-center\">"
																				+"<div class=\"btn-group\">"
																					+"<a href=\"/worldcup/game/play.jsp?gameIdx="+gameInfoList[i].gameIdx+"&gameTitle="+gameInfoList[i].gameTitle+"\" target=\"_blank\" >"
																						+"<button type=\"button\" class=\"btn btn-sm btn-danger\">게임시작</button>"
																					+"</a>"
																					+"<a href=\"/worldcup/game/ranking.jsp?gameIdx="+gameInfoList[i].gameIdx+"\">"
																					+"<button type=\"button\" class=\"btn btn-sm btn-warning\">랭킹보기</button>"
																					+"</a>"
																					+"<button type=\"button\" onclick=\"clip(); return false;\" class=\"btn btn-sm btn-info\">공유</button>"
																				+"</div>"
																			+"</div>"
																		+"</div>"
																	+"</div>"
																+"</div>");
								}

							},
							error : function(error) {
								alert("에러발생");
							}
						});
					}
				});
		
// 		정렬방식 선택
		$("#sortingMethodSelect").on("change",function(){
			
			sortingMethod=$(this).val();
			
			//id가 thumbnailList인 태그의 하위태그 전부 삭제 empty메서드
			$("#thumbnailList").empty();
			
			//same with above ajax
			$.ajax({
				url : MAIN_THUMBNAIL_SERVLET+"?loadNumber="+1+"&sortingMethod="+sortingMethod,
				type : "GET",
				success : function(result) {
					

					result = JSON.parse(result);
					if(result==null){
						return;
					}
					gameInfoList = result.gameInfoList;
					
					for(var i = 0 ; i<gameInfoList.length; i++ ){
						$("#thumbnailList").append("<div class=\"col-xs-6 col-sm-3 col-lg-2.4\">"
														+"<div class=\"card shadow-sm\">"
														+"<div class=\"imgBox\">"
															+"<img src=\""+gameInfoList[i].gameImg+"\" "
																+"class=\"d-block w-100\" alt=\"...\">"
																+"</div>"
															+"<div class=\"card-body\">"
																+"<p class=\"card-text\">"+gameInfoList[i].gameTitle+"</p>"
																+"<div class=\"d-flex justify-content-between align-items-center\">"
																	+"<div class=\"btn-group\">"
																		+"<a href=\"/worldcup/game/play.jsp?gameIdx="+gameInfoList[i].gameIdx+"&gameTitle="+gameInfoList[i].gameTitle+"\" target=\"_blank\" >"
																			+"<button type=\"button\" class=\"btn btn-sm btn-danger\">게임시작</button>"
																		+"</a>"
																		+"<a href=\"/worldcup/game/ranking.jsp?gameIdx="+gameInfoList[i].gameIdx+"\">"
																			+"<button type=\"button\" class=\"btn btn-sm btn-warning\">랭킹보기</button>"
																		+"</a>"
																		+"<button type=\"button\" onclick=\"clip(); return false;\" class=\"btn btn-sm btn-info\">공유</button>"
																	+"</div>"
																+"</div>"
															+"</div>"
														+"</div>"
													+"</div>");
					}
					loadNumber=1;
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
		
// 		게임검색
		$("#searhbtn").on("click",function(){
			searhData
			loadNumber=1;
			sortingMethod=$(this).val();
			let gameTitle = $("#searhData").val();
			
			//id가 thumbnailList인 태그의 하위태그 전부 삭제 empty메서드
			$("#thumbnailList").empty();
			
			//same with above ajax
			$.ajax({
				url : MAIN_SEARCH_SERVLET+"?gameTitle="+gameTitle,
				type : "GET",
				success : function(result) {
					

					result = JSON.parse(result);
					if(result==null){
						return;
					}
					loadNumber++;
					gameInfoList = result.gameInfoList;
					
					for(var i = 0 ; i<gameInfoList.length; i++ ){
						$("#thumbnailList").append("<div class=\"col-xs-6 col-sm-3 col-lg-2.4\">"
														+"<div class=\"card shadow-sm\">"
														+"<div class=\"imgBox\">"
															+"<img src=\""+gameInfoList[i].gameImg+"\" "
																+"class=\"d-block w-100\" alt=\"...\">"
																+"</div>"
															+"<div class=\"card-body\">"
																+"<p class=\"card-text\">"+gameInfoList[i].gameTitle+"</p>"
																+"<div class=\"d-flex justify-content-between align-items-center\">"
																	+"<div class=\"btn-group\">"
																		+"<a href=\"/worldcup/game/play.jsp?gameIdx="+gameInfoList[i].gameIdx+"&gameTitle="+gameInfoList[i].gameTitle+"\" target=\"_blank\" >"
																			+"<button type=\"button\" class=\"btn btn-sm btn-danger\">게임시작</button>"
																		+"</a>"
																		+"<a href=\"/worldcup/game/ranking.jsp?gameIdx="+gameInfoList[i].gameIdx+"\">"
																			+"<button type=\"button\" class=\"btn btn-sm btn-warning\">랭킹보기</button>"
																		+"</a>"
																		+"<button type=\"button\" onclick=\"clip(); return false;\" class=\"btn btn-sm btn-info\">공유</button>"
																	+"</div>"
																+"</div>"
															+"</div>"
														+"</div>"
													+"</div>");
					}
					
					//이걸 안해주면 스크롤시 썸네일 불러오는 ajax가 게임검색과 관계없는 썸네일을 불러옴.
					//그렇다고 해당 이벤트를 삭제하자니 검색 후에 다시 정렬방식을 선택하면 스크롤시 추가 썸네일을 불러올 수 없음.
				
					loadNumber=undefined;
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
		function clip(){
			var url = '';
			var textarea = document.createElement("textarea");
			document.body.appendChild(textarea);
			url = window.document.location.href;
			url = url.split("main")[0];
			url += "game/play.jsp?gameIdx=1&gameTitle=1"; 
			textarea.value = url;
			textarea.select();
			document.execCommand("copy");
			document.body.removeChild(textarea);
			alert("URL이 복사되었습니다.")
		};
	</script>

</body>
</html>