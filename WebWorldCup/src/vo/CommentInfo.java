package vo;

import java.time.LocalDateTime;

public class CommentInfo {
	private String category;
	private int categoryIdx;
	private int memberIdx;
	private String name;
	private String comment;
	private LocalDateTime commentDate;
	
	
	public CommentInfo(String name, String comment, LocalDateTime commentDate) {
		super();
		this.name = name;
		this.comment = comment;
		this.commentDate = commentDate;
	}
	public CommentInfo(String category, int categoryIdx, int memberIdx, String name, String comment,
			LocalDateTime commentDate) {
		this.category = category;
		this.categoryIdx = categoryIdx;
		this.memberIdx = memberIdx;
		this.name = name;
		this.comment = comment;
		this.commentDate = commentDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCategoryIdx() {
		return categoryIdx;
	}
	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
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
