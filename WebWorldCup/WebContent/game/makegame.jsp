<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- URLs.jsp -->
<%@ include file="/includes/URLs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임썸네일 만들기 페이지</title>

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

<!-- makegame.css -->
<link rel="stylesheet" href="../css/makegame.css">
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="/includes/header.jsp"%>
	<nav>
		<div class="container col-xxl-8 px-4 pt-5">
         
		<h1>썸네일 등록 -> 요소들 등록 순으로 진행됩니다.</h1>
		</div> 
	</nav>
	<section class="py-5">
            <div class="container col-xxl-8 px-4 pb-5">
                <div class="row flex-lg-row-reverse align-items-center g-5 pb-5">
                  <div class="col-lg">
                    
                    <form action="${GAME_THUMBNAIL_ADD_SERVLET}" method="POST" enctype="multipart/form-data">
                    	
                    	<input type="hidden"  name="regMemberIdx" value="${loginUserInfo.idx}">
                    	
                        <div class="input-group input-group-lg" id="gameTitleWrapper">
                            <span class="input-group-text" id="inputGroup-sizing-lg" >게임 제목</span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" name="gameTitle" id="name">
                        </div>
                    	
                    	<div class="input-group" id="gameDescriptionWrapper">
                            <span class="input-group-text">게임 소개</span>
                            <textarea class="form-control" aria-label="With textarea"></textarea>
                        </div>

                        <div class="input-group" id="gameImgFileWrapper">
                            <label class="input-group-text" for="gameImgFileWrapper">썸네일 이미지</label>
                            <input type="file" class="form-control" id="inputGroupFile01" name="gameImg">
                        </div>

    
	                    <div class="d-grid gap-2 d-md-flex justify-content-md-start">
	                      <button type="submit" class="btn btn-primary btn-lg px-4 me-md-2">썸네일 등록</button>
	                    </div>
                    
                    </form>
                    
                  </div>
                </div>
              </div>
        </section>


<!-- 제이쿼리 -->
<script src="/worldcup/js/jquery-3.6.0.min.js"></script>
<!-- URLs.js -->
<script src="/worldcup/js/URLs.js"></script>
<script type="text/javascript">




</script>
</body>
</html>