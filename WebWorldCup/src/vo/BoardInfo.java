package vo;

import java.time.LocalDateTime;

public class BoardInfo {

	private int boardIdx;
	private int memberIdx;
	private String boardTitle;
	private String boardContents;
	private String file;
	private LocalDateTime pubDate;
	
	
	public BoardInfo(int boardIdx, String boardTitle, String boardContents) {
		this.boardIdx = boardIdx;
		this.boardTitle = boardTitle;
		this.boardContents = boardContents;
	}
	public BoardInfo(int memberIdx, String boardTitle, String boardContents, String file, LocalDateTime pubDate) {
		this.memberIdx = memberIdx;
		this.boardTitle = boardTitle;
		this.boardContents = boardContents;
		this.file = file;
		this.pubDate = pubDate;
	}	
	public BoardInfo(int boardIdx, int memberIdx, String boardTitle, String boardContents, String file,
			LocalDateTime pubDate) {
		this.boardIdx = boardIdx;
		this.memberIdx = memberIdx;
		this.boardTitle = boardTitle;
		this.boardContents = boardContents;
		this.file = file;
		this.pubDate = pubDate;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContents() {
		return boardContents;
	}
	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public LocalDateTime getPubDate() {
		return pubDate;
	}
	public void setPubDate(LocalDateTime pubDate) {
		this.pubDate = pubDate;
	}
	
	
	
	
}
