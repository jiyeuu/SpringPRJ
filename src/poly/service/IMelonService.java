package poly.service;

import java.util.List;

import poly.dto.MelonDTO;

public interface IMelonService {
	
	//멜론 top100 순위 수집하기
	public int collectMelonRank() throws Exception;

	/**
	 * MongoDB 멜론 데이터 가져오기
	 */
	public List<MelonDTO> getRank() throws Exception;
}
