package poly.service;

import java.util.List;

import poly.dto.BugsDTO;

public interface IBugsService {
	
	public int collectBugsRank() throws Exception;

	/**
	 * MongoDB 멜론 데이터 가져오기
	 */
	public List<BugsDTO> getRank() throws Exception;

	public void rTest() throws Exception;

	
}
