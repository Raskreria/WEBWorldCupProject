package service;

import java.util.List;

import dao.ElementInfoDao;
import dao.GameInfoDao;
import vo.ElementInfo;
import vo.GameInfo;

public class GameService {
	

	
	public List<GameInfo> loadGameInfoByDefualtOrder() {
		GameInfoDao dao = new GameInfoDao();
		List<GameInfo> gameInfoList = dao.selectGameInfo(1, "prefer");
		
		return gameInfoList;
	}
	

	
	private String gameInfoToJson(List<GameInfo> gameInfoList) {
		String data = "{\"gameInfoList\":[";
		
		if(gameInfoList.isEmpty())
			return null;
		
		for(GameInfo gameInfo : gameInfoList) {
			
			int gameIdx = gameInfo.getGameIdx();
			String gameTitle = gameInfo.getGameTitle();
			String gameImg = gameInfo.getGameImg();
			
			
			data = data + "{ \"gameIdx\":(1), \"gameTitle\":\"(2)\", \"gameImg\":\"(3)\"},";
			data = data.replace("(1)", Integer.toString(gameIdx));
			data = data.replace("(2)", gameTitle);
			data = data.replace("(3)", gameImg);
			
		}
		data = data.substring(0, data.length()-1);
		data = data + "]}";
		System.out.println(data);
		return data;
	}
	
	//스크롤 ajax or 정렬방식 변경에 의한 GameList json 구성
	public String loadMoreGameInfoToJson(int loadNumber, String sortingMethod) {
		//공지사항의 상세 정보를 DB에서 불러옴
		//불러온 상세 정보를 클라이언트에게 전달하기 위해 JSON으로 구성

		GameInfoDao dao = new GameInfoDao();
		List<GameInfo> gameInfoList = dao.selectGameInfo(loadNumber, sortingMethod);
		
		return gameInfoToJson(gameInfoList);
		
	}
	
	//게임 검색에 의한 GameList json 구성
	public String loadSearchGameInfoToJson(String gameTitle) {

		GameInfoDao dao = new GameInfoDao();
		List<GameInfo> gameInfoList = dao.selectGameInfo(gameTitle);
		
		return gameInfoToJson(gameInfoList);
	}

}
