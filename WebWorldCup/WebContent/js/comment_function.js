/**
 * 
 */
function commentList(commentCategory, loadNumber, commentList){
	
	$.ajax({
			url : "/worldcup/comment/list?category="+commentCategory+"&loadNumber="+loadNumber,
			type : "GET",
			success : function(result) {
			
				result = JSON.parse(result);
				if(result==null){
					return;
				}
				commentList = result;

				alert(commentCategory+" 댓글 불러오기 성공");
			},
			error : function(result) {
				alert("댓글 불러오기 실패");
			}
	});
	
}