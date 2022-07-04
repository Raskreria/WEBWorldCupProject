<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- URLs.jsp -->
<%@ include file="/includes/URLs.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 페이지</title>
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



<!-- 	boardSideBar.css -->
<link rel="stylesheet" href="../css/boardSideBar.css">


<!-- 	boardDetail.css -->
<link rel="stylesheet" href="../css/boardDetail.css">
</head>
<body>


	<!-- 헤더 -->
	<%@ include file="/includes/header.jsp"%>

	<!-- 사이드바 -->
	<div id="boardCategory" class="container col-2">
		<h2>공지사항</h2>
		<hr>
		<ul>
			<li><a href="#" class="selected">공지사항</a></li>
			<li><a href="#">커뮤니티</a></li>
		</ul>
	</div>
	
	<!-- 	게시판 상세 -->
	<section>
		
		<div class="container col-8" id="boardRead">
			<!-- 게시판 상세 헤더 -->
			<div id="boardReadHeader">
				 
			
				<h1>
					${boardInfo.boardTitle}
				</h1>
				<div id="boardProfile">
					조회수 ${boardInfo.views},작성자 회원번호 ${boardInfo.memberIdx},글 인덱스 ${boardInfo.boardIdx},게시일 ${boardInfo.pubDate}
					<div id="boardTool">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
					 	 <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
					 	 <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
						</svg>
						댓글
					</div>
				</div>	
				
			</div>
					
			<hr>
			<!-- 게시판 상세 내용 -->
			<div id="boardReadBody" class="mb-5">
			${boardInfo.boardContents} 
			</div>
			
			<!-- 게시판 footer(첨부파일) -->
			<div id="boardReadFooter">
			<p>좋아요 ${boardInfo.like}</p>
			<p>첨부파일 : ${boardInfo.file}</p>
			</div>
			
			<hr>
			
			<!-- 게시판 댓글 -->
			<div id="boardReadComment">
				<div data-v-3b426d7d="" class="CommentWriter">
					<div class="comment_inbox">
						<b class="comment_inbox_name">${loginUserInfo.name}</b>
						<textarea data-v-3b426d7d="" placeholder="댓글을 남겨보세요" rows="3"class="comment_inbox_text"style="overflow: hidden; overflow-wrap: break-word; height: 18px;">
						</textarea>
					</div>
				</div>
			</div>
			
			<!-- 게시판 Nav -->
			<div id="boardReadNavigation">
			페이지네이션자리입니다
			</div>
		</div>
	
	</section>

</body>
</html>