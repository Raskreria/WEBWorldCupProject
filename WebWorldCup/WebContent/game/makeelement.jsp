<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- URLs.jsp -->
<%@ include file="/includes/URLs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임요소 만들기 페이지</title>
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

<!-- makeelement.css -->
<link rel="stylesheet" href="../css/makeelement.css">
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="/includes/header.jsp"%>
<!-- 	요소 추가 폼 -->
	<div id="elementAddFormWrapper" class="p-3 m-3 bg-secondary">
		<input type="hidden"  id="gameIdx" value="${gameInfo.gameIdx}">
		<form action="${GAME_ELEMENT_ADD_SERVLET}" method="POST"
			enctype="multipart/form-data" id="elementAddForm">
			<input type="hidden" value="" id="elementIdx">
					
			<div class="input-group input-group-lg" id="elementTitleWrapper">
				<span class="input-group-text" id="inputGroup-sizing-lg">이미지 이름
					</span> <input type="text" class="form-control"
					aria-label="Sizing example input" id="elementTitle"
					aria-describedby="inputGroup-sizing-lg" name="elementTitle"  >
			</div>
			<div class="input-group mb-3" id="elementImgFileWrapper">
				<label class="input-group-text" for="elementImgFileWrapper">이미지
					</label> <input type="file" class="form-control" id="elementImg"
					name="elementImg">
			</div>


			<div id="elementAddbtn-group">
				<button id="elementAddbtn" type="button" class="btn btn-info btn-lg px-4 me-md-2">
					추가</button>
				<button id="elementUpdatebtn" style="display:none;" type="button" class="btn btn-primary btn-lg px-4 me-md-2">
					수정</button>
			</div>
		</form>
	</div>
<!-- 	썸네일 미리보기 사이드 바 -->
	<div id="thumbnailPreview">
		썸네일 미리보기
		<div class="card shadow-sm mb-1">
			<img src="../${gameInfo.gameImg}" class="d-block w-100" alt="...">
			<div class="card-body">
				<p class="card-text">
				${gameInfo.gameTitle}
				</p>
				<div class="d-flex justify-content-between align-items-center">
					<div class="btn-group">
						<button type="button" class="btn btn-sm btn-outline-secondary"
							disabled>게임시작</button>
						<button type="button" class="btn btn-sm btn-outline-secondary"
							disabled>공유</button>
						<button type="button" class="btn btn-sm btn-outline-secondary"
							disabled>랭킹보기</button>
					</div>
				</div>
			</div>
		</div>

		<div class="d-flex justify-content-between align-items-center">
			<div class="btn-group" id="thumbnailbtn-group">
				<button type="button" id="thumbnailUpdatebtn" class="btn btn-sm btn-primary">썸네일 수정</button>
				<button type="button" id="thumbnailDeletebtn" class="btn btn-sm btn-danger">등록 취소</button>
			</div>
		</div>
	</div>
<!-- 	썸네일/요소 리스트 -->
	<div class="album py-1 bg-light container col-8 mt-3" id="elementListWrapper">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-6 g-3" id="elementList">



		
		</div>
	</div>
<!-- 	추가 현황 / 등록 사이드바  -->
	<div id="statusPreviewSideBar">
		<h3 id="elementCountPreviewTitle">
			이미지 추가 현황
		</h3>
		<hr>
		<div id="elementCountPreviewWrapper">
			<button id="elementCountPreview" type="button" class="btn btn-lg btn-danger" disabled>0/16</button>
		</div>
		<hr>
		
		<div id="gameEnrollbtnWrapper">
				<button id="gameEnrollbtn" type="button" class="btn btn-lg btn-info">게임 등록하기</button>
		</div>
	</div>
	<!-- 제이쿼리 -->
