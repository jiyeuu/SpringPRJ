package poly.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import poly.dto.MailDTO;
import poly.dto.UserInfoDTO;
import poly.persistance.mapper.UserInfoMapper;
import poly.service.IMailService;
import poly.service.IUserInfoService;
import poly.util.CmmUtil;
import poly.util.DateUtil;
import poly.util.EncryptUtil;


@Service("UserInfoService")
public class UserInfoService implements IUserInfoService {

	@Resource(name="UserInfoMapper")
	private UserInfoMapper userInfoMapper;
	
	@Resource(name="MailService")
	private IMailService mailService;
	
	@Override
	public int insertUserInfo(UserInfoDTO pDTO) throws Exception {
		
		int res = 0;
		
		if(pDTO == null) {
			pDTO = new UserInfoDTO();
		}

		UserInfoDTO rDTO = userInfoMapper.getUserExists(pDTO);
		
		if(rDTO == null) {
			rDTO = new UserInfoDTO();
		}
		
		if(CmmUtil.nvl(rDTO.getExists_yn()).equals("Y")) {
			res = 2;
		}else {
			
			//회원가입
			int success = userInfoMapper.insertUserInfo(pDTO);
			
			if(success > 0) {
				res = 1;
				
				/*매일발송 로직 추가시작*/
				MailDTO mDTO = new MailDTO();
				
				mDTO.setToMail(EncryptUtil.decAES128CBC(CmmUtil.nvl(pDTO.getEmail())));
				
				mDTO.setTitle("회원가입을 축하드립니다");
				
				mDTO.setContents(CmmUtil.nvl(pDTO.getUser_name()) + "님의 회원가입을 진심으로 축하드립니다");
				
				mailService.doSendMail(mDTO);
				
				/*메일 발송 로직 추가 끝*/
			}else {
				res = 0;
			}
		}
		return res;
	}
	
	/**
	 * 로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기
	 * 
	 * @param UserInfoDTO 로그인을 위한 회원아이디, 비밀번호
	 * @return UserInfoDTo 로그인된 회원아이디 정보
	 */
	


	@Override
	public int ckeckId(UserInfoDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return userInfoMapper.ckeckId(pDTO);
	}

	@Override
	public String findId(UserInfoDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return userInfoMapper.findId(pDTO);
	}

	@Override
	public UserInfoDTO findPw(UserInfoDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return userInfoMapper.findPw(pDTO);
	}
	
	@Override
	public int findPwNew(UserInfoDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return userInfoMapper.findPwNew(pDTO);
	}

	@Override
	public UserInfoDTO chPw(UserInfoDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return userInfoMapper.chPw(pDTO);
	}

	public static int read(UserInfoDTO pDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserInfoDTO getUserLoginCheck(UserInfoDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return userInfoMapper.getUserLoginCheck(pDTO);
	}

	@Override
	public int delUser(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return userInfoMapper.delUser(user_id);
	}

	@Override
	public int checkEmail(UserInfoDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return userInfoMapper.checkEmail(pDTO);
	}

	
	
	/*	/*메일 발송 로직 추가 시작*/
//	
//	MailDTO mDTO = new MailDTO();
//	
//	mDTO.setToMail(EncryptUtil.decAES128CBC(CmmUtil.nvl(rDTO.getEmail())));
//	
//	mDTO.setTitle("로그인 알림!");
//	
//	mDTO.setContents(DateUtil.getDateTime("yyyy.MM.dd 24h:mm:ss") +"에"+CmmUtil.nvl(rDTO.getUser_name())+"님이 로그인하였습니다");
//
//	mailService.doSendMail(mDTO);			
//	}
//	
	

}
