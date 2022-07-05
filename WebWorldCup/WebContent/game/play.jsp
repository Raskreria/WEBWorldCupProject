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

</head>
<body>
	<span>
		<button id="leftElement" type="button">요소1	</button>
	</span>
	<span>
		<button id="rightElement" type="button">요소2	</button>
	</span>
	
	
	<c:forEach items="${elementInfoList}" var="nthElementInfo">
<%-- 	<p> ${nthElementInfo.elementIdx} </p>  --%>
<%-- 	<p> ${nthElementInfo.elementTitle} <p> --%>
<%-- 	<p> ${nthElementInfo.elementImg} <p>  --%>
<!-- 	<br/> -->

	</c:forEach>
	
	
	<!-- 제이쿼리 -->
	<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	let elementList = new Array(16);
	console.log('elementList의 길이 : ' + elementList.length);
	
	for(var idx in elementList){
		elementList.push(${elementInfoList})
	}
	console.log('elementList의 길이 : ' + elementList.length);
	console.log(elementList);
	
	
	
	$("#leftElement").on("click",function(){
		alert("왼쪽 요소 클릭");
	});
	$("#rightElement").on("click",function(){
		alert("오른쪽 요소 클릭");
	});
	
	</script>
</body>
</html>