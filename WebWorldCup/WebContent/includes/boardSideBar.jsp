<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    	<div id="boardCategory" class="container col-2">
		<h2 id="boardCategoryTitle">
			<c:if test="${category eq 'notice'}">
			공지사항
			</c:if>
			<c:if test="${category eq 'community'}">
			커뮤니티
			</c:if>
			<c:if test="${param.category eq 'notice'}">
			공지사항 작성
			</c:if>
			<c:if test="${(param.category ne null) && (param.category ne 'notice') && (category eq null)}">
			커뮤니티 작성
			</c:if>
			
		</h2>
		<hr>
		<ul>
			<li>
				<a href="${BOARD_PAGE}"
					style="<c:if test="${category eq \"notice\" }">background-color:red;</c:if>">공지사항
				</a>
			</li>
			<li>
				<a href="${BOARD_PAGE}?category=community"
					style="<c:if test="${category eq \"community\" }">background-color:red;</c:if>">커뮤니티
				</a>
			</li>
		</ul>
	</div>