package poly.controller;

import poly.service.impl.KakaoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
/*import org.springframework.web.bind.annotation.GetMapping;*/
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

@Controller
public class KakaoController {

	@Autowired
	private KakaoService kakao;

	@RequestMapping(value = "/")
	public String index() throws Exception {
		return "/user/LoginForm";
	}

	@RequestMapping("kakaologin")
	public String kakaologin(@RequestParam("code") String code, HttpSession session, ModelMap model) throws Exception {
		System.out.println(this.getClass().getName() + ".kakaologin start!");
		System.out.println("code: " + code);

		String access_token = kakao.getAccessToken(code);
		System.out.println("controller access_token: " + access_token);

		HashMap<String, Object> userInfo = kakao.getUserInfo(access_token, session);

		System.out.println("kakaologin controller : " + userInfo);

		if (userInfo.get("nickname") == null) {

			model.addAttribute("msg", "로그인에 실패하였습니다. kakao에서 개인정보활용에 동의해주세요.");
			model.addAttribute("url", "/user/LoginForm.do");

		} else {
			session.setAttribute("user_name", userInfo.get("nickname"));
			//-------------------------------------------------------------------------------------
			if (userInfo.get("email") == null) {
				session.setAttribute("user_mail", "비공개");
			} else {
				session.setAttribute("user_mail", userInfo.get("email"));
			}
			//-------------------------------------------------------------------------------------

			System.out.println("카카오에서 받아온 정보 세션에 넣은 값");
			System.out.println("user_name : " + session.getAttribute("user_name"));
			System.out.println("user_mail : " + session.getAttribute("user_mail"));
			System.out.println(this.getClass().getName() + ".kakaologin end!");

			model.addAttribute("msg", "로그인 되었습니다!  \"" + session.getAttribute("user_name") + "\"님 환영합니다.");
			model.addAttribute("url", "/user/LoginForm.do");
		}

		return "/redirect";
	}

	@RequestMapping(value = "kakaologout")
	public String kakaologout(ModelMap model, HttpSession session) throws Exception {

		session.invalidate();
		model.addAttribute("msg", "로그아웃 되었습니다.");
		model.addAttribute("url", "/user/LoginForm.do");

		return "/redirect";

	}

}