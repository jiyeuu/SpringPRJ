package poly.service;

import java.util.List;

import poly.dto.BoardDTO;


public interface IBoardService {
	
	int insertBoardInfo(BoardDTO bDTO)throws Exception;
	
	List<BoardDTO> getBoardList(BoardDTO bDTO)throws Exception;
	
	BoardDTO getBoardDetail(String seq) throws Exception;

	BoardDTO getBoardModify(String seq) throws Exception;

	int updateBoard(BoardDTO bDTO)  throws Exception;

	int deleteBoard(String seq) throws Exception;
	
	int updateBoardReadCnt(BoardDTO bDTO) throws Exception;
	
	//총리스트 개수
	int listall() throws Exception;
	


}
