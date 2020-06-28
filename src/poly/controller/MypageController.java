package poly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.UserInfoDTO;
import poly.service.impl.UserInfoService;
import poly.util.CmmUtil;

@Controller
public class MypageController {

	private Logger log = Logger.getLogger(this.getClass());
	
	// 회원정보 읽기
	
	  @RequestMapping(value = "mypage/Mypage") 
	  public String read(Model model, HttpSession
	 session, HttpServletRequest request) throws Exception {
	  
		  log.info(this.getClass().getName() + " start!");
		  
		  if (session.getAttribute("SS_USER_ID") == null) {
		         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
		         model.addAttribute("url", "/user/LoginForm.do");
		         return "/redirect";
		     }
		  
		  	String user_id = (String) session.getAttribute("SS_USER_ID");
		  	String email = (String) session.getAttribute("SS_EMAIL");
		  	
		  	log.info("user_id"+user_id);
		  	log.info("email"+email);
		  	
			
			if (user_id == null) {
				model.addAttribute("msg", "로그인이 되어있지 않습니다.");
				model.addAttribute("url", "/user/LoginForm.do");
				
				return "/redirect";
			}
		  	  
		  
	  model.addAttribute("user_id", user_id);
	  model.addAttribute("email", email);
	  
	  return "/mypage/Mypage";
	 
	 }
	 
}

