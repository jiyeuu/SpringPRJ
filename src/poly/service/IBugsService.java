package poly.service;

import java.util.List;

import poly.dto.BugsDTO;

public interface IBugsService {
	
	public int collectMelonRank() throws Exception;

	/**
	 * MongoDB 멜론 데이터 가져오기
	 */
	public List<BugsDTO> getRank() throws Exception;
}
