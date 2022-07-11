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


			<div>
				<button id="elementAddbtn" type="button" class="btn btn-primary btn-lg px-4 me-md-2">
					추가</button>
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
				<button type="button" class="btn btn-sm btn-primary">썸네일 수정</button>
				<button type="button" class="btn btn-sm btn-danger">등록 취소</button>
			</div>
		</div>
	</div>
<!-- 	썸네일/요소 리스트 -->
	<div class="album py-5 bg-light container col-8 mt-3" id="elementListWrapper">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-6 g-3" id="elementList">



		
		</div>
	</div>
	<!-- 제이쿼리 -->
<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
<!-- URLs.js -->
<script src="/worldcup/js/URLs.js"></script>
<script type="text/javascript">
	let gameIdx = $("#gameIdx").val();
	let elementAddCount=0;
	$("#elementAddbtn").on("click",function(){
		var elementTitle = $("#elementTitle").val();
	
		
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
	         success : function(result) {
				$("#elementList").append("<div class=\"col\"></br>"
						+"<div class=\"card shadow-sm mb-1\">"
							+"<img src=\""+blobURL+"\" class=\"d-block w-100\" alt=\"...\">"
							+"<div class=\"card-body\">"
								+"<p class=\"card-text\">"
								+elementTitle
								+"</p>"
							+"</div>"
						+"</div>"
						+"<div class=\"d-flex justify-content-between align-items-center\">"
							+"<div class=\"btn-group\" id=\"thumbnailbtn-group\">"
								+"<button type=\"button\" class=\"btn btn-sm btn-primary\">수정</button>"
								+"<button type=\"button\" class=\"btn btn-sm btn-danger\">삭제</button>"
							+"</div>"
						+"</div>"
					+"</div>");
				elementAddCount++;
			},
			error : function(error) {
				alert("실패");
			}
		});

	});
	
</script>
</body>
</html>