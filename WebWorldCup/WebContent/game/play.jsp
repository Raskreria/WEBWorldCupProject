<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- URLs.jsp -->
<%@ include file="/includes/URLs.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.gameTitle}</title>
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
	<div id="titlebox">
		<h1>${param.gameTitle} 게임 <span id="gameLevel">16</span>강 <span id="progress">(1/8)</span></h1>
	</div>
	
	<div id="contentBox">
<!-- 	 	왼쪽 요소 -->
		<span id="leftElementWrapper" class="card shadow-sm col-6" style="float: left;">
			<button type="button" id="leftElement">
				<img id="leftElementImg" alt="" src="https://via.placeholder.com/300x180.jpg/">
			</button>

			<div class="card-body">
				<h3 id="leftElementTitle" class="card-text">요소 타이틀 올자리</h3>
			</div>
		</span>
		<!-- 		오른쪽  요소 -->
		<span id="rightElementWrapper" class="card shadow-sm col-6">
			<button type="button" id="rightElement">
				<img id="rightElementImg" alt="" src="https://via.placeholder.com/300x180.jpg/">
			</button>

			<div class="card-body">
				<h3 id="rightElementTitle" class="card-text">요소 타이틀 올자리</h3>
			</div>
		</span>

	</div>
	<div class="shuffleWrapper">
		<button id="sufflebtn" type="button" class="btn btn-danger">셔플</button>
		<button id="restartbtn" type="button" class="btn btn-success">다시 시작</button>
	</div>

	
	
	<!-- 제이쿼리 -->
	<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
	
	<script src="/worldcup/js/parameter_function.js"></script>
	<script type="text/javascript">
	let gameIdx = getParameter("gameIdx");
	
	let elementInfoList;
	//게임 플레이 데이터를 ajax로 가져오기
	let elementPointer = 0;
	$.ajax({
		url : "/worldcup/game/playdata",
		type : "GET",
		data : "gameIdx="+gameIdx,
		success : function(result) {
// 			alert("게임 플레이 데이터 불러오기 성공");
			result = JSON.parse(result);
			elementInfoList = result.elementInfoList;
			
			$("#leftElementTitle").text(elementInfoList[elementPointer].elementTitle);
			$("#leftElementImg").attr("src","../"+elementInfoList[elementPointer++].elementImg);
			
			$("#rightElementTitle").text(elementInfoList[elementPointer].elementTitle);
			$("#rightElementImg").attr("src","../"+elementInfoList[elementPointer++].elementImg);
			//순서도 제대로 잘 저장이 됨.
		},
		error : function(result) {
			alert("게임 플레이 데이터 불러오기 실패");
		}
	});
	

	
	let gameSet = 16; //16강게임
	let gameLevel= 16; //현재 진행중인 게임 몇 강?
	let gameCounter = 0; //게임 카운터
	let level = gameSet/gameLevel; //인덱스 접근을 위한 변수
	$("#leftElement").on("click",function(){
// 		이긴 요소를 오른쪽 요소의 인덱스에 위치
 		[elementInfoList[elementPointer*level-1], elementInfoList[(elementPointer-1)*level-1]] = [elementInfoList[(elementPointer-1)*level-1], elementInfoList[elementPointer*level-1]];
 		
 		
 		$("#rightElementWrapper").css("display","none");
 		$("#leftElementWrapper").animate({marginLeft:"+=25%"},900);
 		$("#leftElementWrapper").css("float","");
 		$("#leftElementWrapper").css("margin","auto");
 		setTimeout(settingForNextGame, 1300);
 		
	});
	$("#rightElement").on("click",function(){
 		$("#leftElementWrapper").css("visibility","hidden");
		$("#leftElementWrapper").animate({marginLeft:"-=50%"},900);
 		$("#rightElementWrapper").css("margin","auto");
 		setTimeout(settingForNextGame, 1300);
		
	});
	
	function settingForNextGame(){
		gameCounter++;
		if (gameCounter == gameLevel / 2) {
			gameLevel /= 2;
			if (gameLevel == 1){
				alert("게임 끝");
				$("#titlebox").empty();
				$("#titlebox").append("<h1>"
					+"<img src=\"../images/win_left.png\" width=\"70px\">"
					+"최종우승"
					+"<img src=\"../images/win_right.png\" width=\"70px\">"
					+"</h1>");
				resultReflect();
				return;
			}
			$("#gameLevel").text(gameLevel);
			level = gameSet/gameLevel;
			gameCounter = 0;
			elementPointer = 0;
		}
	
		$("#progress").text("("+(gameCounter+1)+"/"+gameLevel/2+")");
		
		$("#leftElementTitle").text(elementInfoList[(++elementPointer)*level-1].elementTitle);
		$("#leftElementImg").attr("src","../"+elementInfoList[elementPointer*level-1].elementImg);
		
		$("#rightElementTitle").text(elementInfoList[(++elementPointer)*level-1].elementTitle);
		$("#rightElementImg").attr("src","../"+elementInfoList[elementPointer*level-1].elementImg);
		
		$("#leftElementWrapper").css("visibility","");
 		$("#leftElementWrapper").css("margin","");
		$("#leftElementWrapper").css("float","left");
 		$("#rightElementWrapper").css("display","");
 		$("#rightElementWrapper").css("margin","");
	};
	
	function resultReflect(){
		var reflectList;
		reflectList = elementInfoList.filter((e, i) => i % 2 === 1);
		reflectList = reflectList.map(({ elementIdx }) => elementIdx);
		$.ajax({
			url : "/worldcup/game/resultreflect?gameIdx="+gameIdx+"&elementIdx="+reflectList[0]+"&elementIdx="+reflectList[1]+"&elementIdx="+reflectList[2]+"&elementIdx="+reflectList[3]+
			"&elementIdx="+reflectList[4]+"&elementIdx="+reflectList[5]+"&elementIdx="+reflectList[6]+"&elementIdx="+reflectList[7],
			type : "POST",
			success : function(result) {
				alert("게임 결과 반영 성공");
			},
			error : function(result) {
				alert("게임 결과 반영 실패");
			}
		});
	}
	function syncDelay(milliseconds){
		 var start = new Date().getTime();
		 var end=0;
		 while( (end-start) < milliseconds){
		     end = new Date().getTime();
		 }
	}



	function getRandom(min, max) {
	    return Math.floor((Math.random() * (max - min + 1)) + min);
	}


	$("#sufflebtn").on("click",function(){
		elementPointer -=2;
		for(var i = 0; i < 10 ; i++){
			var randomNum1 = (getRandom(gameCounter*2+1,gameLevel))*level-1;
			var randomNum2 = (getRandom(gameCounter*2+1,gameLevel))*level-1;
			[elementInfoList[randomNum1], elementInfoList[randomNum2] ] = [elementInfoList[randomNum2], elementInfoList[randomNum1] ]; 
		}
		$("#leftElementTitle").text(elementInfoList[(++elementPointer)*level-1].elementTitle);
		$("#leftElementImg").attr("src","../"+elementInfoList[elementPointer*level-1].elementImg);
		
		$("#rightElementTitle").text(elementInfoList[(++elementPointer)*level-1].elementTitle);
		$("#rightElementImg").attr("src","../"+elementInfoList[elementPointer*level-1].elementImg);
	});
	
	$("#restartbtn").on("click",function(){
		alert("게임을 다시 시작합니다!");
		location.reload();
	});
	
	$(document).on("mouseleave", function(e) {
	    if (window.confirm("진행중인 게임이 저장이 안되어도 페이지를 벗어나시겠습니까?")) {
	    	$(document).off("mouseleave");
	    }
	});
		
	
	</script>
</body>
</html>