<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
<!-- URLs.js -->
<script src="../js/URLs.js"></script>
<script type="text/javascript">
	let gameIdx = $("#gameIdx").val();
	let elementAddCount=0;
	//요소 수정/추가 폼의 추가 버튼
	$("#elementAddbtn").on("click",function(){
		var elementTitle = $("#elementTitle").val();
		
		var elementImg = $("#elementImg").val(); //이거 임시
		
		var form = new FormData();
	    form.append( "elementImg", $("#elementImg")[0].files[0] );
	        
	    var imgFile = $('#elementImg').prop("files")[0];
        var blobURL = window.URL.createObjectURL(imgFile);
        
		$.ajax({
			url : GAME_ELEMENT_ADD_SERVLET+"?gameIdx="+gameIdx+"&elementTitle="+elementTitle,
			type: "POST",
			 processData : false,
	         contentType : false,
	         data : form,
	         dataType: "text",
	         success : function(elementIdx) {
				$("#elementList").append("<div class=\"col\" id=\""+elementIdx+"thElement\" value=\""+elementIdx+"\"></br>"
						+"<div class=\"card shadow-sm mb-1\">"
							+"<img id=\""+elementIdx+"thElementImg\" src=\""+blobURL+"\" class=\"d-block w-100\" alt=\"...\">"
							+"<div class=\"card-body\">"
								+"<p class=\"card-text\" id=\""+elementIdx+"thElementTitle\">"
								+elementTitle
								+"</p>"
							+"</div>"
						+"</div>"
						+"<div class=\"d-flex justify-content-between align-items-center\">"
							+"<div class=\"btn-group\" id=\""+elementIdx+"thElementbtn-group\">"
								+"<button type=\"button\" id=\""+elementIdx+"thElementUpdatebtn\"  class=\"btn btn-sm btn-primary\">수정</button>"
								+"<button type=\"button\" id=\""+elementIdx+"thElementDeletebtn\"  class=\"btn btn-sm btn-danger\">삭제</button>"
							+"</div>"
						+"</div>"
					+"</div>");
			
				// 추가된 요소 박스의 수정 버튼
				$("#"+elementIdx+"thElementUpdatebtn").on("click",function(){
					alert(elementIdx+" 번 요소 수정버튼 클릭!!");
					$("#"+elementIdx+"thElement").css("border","1px dashed black");
					$("#elementTitle").val(elementTitle);
					$("#elementIdx").val(elementIdx);
					$("#elementAddbtn").css("display","none");
					$("#elementUpdatebtn").css("display","block");
					
					
				});
				
				
				// 추가된 요소 박스의 삭제 버튼
				$("#"+elementIdx+"thElementDeletebtn").on("click",function(){
					$.ajax({
						 url : "/worldcup/game/deleteelement"+"?elementIdx="+elementIdx,
						 type: "POST",
				         success : function() {
				         		alert("성공");
				         		$("#"+elementIdx+"thElement").remove();

				        		elementAddCount--;
				        		$("#elementCountPreview").text(elementAddCount+"/16");
				         },
				         error : function(error) {
								alert("실패");
						}
					});
				});
				
				
	         
	        },
			error : function(error) {
				alert("실패");
			}
		});
		elementAddCount++;
		$("#elementCountPreview").text(elementAddCount+"/16");
		$("#elementTitle").val("");
		$("#elementImg").val("");

	});
	//요소 수정/추가 폼의 수정 버튼
	$("#elementUpdatebtn").on("click",function(){
		alert("수정버튼 ajax");
        var elementIdx = $("#elementIdx").val();
		var newElementTitle = $("#elementTitle").val();
		
		var form = new FormData();
	    form.append( "elementImg", $("#elementImg")[0].files[0] );
	        
		var NewImgFile = $('#elementImg').prop("files")[0];
        var blobURL = window.URL.createObjectURL(NewImgFile);
        
        $.ajax({
			url : "/worldcup/game/updateelement"+"?gameIdx="+gameIdx+"&elementidx="+elementIdx+"elementTitle="+NewElementTitle,
			type: "POST",
			 processData : false,
	         contentType : false,
	         data : form,
	         dataType: "text",
	         success : function(elementIdx) {
	        	$("#elementTitle").val("");
	     		$("#elementImg").val("");
	     		$("#elementAddbtn").css("display","block");
	     		$("#elementUpdatebtn").css("display","none");
	     		
	     		$("#"+elementIdx+"thElement").css("border","0");
	     		$("#"+elementIdx+"thElementTitle").text(newElementTitle);
	     		$("#"+elementIdx+"thElementImg").attr("src",blobURL);    	 
	         },
	         error: function(){
	       	 	alert("수정 실패");
	         }
	    });
        
        
		
	});
	$("#thumbnailUpdatebtn").on("click",function(){
		window.history.back();
	});
	$("#thumbnailDeletebtn").on("click",function(){
		alert("썸네일 포함 모든 요소 삭제 구현해야함");
	});
	$("#gameEnrollbtn").on("click",function(){
		alert("게임등록이 완료되었습니다!");
		location.href = MAIN_PAGE;
	});
</script>
</body>
</html>