package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.NoticeDTO;
import poly.dto.UserInfoDTO;
import poly.persistance.mapper.NoticeMapper;
import poly.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService {

	@Resource(name = "NoticeMapper")
	private NoticeMapper noticeMapper;

	@Override
	public int insertNoticeInfo(NoticeDTO bDTO) throws Exception {
		return noticeMapper.insertNoticeInfo(bDTO);
	}
	
	@Override
	public List<NoticeDTO> getNoticeList(NoticeDTO bDTO) throws Exception{
		return noticeMapper.getNoticeList(bDTO);
	}

	@Override
	public NoticeDTO getNoticeDetail(String seq) throws Exception {
		return noticeMapper.getNoticeDetail(seq);
	}
	
	@Override
	public NoticeDTO getNoticeModify(String seq) throws Exception {
		return noticeMapper.getNoticeModify(seq);
	}

	@Override
	public int updateNotice(NoticeDTO bDTO) throws Exception {
		return noticeMapper.updateNotice(bDTO);
	}

	@Override
	public int deleteNotice(String seq) throws Exception {
		return noticeMapper.deleteNotice(seq);
	}

	@Override
	public int updateNoticeReadCnt(NoticeDTO bDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.updateNoticeReadCnt(bDTO);
	}

	@Override
	public UserInfoDTO getNoticeDetail2(UserInfoDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.getNoticeDetail2(uDTO);
	}

	@Override
	public int listall1() throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.listall1();
	}








}
