package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.dto.BoardDTO;
import poly.dto.NoticeDTO;

import poly.dto.UserInfoDTO;
import poly.service.INoticeService;

@Controller
public class NoticeController {
	
	@Resource(name="NoticeService")
	private INoticeService noticeService;
	
	//로그 선언
	private Logger log = Logger.getLogger(this.getClass());
	
	//글 등록 확인
	/*
	 * @RequestMapping(value="notice/noticeReg") public String RegNotice2() {
	 * log.info(this.getClass().getName()+".RegNotice2");
	 * 
	 * return "/notice/noticeReg"; }
	 */
	
	@RequestMapping(value = "notice/noticeReg")
	   public String boardReg(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception {
	     log.info("############# boardReg 실행 ################");
	     log.info(this.getClass().getName()+".RegNotice2");
	     
	      if (session.getAttribute("SS_USER_ID") == null) {
	         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
	         model.addAttribute("url", "/user/LoginForm.do");
	         return "/redirect";

	      } else if (session.getAttribute("SS_USER_ID").equals("1")) {
	         return "/notice/noticeReg";

	      } else {
	         return "/notice/noticeReg";
	      }
	   }

	
	//공지사항 작성
	@RequestMapping(value="/notice/noticeRegProc")
	public String NoticeRegProc(HttpServletRequest request, Model model , HttpSession session) {
		log.info(this.getClass().getName());
		
		if (session.getAttribute("SS_USER_ID") == null) {
	         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
	         model.addAttribute("url", "/user/LoginForm.do");
	         return "/redirect";
	     }
		
		String title = request.getParameter("title"); //제목
		String contents = request.getParameter("contents"); //내용
		//String userSeq = request.getParameter("userSeq");
		String user_name = (String) session.getAttribute("user_name"); //작성자
		String starCheck =  request.getParameter("starCheck");  //별점
		
		log.info(title);
		log.info(contents);
		log.info(user_name);
		log.info(starCheck);
		
		NoticeDTO bDTO = new NoticeDTO();
		bDTO.setContent(contents);
		bDTO.setTitle(title);
		bDTO.setUser_name(user_name);
		bDTO.setStarCheck(starCheck);
		
		int result = 0;
		
		try {
			result = noticeService.insertNoticeInfo(bDTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result > 0) {
			model.addAttribute("url", "/notice/noticeList.do");
			model.addAttribute("msg", "등록되었습니다");
		}else {
			model.addAttribute("url", "/notice/noticeReg.do");
			model.addAttribute("msg", "등록에 실패했습니다");
		}
		
		return "/redirect";
	}
	
	//공지사항 리스트
	@RequestMapping(value="notice/noticeList")
	public String NoticeList(Model model, HttpSession session,
			 @RequestParam(defaultValue = "1") int curPage) throws Exception {
		log.info(this.getClass().getName());
		
		if (session.getAttribute("SS_USER_ID") == null) {
	         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
	         model.addAttribute("url", "/user/LoginForm.do");
	         return "/redirect";
	     }
		
		String user_name = (String) session.getAttribute("SS_USER_NAME");	
		log.info("user_name" + user_name);
		
		int listCnt = noticeService.listall1();
		
//		PagingDTO pagg1 = new PagingDTO(listCnt, curPage);
//		log.info("listCnt: "+listCnt);
//		log.info("curPage: "+curPage);
//		
//		int startIndex = pagg1.getStartIndex();
//		int endIndex = pagg1.getEndIndex();
//		log.info("startIndex: "+startIndex);
//		log.info("endIndex: "+endIndex);
		
		NoticeDTO bDTO = new NoticeDTO();
		/*
		 * bDTO.setStartIndex(startIndex); bDTO.setEndIndex(endIndex);
		 * 
		 * log.info("bDTO.setStartIndex(startIndex);"+bDTO.getStartIndex());
		 * log.info("bDTO.setEndIndex(endIndex);"+bDTO.getEndIndex());
		 */
		
		List<NoticeDTO> bList = new ArrayList<>();
		
		try {
			bList = noticeService.getNoticeList(bDTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(bList==null) {
			bList = new ArrayList<NoticeDTO>();
		}else {
			for(int i=0; i<bList.size();i++) {
				NoticeFilter(bList.get(i));
			}
		}
		
		model.addAttribute("curPage", curPage);
		/* model.addAttribute("pagg1", pagg1); */
		model.addAttribute("bList", bList);
		model.addAttribute("user_name", user_name);
		
		return "notice/noticeList";
	}
	
	@RequestMapping(value="notice/noticeDetail")
	public String NoticeDetail(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		
		
		log.info(this.getClass().getName());
		
		if (session.getAttribute("SS_USER_ID") == null) {
	         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
	         model.addAttribute("url", "/user/LoginForm.do");
	         return "/redirect";
	     }
		
		String seq = request.getParameter("seq");
		
		log.info("seq:"+seq);
		NoticeDTO bDTO = new NoticeDTO();
		UserInfoDTO uDTO = new UserInfoDTO();
		
		bDTO.setSeq(seq);
		
		noticeService.updateNoticeReadCnt(bDTO);
	
		try {
			
			bDTO = noticeService.getNoticeDetail(seq);
			

					
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(bDTO==null) {
			bDTO= new NoticeDTO();
		}else {
			NoticeFilter(bDTO);
		}
		
		
		model.addAttribute("bDTO", bDTO);
		model.addAttribute("uDTO", uDTO);
		
		
		
		return "notice/noticeDetail";
	}
	
	

	
	@RequestMapping(value="notice/noticeModify")
	public String NoticeModify(HttpServletRequest request, Model model, HttpSession session) {
		log.info(this.getClass().getName());
		
		if (session.getAttribute("SS_USER_ID") == null) {
	         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
	         model.addAttribute("url", "/user/LoginForm.do");
	         return "/redirect";
	     }
		
		String seq = request.getParameter("seq");
		
		NoticeDTO bDTO = new NoticeDTO();
		
		try {
			bDTO = noticeService.getNoticeDetail(seq);
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(bDTO==null) {
			bDTO= new NoticeDTO();
		}else {
			NoticeFilter(bDTO);
		}
		model.addAttribute("bDTO", bDTO);
		
		return "notice/noticeModify";
	}
	
	@RequestMapping(value="/notice/noticeModifyProc")
	public String noticeModifyProc(HttpServletRequest request, Model model, HttpSession session) {
		log.info(this.getClass().getName());
		
		if (session.getAttribute("SS_USER_ID") == null) {
	         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
	         model.addAttribute("url", "/user/LoginForm.do");
	         return "/redirect";
	     }
		
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String seq = request.getParameter("seq");
		
		NoticeDTO bDTO = new NoticeDTO();
		bDTO.setContent(contents);
		bDTO.setSeq(seq);
		bDTO.setTitle(title);
		
		int result = 0;
		
		try {
			result = noticeService.updateNotice(bDTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result > 0) {
			model.addAttribute("url", "/notice/noticeList.do");
			model.addAttribute("msg", "수정되었습니다");
		}else {
			model.addAttribute("url", "/notice/noticeDetail.do?seq="+seq);
			model.addAttribute("msg", "수정을 실패했습니다");
		}
		
		return "/redirect";
	}
	
	@RequestMapping(value="notice/noticeDelete")
	public String NoticeDelete(HttpServletRequest request, Model model,HttpSession session) throws Exception {
		log.info(this.getClass().getName());
		
		if (session.getAttribute("SS_USER_ID") == null) {
	         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
	         model.addAttribute("url", "/user/LoginForm.do");
	         return "/redirect";
	     }
		
		String seq = request.getParameter("seq");
		
		int result = 0;
	
		result = noticeService.deleteNotice(seq);

		if(result > 0) {
			model.addAttribute("url", "/notice/noticeList.do");
			model.addAttribute("msg", "삭제되었습니다");
		}else {
			model.addAttribute("url", "/notice/noticeDetail.do?seq="+seq);
			model.addAttribute("msg", "삭제를 실패했습니다");
		}

		return "/redirect";
	}
	
	public NoticeDTO NoticeFilter(NoticeDTO pDTO) {
		pDTO.setTitle(pDTO.getTitle().replaceAll("& lt;","&lt;" ).replaceAll("& gt;", "&gt;"));
		pDTO.setTitle(pDTO.getTitle().replaceAll("& #40;","\\(" ).replaceAll("& #41;", "\\)"));
		pDTO.setTitle(pDTO.getTitle().replaceAll("& #39;","'" ));
		pDTO.setTitle(pDTO.getTitle().replaceAll("& #256;","script" ));
		if(pDTO.getContent()!=null) {
			pDTO.setContent(pDTO.getContent().replaceAll("& lt;","<" ).replaceAll("& gt;", ">"));
			pDTO.setContent(pDTO.getContent().replaceAll("& #40;","\\(" ).replaceAll("& #41;", "\\)"));
			pDTO.setContent(pDTO.getContent().replaceAll("& #39;","'" ));
			pDTO.setContent(pDTO.getContent().replaceAll("& #256;","script" ));
		}
		return pDTO;
	}
}
