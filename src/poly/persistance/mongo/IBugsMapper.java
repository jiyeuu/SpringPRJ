package poly.persistance.mongo;

import java.util.List;

import poly.dto.BugsDTO;



public interface IBugsMapper {
	
	
	public boolean createCollection(String colNm) throws Exception;
	
	public int insertRank(List<BugsDTO> pList, String colNm) throws Exception;
	
	public List<BugsDTO> getRank(String colNm) throws Exception;
}
