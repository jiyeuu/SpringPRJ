package poly.service;

import java.util.List;
import java.util.Map;

import poly.dto.BugsDTO;
import poly.dto.WordDTO;

public interface IBugsService {
	
	public int collectBugsRank() throws Exception;

	/**
	 * MongoDB 멜론 데이터 가져오기
	 */
	public List<BugsDTO> getRank() throws Exception;

	public Map<String, List<String>> rTest() throws Exception;
	
	public int insertRank1(List<WordDTO> wList, String colNm) throws Exception;

	
}
