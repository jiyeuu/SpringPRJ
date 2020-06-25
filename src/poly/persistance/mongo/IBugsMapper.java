package poly.persistance.mongo;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import poly.dto.BugsDTO;



public interface IBugsMapper {
	
	
	public boolean createCollection(String colNm) throws Exception;
	
	public int insertRank(List<BugsDTO> pList, String colNm) throws Exception;
	
	public List<BugsDTO> getRank(String colNm) throws Exception;
	
	//public String FileInsert(HttpServletRequest request) throws IOException;
}
