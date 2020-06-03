package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.MailDTO;
import poly.dto.UserInfoDTO;
import poly.service.IMailService;
import poly.service.IUserInfoService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

@Controller
public class UserInfoController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserInfoService")
	private IUserInfoService userInfoService;
	
	@Resource(name = "MailService")
	private IMailService mailService;


	/* 회원가입 화면으로 이동 */
	@RequestMapping(value = "user/UserRegForm")
	public String userRegForm() {
		log.info(this.getClass().getName() + ".user/userRegForm ok!");

		return "/user/UserRegForm";

	}

	/* 로그인 화면으로 이동 */
	@RequestMapping(value = "user/LoginForm")
	public String loginForm() {
		log.info(this.getClass().getName() + ".user/loginForm ok!");

		return "/user/LoginForm";

	}

	@RequestMapping("/userReg")
	public String userReg() throws Exception {

		return "/user/userReg";
	}

	/* 아이디찾기 화면으로 이동 */
	@RequestMapping(value = "/user/FindForm")
	public String findForm() {
		log.info(this.getClass().getName() + ".user/findIdForm ok!");

		return "/user/FindForm";

	}

	/* 비밀번호 변경 화면으로 이동 */
	@RequestMapping(value = "mypage/ChPwForm")
	public String ChPwForm() {
		log.info(this.getClass().getName() + ".mypage/ChPwForm ok!");

		return "/mypage/ChPwForm";

	}

	//회원가입
	@RequestMapping(value = "user/insertUserInfo")
	public String insertUserInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info(this.getClass().getName() + "insertUserInfo start!");

		String msg = "";

		UserInfoDTO pDTO = null;

		try {
			String user_id = CmmUtil.nvl(request.getParameter("user_id"));
			String user_name = CmmUtil.nvl(request.getParameter("user_name"));
			String password = CmmUtil.nvl(request.getParameter("password"));
			String email = CmmUtil.nvl(request.getParameter("email"));
			String addr1 = CmmUtil.nvl(request.getParameter("addr1"));
			String addr2 = CmmUtil.nvl(request.getParameter("addr2"));

			log.info("user_id : " + user_id);
			log.info("user_name : " + user_name);
			log.info("password : " + password);
			log.info("email : " + email);
			log.info("addr1 : " + addr1);
			log.info("addr2 : " + addr2);

			pDTO = new UserInfoDTO();

			pDTO.setUser_id(user_id);
			pDTO.setUser_name(user_name);
			pDTO.setPassword(EncryptUtil.encHashSHA256(password));
			pDTO.setEmail(EncryptUtil.encAES128CBC(email));
			pDTO.setAddr1(addr1);
			pDTO.setAddr2(addr2);

			int res = userInfoService.insertUserInfo(pDTO);

			if (res == 1) {
				msg = "회원가입되었습니다";

			} else if (res == 2) {
				//msg = "이미 가입된 이메일 주소입니다";

			} else {
				msg = "오류로 인해 회원가입이 실패하였습니다";

			}
		} catch (Exception e) {
			msg = "실패하였습니다  :" + e.toString();
			log.info(e.toString());
			e.printStackTrace();
		} finally {
			log.info(this.getClass().getName() + ".insertUserInfo end!");

			model.addAttribute("msg", msg);
			model.addAttribute("url", "/user/LoginForm.do");

			model.addAttribute("pDTO", pDTO);
			pDTO = null;
		}

		return "/redirect";
	}

	//로그인
	@RequestMapping(value = "user/getUserLoginCheck")
	public String getUserLoginCheck(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info(this.getClass().getName() + "getUserLoginCheck start!");

		int res = 0;

		UserInfoDTO pDTO = null;

		try {
			String user_id = CmmUtil.nvl(request.getParameter("user_id"));
			String password = CmmUtil.nvl(request.getParameter("password"));

			log.info("user_id : " + user_id);
			log.info("password : " + password);

			pDTO = new UserInfoDTO();
			pDTO.setUser_id(user_id);
			pDTO.setPassword(EncryptUtil.encHashSHA256(password));

			pDTO = userInfoService.getUserLoginCheck(pDTO);

			if (pDTO != null) {

				session.setAttribute("SS_USER_ID", user_id);
				session.setAttribute("SS_EMAIL", EncryptUtil.decAES128CBC(pDTO.getEmail()));
				session.setAttribute("user_name", pDTO.getUser_name());
				session.setAttribute("user_Author", pDTO.getUser_author());
			}
		} catch (Exception e) {

			log.info(e.toString());
			e.printStackTrace();
		} finally {
			log.info(this.getClass().getName() + ".getUserLoginCheck end!");

			/*
			 * 로그인 처리 결과를 jsp에 전달하기 위해 변수 사용
			 */
		}
		if (pDTO != null) {

			model.addAttribute("msg", "로그인에 성공하였습니다");
			model.addAttribute("url", "/MainForm.do");

		} else {

			model.addAttribute("msg", "로그인에 실패하였습니다");
			model.addAttribute("url", "/user/LoginForm.do");
		}

		return "/redirect";
	}

	// 아이디 중복 체크
	@RequestMapping(value = "user/checkId")
	public @ResponseBody int checkId(HttpServletRequest request) throws Exception {
		log.info("유효성 검사 시작");
		String user_id = request.getParameter("user_id");

		UserInfoDTO pDTO = new UserInfoDTO();
		pDTO.setUser_id(user_id);
		int result = 0;
		result = userInfoService.ckeckId(pDTO);
		log.info("유효성 검사 결과 : " + result);
		log.info("유효성 검사 종료");
		return result;
	}
	
	// 이메일 중복 체크
		@RequestMapping(value = "user/checkEmail")
		public @ResponseBody int checkEmail(HttpServletRequest request ) throws Exception {
			log.info("유효성 검사 시작");
			String email = request.getParameter("email");

			UserInfoDTO pDTO = new UserInfoDTO();
			pDTO.setEmail(EncryptUtil.encAES128CBC(email));
			int result = 0;
			result = userInfoService.checkEmail(pDTO);
			log.info("유효성 검사 결과 : " + result);
			log.info("유효성 검사 종료");
			return result;
		}
			
		

	// 아이디 찾기
	@RequestMapping(value = "user/findingId")
	public String findingId(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info(this.getClass().getName() + "findingId start!");

		String user_name = CmmUtil.nvl(request.getParameter("user_name"));
		String email = CmmUtil.nvl(request.getParameter("email"));

		log.info("user_name : " + user_name);
		log.info("email : " + email);

		// id값을 받아올 변수
		String user_id = "";

		UserInfoDTO pDTO = null;
		pDTO = new UserInfoDTO();

		pDTO.setUser_name(user_name);
		// hash 는 복호화가 불가능한 알고리즘
		// hash 는 비밀번호에만 사용
		pDTO.setEmail(EncryptUtil.encAES128CBC(email));

		try {
			user_id = userInfoService.findId(pDTO);

		} catch (Exception e) {
			log.info(e.toString());
			e.printStackTrace();
		} finally {
			log.info(this.getClass().getName() + ".findingId end!");
			if (user_id != null) {
				model.addAttribute("msg", "입력하신 정보로 가입된 아이디는" + user_id + " 입니다.");
				model.addAttribute("url", "/user/LoginForm.do");

			} else {

				model.addAttribute("msg", "입력하신 정보로 가입된 아이디가 없습니다.");
				model.addAttribute("url", "/user/FindForm.do");
			}

			pDTO = null;
		}
		return "/redirect";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "user/findingPw")
	public String findingPw(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		log.info(this.getClass().getName() + "findingPw start!");

		
		
		String user_id = request.getParameter("user_id");
		String email = EncryptUtil.encAES128CBC(request.getParameter("email"));

		
		MailDTO mDTO = new MailDTO();
		String toMail = CmmUtil.nvl(request.getParameter("email"));
		String contents = "";
		String title = "임시 비밀번호 입니다";
		
		
		UserInfoDTO pDTO = null;
		pDTO = new UserInfoDTO();

		pDTO.setUser_id(user_id);
		pDTO.setEmail(email);

		log.info("user_id : " + user_id);
		log.info("email : " + email);

		try {

			pDTO = userInfoService.findPw(pDTO);

		} catch (Exception e) {
			log.info(e.toString());
			e.printStackTrace();
		}

		if (pDTO != null) {

			int result = 0;

			String password = getNewPw();
			pDTO.setPassword(EncryptUtil.encHashSHA256(password));

			result = userInfoService.findPwNew(pDTO);

			log.info(this.getClass().getName() + "findingPw end!");

			if (result > 0) {
				
				contents+="임시비밀번호는 "+password+" 입니다";
				
			
				
				mDTO.setToMail(toMail);
				mDTO.setTitle(title);
				mDTO.setContents(contents);
				
				int res = mailService.doSendMail(mDTO);
				

				model.addAttribute("msg", "임시 비밀번호가 이메일로 발송되었습니다.");
				model.addAttribute("url", "/user/LoginForm.do");

			} else {
				model.addAttribute("msg", "실패했습니다");
				model.addAttribute("url", "/user/FindForm.do");
			}

		} else {
			model.addAttribute("msg", "회원정보가 일치하지 않습니다.");
			model.addAttribute("url", "/user/FindForm.do");
		}

		return "/redirect";

	}

	// 임시비밀번호 생성
	public String getNewPw() throws Exception {
		// 비밀번호 배열을 생성
		char[] charSet = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
				's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

		// 비밀번호를 받기 위한 문자열 버퍼 생성
		// 비밀번호를 담는 틀 생성
		StringBuffer newKey = new StringBuffer();

		// 10번 반복
		for (int i = 0; i < 10; i++) {
			// 비밀번호 배열 길이*랜덤으로 생성된 숫자
			// random() 난수가 복잡하지 않기 떄문에 숫자를 더 복잡하게 해줌
			int idx = (int) (charSet.length * Math.random());
			// 문자열에다가 한글자씩 담는것
			newKey.append(charSet[idx]);
		}
		// 스트링 버퍼를 스트링형태로 바꿔서 반환해줌
		return newKey.toString();
	}

	// 비밀반호 변경
	@RequestMapping(value = "user/changePw")
	public String changePw(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			HttpSession session) throws Exception {

		log.info(this.getClass().getName() + "changePw start!");
		String user_id = (String) session.getAttribute("SS_USER_ID");
		String password = request.getParameter("password");

		UserInfoDTO pDTO = null;
		pDTO = new UserInfoDTO();

		pDTO.setUser_id(user_id);
		pDTO.setPassword(EncryptUtil.encHashSHA256(password));

		log.info("user_id : " + user_id);
		log.info("password : " + password);

		try {
			pDTO = userInfoService.chPw(pDTO);

		} catch (Exception e) {
			log.info(e.toString());
			e.printStackTrace();
		}

		if (pDTO != null) {

			int result = 0;

			log.info(this.getClass().getName() + "changePw end!");

			if (result == 0) {
				model.addAttribute("msg", "새비밀번호가 변경되었습니다.");
				model.addAttribute("url", "/user/LoginForm.do");

			} else {
				model.addAttribute("msg", "변경 실패했습니다.");
				model.addAttribute("url", "/mypage/ChPwForm.do");
			}

		}
		return "/redirect";
	}

	//로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session, Model model) throws Exception {
		// 세션을 초기화 시킴
		session.invalidate();
		model.addAttribute("msg", "로그아웃하셨습니다");
		model.addAttribute("url", "/MainForm.do");

		return "/redirect";
	}

	//회원탈퇴
	@RequestMapping(value = "mypage/DeleteUser")
	public String DeleteUser(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			HttpSession session) throws Exception {

		log.info(this.getClass().getName() + "DeleteUser start!");
		String user_id = (String) request.getParameter("user_id");
		log.info(user_id);
		int result = 0;

		try {
			result = userInfoService.delUser(user_id);

		} catch (Exception e) {
			log.info(e.toString());
			e.printStackTrace();
		}

		log.info(this.getClass().getName() + "DeleteUser end!");

		if (result > 0) {
			session.invalidate();
			model.addAttribute("msg", "회원 탈퇴 되었습니다.");
			model.addAttribute("url", "/user/LoginForm.do");

		} else {
			model.addAttribute("msg", "회원 탈퇴에 실패하였습니다.");
			model.addAttribute("url", "/mypage/Mypage.do");
		}

		return "/redirect";
	}

}
