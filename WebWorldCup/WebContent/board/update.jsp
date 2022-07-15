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
		<form action="/worldcup/board/update" method="POST">
			<div class="container col-8" id="boardRead">
				<div id="boardTopbtn">
					
					<button class="btn btn-primary" id="boardUpdataebtn" type="button" >수정</button>
					<button class="btn btn-secondary" id="prevPage" type="button" style="float:right;">이전으로</button>
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
					<input type="hidden" id="category" name="category" value="${param.category}"/>
					<input type="hidden" id="boardIdx" name="${param.category}Idx" value="${boardInfo.boardIdx}">
					 <div id="title_wrapper">
						<label>제목&nbsp;&nbsp;&nbsp;&nbsp;: <input id="title" type="text" name="title" style="width:600px;" value="${boardInfo.boardTitle}"></label>
					</div>
				</div>
						
				<hr>
				<!-- 게시판 상세 내용 -->
				<div id="boardReadBody" class="mb-5">
					<div id="contents_wrapper">
						<label>내용<br><textarea id="contents" name="contents" cols="100" rows="10">${boardInfo.boardContents}</textarea> </label>
					</div>
				</div>
				
				<!-- 게시판 footer(첨부파일,좋아요) -->
				<div id="boardReadFooter">
					<div id="file_wrapper">
							
						<label>첨부파일 : 
								<c:if test="${boardInfo.file ne null}">
									<a href="/worldcup/${boardInfo.file}" download>${boardInfo.file}
									</a>
									<button id="fileDletebtn" class="btn btn-danger" type="button">삭제</button>
								</c:if>
								<c:if test="${boardInfo.file eq null}">
									<input id="fileAddbtn" type="file" name="file">
								</c:if>
						</label>
					</div>
				</div>
				
				<hr>
				
		
				
				<!-- 게시판 Nav -->
				<div id="boardReadNavigation">
					<button id="prevPage" class="btn btn-secondary" type="button">이전으로</button>
				</div>
			
			</div>
		</form>
		
	</section>
	
	
		
	<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
	<script src="../js/URLs.js"></script>
	<script type="text/javascript">
		

		
		//목록으로 버튼 : 이전 페이지로 이동과 동시에 새로고침
		$("#prevPage").on("click", function() {
			window.location = document.referrer;
// 			window.history.back();
		});
		
		
		//수정 버튼
		$("#boardUpdataebtn").on("click", function() {
			
			var category = $("#category").val();
			var boardIdx = $("#boardIdx").val();
			var title = $("#title").val();
			var contents = $("#contents").val();
			
			$.ajax({
				url : "/worldcup/board/update",
				type : "POST",
				data : "category="+ category + "&"+category+"Idx="+boardIdx+"&title="+title+"&contents="+contents,
				success : function(result) {
					alert("글이 수정 되었습니다.");
					location.href ="/worldcup/board/list";
				},
				error : function(result) {
					alert("에러발생");
				}
			});
		});
		
		$("#fileDletebtn").on("click", function() {
			var category = $("#category").val();
			var boardIdx = $("#boardIdx").val();
			$.ajax({
				url : "/worldcup/board/deletefile",
				type : "POST",
				data : "category="+ category + "&"+category+"Idx="+boardIdx,
				success : function(result) {
					location.reload();
				},
				error : function(result) {
					alert("에러발생");
				}
			});
		});
		$("#fileAddbtn").on("change", function() {
			var category = $("#category").val();
			var boardIdx = $("#boardIdx").val();
			alert(category +" " + boardIdx);
			var form = new FormData();
		    form.append( "file", $("#fileAddbtn")[0].files[0] );
			$.ajax({
				url : "/worldcup/board/addfile?category="+ category + "&"+category+"Idx="+boardIdx,
				type: "POST",
				 processData : false,
		         contentType : false,
		         data : form,
		         dataType: "text",
		         success : function(elementIdx) {
		        	   	 
		         },
		         error: function(){
		       	 	alert("에러발생");
		         }
		    });
		});
	</script>

</body>
</html>