package poly.service;

import java.util.List;

import poly.dto.NoticeDTO;
import poly.dto.UserInfoDTO;


public interface INoticeService {
	
	int insertNoticeInfo(NoticeDTO bDTO)throws Exception;
	
	List<NoticeDTO> getNoticeList(NoticeDTO bDTO)throws Exception;
	
	NoticeDTO getNoticeDetail(String seq) throws Exception;

	NoticeDTO getNoticeModify(String seq) throws Exception;

	int updateNotice(NoticeDTO bDTO)  throws Exception;

	int deleteNotice(String seq) throws Exception;

	int updateNoticeReadCnt(NoticeDTO bDTO) throws Exception;

	UserInfoDTO getNoticeDetail2(UserInfoDTO uDTO)throws Exception;
	
	//총리스트 개수
	int listall1() throws Exception;


}
