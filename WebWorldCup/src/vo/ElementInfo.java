package vo;

public class ElementInfo {
	private int gameIdx;
	private int elementIdx;
	private int elementSelectCount;
	private int elementWinCount;
	private String elementTitle;
	private String elementImg;

	public ElementInfo(int elementIdx, String elementTitle, String elementImg) {
		this.elementIdx = elementIdx;
		this.elementTitle = elementTitle;
		this.elementImg = elementImg;
	}
	
	
	public int getGameIdx() {
		return gameIdx;
	}
	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
	}
	public int getElementIdx() {
		return elementIdx;
	}
	public void setElementIdx(int elementIdx) {
		this.elementIdx = elementIdx;
	}
	public int getElementSelectCount() {
		return elementSelectCount;
	}
	public void setElementSelectCount(int elementSelectCount) {
		this.elementSelectCount = elementSelectCount;
	}
	public int getElementWinCount() {
		return elementWinCount;
	}
	public void setElementWinCount(int elementWinCount) {
		this.elementWinCount = elementWinCount;
	}
	public String getElementTitle() {
		return elementTitle;
	}
	public void setElementTitle(String elementTitle) {
		this.elementTitle = elementTitle;
	}
	public String getElementImg() {
		return elementImg;
	}
	public void setElementImg(String elementImg) {
		this.elementImg = elementImg;
	}
	
}
