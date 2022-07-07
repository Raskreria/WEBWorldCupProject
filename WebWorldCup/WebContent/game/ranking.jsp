<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- URLs.jsp -->
<%@ include file="/includes/URLs.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랭킹 페이지</title>
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
	
<!-- URLs.js -->
<script src="../js/URLs.js"></script>

</head>
<body>

	<!-- 헤더 -->
	<%@ include file="/includes/header.jsp"%>
	
	<div class="container col-3">
		<div class="progress progress-striped active">
			<div style="width: 11.61%" aria-valuemax="100" aria-valuemin="0"
				aria-valuenow="11.61" role="progressbar"
				class="progress-bar progress-bar-danger">
			</div>
		</div>
	</div>
	<div class="container col-8">
		<table class="table table-warning table-striped">
			<thead>
				<tr>
					<th scope="col">순위</th>
					<th scope="col">이미지</th>
					<th scope="col">이름</th>
					<th scope="col">우승 비율</th>
					<th scope="col">승률</th>
				</tr>
			</thead>
			<tbody id="elementRankingList">
<!-- 				랭킹 테이블 들어갈 자리 -->
			</tbody>
		</table>
	</div>
	<img src="file/game/element/셰퍼드.jpg" class="d-block w-100" alt="...">
		<!-- 제이쿼리 -->
	<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	let elementInfoList;
	$.ajax({
		url : ELEMENT_RANKING_SERVLET+"?gameIdx=1",
		type : "GET",
		success : function(result) {
			result = JSON.parse(result);
			if(result==null){
				return;
			}
			elementInfoList = result.elementInfoList;
			
			for(var i = 0 ; i<elementInfoList.length; i++ ){
				$("#elementRankingList").append("<tr>"
						+"<th scope=\"row\">"+(i+1)+"</th>"
						+"<td><img src=\""+elementInfoList[i].elementImg+"\""
						+"class=\"d-block w-100\" alt=\"...\"></td>"
						+"<td>"+elementInfoList[i].elementTitle+"</td>"
						+"<td>"+elementInfoList[i].elementWinCount+"</td>"
						+"<td>"+elementInfoList[i].elementSelectCount+"</td>"
					+"</tr>");
			}


		},
		error : function(error) {
			console.log(error);
		}
	});
	</script>
	
</body>
</html>