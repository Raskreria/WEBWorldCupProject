<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- URLs.jsp -->
<%@ include file="/includes/URLs.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${gameTitle}</title>
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


<!-- 	play.css -->
<link rel="stylesheet" href="../css/play.css">

</head>
<body>
	<div>
		<h1>월드컵 게임 16강</h1>
	</div>
	
	<span>
<!-- 	 	왼쪽 요소 -->
		<span class="card shadow-sm col-6" style="float: left;">
					<button type="button" id="leftElement">
						<img alt="" src="https://via.placeholder.com/300x180.jpg/" width="100%"
							height="225">
					</button>
					Thumbnail
	
					<div class="card-body">
						<p id="leftElementTitle" class="card-text">요소 타이틀 올자리</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
								<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
						</div>
					</div>
		</span>
<!-- 		오른쪽  요소 -->
		<span class="card shadow-sm col-6" style="displat: inline-block;">
				<button type="button" id="rightElement">
				<img alt="" src="https://via.placeholder.com/300x180.jpg/" width="100%"
					height="225">
				</button>
				Thumbnail
				
				<div class="card-body">
					<p id="rightElementTitle" class="card-text">요소 타이틀 올자리</p>
					<div class="d-flex justify-content-between align-items-center">
						<div class="btn-group">
							<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
						</div>
					</div>
				</div>
		</span>
		
	</span>
	<div class="shuffleWrapper">
		<button id="sufflebtn" type="button" class="btn btn-danger">셔플</button>
	</div>
	<%-- 	<c:forEach items="${elementInfoList}" var="nthElementInfo"> --%>
<%-- 	<p> ${nthElementInfo.elementIdx} </p>  --%>
<%-- 	<p> ${nthElementInfo.elementTitle} <p> --%>
<%-- 	<p> ${nthElementInfo.elementImg} <p>  --%>
<!-- 	<br/> -->
<%-- 	</c:forEach> --%>
	
	
	<!-- 제이쿼리 -->
	<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	let elementInfoList;
	//게임 플레이 데이터를 ajax로 가져오기
	$.ajax({
		url : "/worldcup/game/playdata",
		type : "GET",
		data : "gameIdx=1",
		success : function(result) {
// 			alert("게임 플레이 데이터 불러오기 성공");
			result = JSON.parse(result);
			elementInfoList = result.elementInfoList;
			$("#leftElementTitle").text(elementInfoList[0].elementTitle);
			$("#rightElementTitle").text(elementInfoList[1].elementTitle);
			
			//순서도 제대로 잘 저장이 됨.
		},
		error : function(result) {
			alert("게임 플레이 데이터 불러오기 실패");
		}
	});
	
// 	for(let i=0; i<elementInfoList.length; i++) {
// 		let elementInfo = elementInfoList[i];
		
// 		alert(elementInfo.elementIdx+" "+(i+1));
// 	}

	
	
	$("#leftElement").on("click",function(){
		alert("왼쪽 요소 클릭");
	});
	$("#rightElement").on("click",function(){
		alert("오른쪽 요소 클릭");
	});
	
	</script>
</body>
</html>