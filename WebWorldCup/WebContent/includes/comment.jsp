<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- URLs.jsp -->
<%@ include file="../includes/URLs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 기능 테스트 페이지</title>
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
</head>
<body>

	<div id="commentBox" class="container p-0">
		<div id="commentList">
			<ul>
<!-- 			댓글자리 -->
			</ul>
		</div>
	</div>

	
	<!-- 제이쿼리 -->
	<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
	<script src="/worldcup/js/URLs.js"></script>
	<script type="text/javascript">
		let commentInfoList;
		let category = "game";
		let gameIdx = 1;
		let loadNumber = 1;
		$.ajax({
			url : COMMENT_LIST_SERVLET+"?category="+category+"&gameIdx="+gameIdx+"&loadNumber="+loadNumber,
			type : "GET",
			success : function(result) {
				
		
				result = JSON.parse(result);
				if(result==null){
					return;
				}
				commentInfoList = result.commentInfoList;
				
				for(var i = 0 ; i<commentInfoList.length; i++ ){
					$("#commentList > ul").append("<li>"
							+"<span> <b>"+commentInfoList[i].name+"</b> </span> <small>"+commentInfoList[i].commentDate+"</small>"
							+"<div>  "+commentInfoList[i].comment+"</div>"				
						+"</li>");
				}
		
			},
			error : function(error) {
				alert("에러발생");
			}
		});
	</script>

</body>

</html>