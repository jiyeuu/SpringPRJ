package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BoardDTO;
import poly.persistance.mapper.BoardMapper;
import poly.service.IBoardService;

@Service("BoardService")
public class BoardService implements IBoardService {

	@Resource(name = "BoardMapper")
	private BoardMapper boardMapper;

	@Override
	public int insertBoardInfo(BoardDTO bDTO) throws Exception {
		return boardMapper.insertBoardInfo(bDTO);
	}
	
	@Override
	public List<BoardDTO> getBoardList(BoardDTO bDTO) throws Exception{
		return boardMapper.getBoardList(bDTO);
	}

	@Override
	public BoardDTO getBoardDetail(String seq) throws Exception {
		return boardMapper.getBoardDetail(seq);
	}
	
	@Override
	public BoardDTO getBoardModify(String seq) throws Exception {
		return boardMapper.getBoardModify(seq);
	}

	@Override
	public int updateBoard(BoardDTO bDTO) throws Exception {
		return boardMapper.updateBoard(bDTO);
	}

	@Override
	public int deleteBoard(String seq) throws Exception {
		return boardMapper.deleteBoard(seq);
	}

	@Override
	public int updateBoardReadCnt(BoardDTO bDTO) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.updateBoardReadCnt(bDTO);
	}

	@Override
	public int listall() throws Exception {
		
		return boardMapper.listall();
	}

	/*
	 * public BoardDTO UserBoardDelete(BoardDTO pDTO) throws Exception { return
	 * boardMapper.UserBoardDelete(pDTO); }
	 */








}
