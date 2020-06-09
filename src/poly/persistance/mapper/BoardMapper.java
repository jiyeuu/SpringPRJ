package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BoardDTO;


@Mapper("BoardMapper")
public interface BoardMapper {
	
	int insertBoardInfo(BoardDTO bDTO)throws Exception;
	
	List<BoardDTO> getBoardList(BoardDTO bDTO) throws Exception;

	BoardDTO getBoardDetail(String seq) throws Exception;
	
	BoardDTO getBoardModify(String seq) throws Exception;

	int updateBoard(BoardDTO bDTO) throws Exception;

	int deleteBoard(String seq) throws Exception;

	int updateBoardReadCnt(BoardDTO bDTO) throws Exception;
	
	//총리스트 개수
	int listall() throws Exception;

	/* BoardDTO UserBoardDelete(BoardDTO pDTO)throws Exception; */

	
}
