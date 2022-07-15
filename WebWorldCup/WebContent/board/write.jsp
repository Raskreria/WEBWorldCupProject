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
	<%@ include file="/includes/boardSideBar.jsp"%>

	<!-- 	게시판 상세 -->
	<section>
		<form action="/worldcup/board/write" method="POST" enctype="multipart/form-data">
			<div class="container col-8" id="boardRead">
				<div id="boardTopbtn">
					
					<button class="btn btn-primary" id="boardWritebtn" type="submit" >작성</button>
					<button class="btn btn-secondary" id="prevPage" type="button" style="float:right;">목록으로</button>
					<br/>
					<br/>
				</div>
				<!-- 게시판 상세 헤더 -->
				<div id="boardReadHeader">
					<h1 id="boardCategoryTitle">
						<c:if test="${param.category eq 'notice'}">
						공지사항
						</c:if>
						<c:if test="${param.category eq 'community'}">
						커뮤니티
						</c:if>
					</h1>
					<input type="hidden" name="category" value="${param.category}"/>
					 <div id="title_wrapper">
						<label>제목&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="title" style="width:600px;"></label>
					</div>
				</div>
						
				<hr>
				<!-- 게시판 상세 내용 -->
				<div id="boardReadBody" class="mb-5">
					<div id="contents_wrapper">
						<label>내용<br><textarea name="contents" cols="100" rows="10"></textarea> </label>
					</div>
				</div>
				
				<!-- 게시판 footer(첨부파일,좋아요) -->
				<div id="boardReadFooter">
					<div id="file_wrapper">
						<label>첨부파일 : <input type="file" name="file"></label>
					</div>
				</div>
				
				<hr>
				
		
				
				<!-- 게시판 Nav -->
				<div id="boardReadNavigation">
					<button id="prevPage" class="btn btn-secondary" type="button">목록으로</button>
				</div>
			</div>
		</form>
		
	</section>
	
	
		
	<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
	<script src="/worldcup/js/URLs.js"></script>
	<script type="text/javascript">
	
		
		
		//목록으로 버튼 : 이전 페이지로 이동과 동시에 새로고침
		$("#prevPage").on("click", function() {
			window.location = document.referrer;
// 			window.history.back();
		});
		
		
		//수정 버튼
		$("#boardWritebtn").on("click", function() {
		
		});
		
		

	</script>

</body>
</html>