package vo;

import java.time.LocalDateTime;

public class CommentInfo {
	private int gameIdx;
	private String name;
	private String comment;
	private LocalDateTime commentDate;
	private int memberIdx;
	
	public CommentInfo(String name, String comment, LocalDateTime commentDate) {
		this.name = name;
		this.comment = comment;
		this.commentDate = commentDate;
	}


	public CommentInfo(int gameIdx, String name, String comment, LocalDateTime commentDate, int memberIdx) {
		this.gameIdx = gameIdx;
		this.name = name;
		this.comment = comment;
		this.commentDate = commentDate;
		this.memberIdx = memberIdx;
	}


	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getGameIdx() {
		return gameIdx;
	}
	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public LocalDateTime getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}
	
	
}
