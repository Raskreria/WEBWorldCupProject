package vo;

import java.time.LocalDateTime;

public class GameInfo {
	private int gameIdx;
	private int regMemberIdx;
	private String gameTitle;
	private String gameImg;
	private LocalDateTime regDate;
	
	
	public GameInfo(int gameIdx, String gameTitle, String gameImg) {
		this.gameIdx = gameIdx;
		this.gameTitle = gameTitle;
		this.gameImg = gameImg;
	}

	
	public GameInfo(int regMemberIdx, String gameTitle, String gameImg, LocalDateTime regDate) {
		this.regMemberIdx = regMemberIdx;
		this.gameTitle = gameTitle;
		this.gameImg = gameImg;
		this.regDate = regDate;
	}


	public int getGameIdx() {
		return gameIdx;
	}
	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
	}
	public int getRegMemeberIdx() {
		return regMemberIdx;
	}
	public void setRegMemeberIdx(int regMemeberIdx) {
		this.regMemberIdx = regMemeberIdx;
	}
	public String getGameTitle() {
		return gameTitle;
	}
	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}
	public String getGameImg() {
		return gameImg;
	}
	public void setGameImg(String gameImg) {
		this.gameImg = gameImg;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	
	
	
}
