<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<!-- URLs.jsp -->
<%@ include file="/includes/URLs.jsp"%>

<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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

<!-- 	board.css -->
<link rel="stylesheet" href="../css/board.css">

<!-- 	boardSideBar.css -->
<link rel="stylesheet" href="../css/boardSideBar.css">

</head>
<body>

	<!-- 헤더 -->
	<%@ include file="/includes/header.jsp"%>
	<!-- 사이드바 -->
	<%@ include file="/includes/boardSideBar.jsp"%>
	
<!-- 	게시판 목록 -->
	<div id="boardListform" class="container col-8">
		<table class="table caption-top">
			<caption>
				<c:if test="${category eq 'notice'}">
				공지사항
				</c:if>
				<c:if test="${category eq 'community'}">
				커뮤니티
				</c:if>
			</caption>
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회</th>
					<th scope="col">좋아요</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList}" var="nthBoardInfo">

					<tr>
						<th scope="row">${nthBoardInfo.boardIdx}</th>
						<td><a href="${BOARD_DETAIL_SERVLET}?category=${category}&${category}Idx=${nthBoardInfo.boardIdx}">${nthBoardInfo.boardTitle}</a></td>
						<td>${nthBoardInfo.memberIdx}</td>

						<td>${nthBoardInfo.pubDate}</td>
						<td>${nthBoardInfo.views}</td>
						<td>${nthBoardInfo.likes}</td>
					</tr>
				</c:forEach>

				
			</tbody>
		</table>
<!-- 		페이지네이션 바 -->
		<nav aria-label="Page navigation example">
			<ul id="pagenation" class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link">Previous</a></li>
				
				
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
		
		<div id="boardBottombtn">
				<c:if test="${loginUserInfo ne null}">
					<button class="boardWritebtn" type="button" style="float:right;">글쓰기</button>
				</c:if>
		</div>
	</div>

	<!-- 제이쿼리 -->
	<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
	<script src="/worldcup/js/URLs.js"></script>
	<script type="text/javascript">
	
		// 공지사항 목록의 페이지네이션을 구성할 ajax
		// ajax가 공지사항의 전체 개수를 받아와서
		// 전체 개수를 사용해서 적절히 페이지네이션을 출력
		$.ajax({
			url : BOARD_AMOUNT_SERVLET+"?category=${category}",
			type : "GET",
			success : function(amount) {
				let roofCount = Math.ceil(amount / 10);

				for (let i = 1; i <= roofCount; i++) {
					// 페이지네이션 출력
					$("#pagenation li:last-child").before("<li id=\"page-"+i+"\"class=\"page-item\">"
									+"<a class=\"page-link\" href=\""+Board_LIST_SERVLET+"?category="+"${category}"+"&pageNumber="+i+"\" >"
											+i+"</a></li>"
					
					);
				}


			},
			error : function(error) {
				console.log(error);
			}
		});
		$(".boardWritebtn").on("click",function(){
			location.href="/worldcup/board/write.jsp?category=${category}";
		});
		
	</script>
</body>
</html>