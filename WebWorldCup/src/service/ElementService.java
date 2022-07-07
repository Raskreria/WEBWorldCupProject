package service;

import java.util.List;

import dao.ElementInfoDao;
import vo.ElementInfo;
import vo.GameInfo;

public class ElementService {
	public String loadElementInfoToJson(int gameIdx) {
		//공지사항의 상세 정보를 DB에서 불러옴
		//불러온 상세 정보를 클라이언트에게 전달하기 위해 JSON으로 구성
		
		ElementInfoDao dao = new ElementInfoDao();

		List<ElementInfo> elementInfoList = dao.selectElementsByGameIdx(gameIdx);
		System.out.println(elementInfoList.size());
		String data = "{\"elementInfoList\":[";
		for(ElementInfo elementInfo : elementInfoList) {
			int elementIdx = elementInfo.getElementIdx();
			String elementTitle = elementInfo.getElementTitle();
			String elementImg = elementInfo.getElementImg();
			
			
			data = data + "{ \"elementIdx\":(1), \"elementTitle\":\"(2)\", \"elementImg\":\"(3)\"},";
			data = data.replace("(1)", Integer.toString(elementIdx));
			data = data.replace("(2)", elementTitle);
			data = data.replace("(3)", elementImg);
			
		}
		data = data.substring(0, data.length()-1);
		data = data + "]}";
		
		return data;
		
	}
	
	public String loadElementInfoRankingToJson(int gameIdx, int pageNumber, String sortingMethod, String order) {

		ElementInfoDao dao = new ElementInfoDao();
		List<ElementInfo> elementInfoList = dao.selectElementsRankByGameIdx(gameIdx, pageNumber, sortingMethod, order);
		
		if(elementInfoList.isEmpty())
			return null;
		
		String data = "{\"elementInfoList\":[";
		for(ElementInfo elementInfo : elementInfoList) {
			int elementIdx = elementInfo.getElementIdx();
			String elementTitle = elementInfo.getElementTitle();
			String elementImg = elementInfo.getElementImg();
			int elementSelectCount =elementInfo.getElementSelectCount();
			int elementWinCount = elementInfo.getElementWinCount();
			
			data = data + "{ \"elementIdx\":(1), \"elementTitle\":\"(2)\", \"elementImg\":\"(3)\" , \"elementSelectCount\":(4), \"elementWinCount\":(5) },";
			data = data.replace("(1)", Integer.toString(elementIdx));
			data = data.replace("(2)", elementTitle);
			data = data.replace("(3)", elementImg);
			data = data.replace("(4)", Integer.toString(elementSelectCount));
			data = data.replace("(5)", Integer.toString(elementWinCount));
			
		}
		data = data.substring(0, data.length()-1);
		data = data + "]}";
		
		return data;
	}
}
