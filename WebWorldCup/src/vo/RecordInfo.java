package vo;

import java.time.LocalDateTime;

public class RecordInfo {
	private int gameIdx;
	private int memberIdx;
	private String gameRecord;
	private LocalDateTime playDate;
	
	public RecordInfo(int gameIdx, int memberIdx, String gameRecord, LocalDateTime playDate) {
		this.gameIdx = gameIdx;
		this.memberIdx = memberIdx;
		this.gameRecord = gameRecord;
		this.playDate = playDate;
	}
	public int getGameIdx() {
		return gameIdx;
	}
	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getGameRecord() {
		return gameRecord;
	}
	public void setGameRecord(String gameRecord) {
		this.gameRecord = gameRecord;
	}
	public LocalDateTime getPlayDate() {
		return playDate;
	}
	public void setPlayDate(LocalDateTime playDate) {
		this.playDate = playDate;
	}
	
	
	
}
