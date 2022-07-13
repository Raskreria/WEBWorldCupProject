package service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import dao.CommentInfoDao;
import vo.CommentInfo;

public class CommentService {
	private String CommentInfoToJson(List<CommentInfo> commentInfoList) {
		String data = "{\"commentInfoList\":[";
		
		if(commentInfoList.isEmpty())
			return null;
		
		for(CommentInfo commentInfo : commentInfoList) {
			
			String name = commentInfo.getName();
			String comment = commentInfo.getComment();
			LocalDateTime t_commentDate = commentInfo.getCommentDate();
			String commentDate = t_commentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
			
			data = data + "{ \"name\":\"(1)\", \"comment\":\"(2)\", \"commentDate\":\"(3)\"},";
			data = data.replace("(1)", name);
			data = data.replace("(2)", comment);
			data = data.replace("(3)", commentDate);
			
		}
		data = data.substring(0, data.length()-1);
		data = data + "]}";
		System.out.println(data);
		return data;
	}
	
	//게임 검색에 의한 GameList json 구성
	public String loadCommentInfoToJson(String category, int loadNumber) {

		CommentInfoDao dao = new CommentInfoDao();
		List<CommentInfo> commentInfoList = dao.selectCommentInfoList(category, loadNumber);
		
		return CommentInfoToJson(commentInfoList);
	}
}
