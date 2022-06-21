package service;

import java.util.List;

import dao.ElementInfoDao;
import dao.GameInfoDao;
import vo.ElementInfo;
import vo.GameInfo;

public class GameService {
	
	//스크롤 ajax or 정렬방식 변경에 의한 GameList json 구성
	public String loadMoreGameInfoToJson(int loadNumber, String sortingMethod) {
		
		GameInfoDao dao = new GameInfoDao();
		List<GameInfo> gameInfoList = dao.selectGameInfo(loadNumber, sortingMethod);
		
		return gameInfoToJson(gameInfoList);
	}
	
	public List<GameInfo> loadGameInfoByDefualtOrder() {
		GameInfoDao dao = new GameInfoDao();
		List<GameInfo> gameInfoList = dao.selectGameInfo(1, "prefer");
		
		return gameInfoList;
	}
	
	public String searchGame(String gameTitle) {

		GameInfoDao dao = new GameInfoDao();
		List<GameInfo> gameInfoList = dao.selectGameInfo(gameTitle);
		
		return gameInfoToJson(gameInfoList);
	}
	
	private String gameInfoToJson(List<GameInfo> gameInfoList) {
		String data = "\"GameList\":[";
		for(GameInfo gameInfo : gameInfoList) {
			int gameIdx = gameInfo.getGameIdx();
			String gameTitle= gameInfo.getGameTitle();
			String gameImg=gameInfo.getGameImg();
			data = data + "{ \"gameIdx\":"+gameIdx+",\"gameTitle\":\"" +gameTitle + "\",\"gameImg\":\"" + gameImg + "\"},";
		}
		data = data.substring(0, data.length()-1);
		data = data + "]}";
		
		return data;
	}
	

}
