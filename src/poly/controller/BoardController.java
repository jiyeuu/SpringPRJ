package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.dto.BoardDTO;
import poly.dto.CommentDTO;
import poly.dto.PagingDTO;
import poly.dto.UserInfoDTO;
import poly.service.IBoardService;
import poly.service.INoticeService;
import poly.service.impl.BoardService;

@Controller
public class BoardController {

	@Resource(name = "BoardService")
	private IBoardService boardService;

	@Resource(name = "NoticeService")
	private INoticeService noticeService;

	// 로그 선언
	private Logger log = Logger.getLogger(this.getClass());

	// 글 등록 확인
	@RequestMapping(value = "page/test/index")
	public String index() {
		log.info(this.getClass().getName());

		return "/page/test/index";
	}
	
	@RequestMapping(value = "/board/boardReg")
	   public String boardReg(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception {
	     log.info("############# boardReg 실행 ################");

	      if (session.getAttribute("SS_USER_ID") == null) {
	         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
	         model.addAttribute("url", "/user/LoginForm.do");
	         return "/redirect";

	      } else if (session.getAttribute("SS_USER_ID").equals("1")) {
	         return "/board/boardReg";

	      } else {
	         return "/board/boardReg";
	      }
	   }

	// 후기 작성
	@RequestMapping(value = "/board/boardRegProc")	
	public String BoardRegProc(HttpServletRequest request, Model model, HttpSession session) {
		log.info(this.getClass().getName());

		String title = request.getParameter("title"); // 제목
		String contents = request.getParameter("contents"); // 내용
		String user_name = (String) session.getAttribute("user_name"); // 작성자

		log.info(title);
		log.info(contents);
		log.info(user_name);

		BoardDTO bDTO = new BoardDTO();
		bDTO.setContent(contents);
		bDTO.setTitle(title);
		bDTO.setUser_name(user_name);
		

	//	 bDTO = BoardFilter(bDTO);
		
		
		log.info(bDTO.getContent()+"컨텐츠");
		

		int result = 0;

		try {
			result = boardService.insertBoardInfo(bDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result > 0) {
			model.addAttribute("url", "/board/boardList.do");
			model.addAttribute("msg", "등록되었습니다");
		} else {
			model.addAttribute("url", "/board/boardReg.do");
			model.addAttribute("msg", "등록에 실패했습니다");
		}

		return "/redirect";
	}

	// 후기 리스트
	@RequestMapping(value = "board/boardList")
	public String BoardList(Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {
		log.info(this.getClass().getName());

		if (session.getAttribute("SS_USER_ID") == null) {
	         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
	         model.addAttribute("url", "/user/LoginForm.do");
	         return "/redirect";
	     }
		
		String user_name = (String) session.getAttribute("user_name");
		log.info("user_name" + user_name);

		int listCnt = boardService.listall();

		PagingDTO pagg = new PagingDTO(listCnt, curPage);
		log.info("listCnt: " + listCnt);
		log.info("curPage: " + curPage);

		int startIndex = pagg.getStartIndex();
		int endIndex = pagg.getEndIndex();
		log.info("startIndex: " + startIndex);
		log.info("endIndex: " + endIndex);

		BoardDTO bDTO = new BoardDTO();
		bDTO.setStartIndex(startIndex);
		bDTO.setEndIndex(endIndex);

		log.info("bDTO.setStartIndex(startIndex);" + bDTO.getStartIndex());
		log.info("bDTO.setEndIndex(endIndex);" + bDTO.getEndIndex());

		List<BoardDTO> bList = new ArrayList<>();

		try {
			bList = boardService.getBoardList(bDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (bList == null) {
			bList = new ArrayList<BoardDTO>();
		} else {
			for (int i = 0; i < bList.size(); i++) {
				BoardFilter(bList.get(i));
			}
		}
		model.addAttribute("curPage", curPage);
		model.addAttribute("pagg", pagg);
		model.addAttribute("bList", bList);
		model.addAttribute("user_name", user_name);

		return "/board/boardList";
	}


	@RequestMapping(value = "board/boardDetail")
	public String BoardDetail(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info(this.getClass().getName());
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@ 1번 @@@@@@@@@@@@@@@@@@@@@@@@");
		if (session.getAttribute("SS_USER_ID") == null) {
	         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
	         model.addAttribute("url", "/user/LoginForm.do");
	         return "/redirect";
	     }
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@ 2번 @@@@@@@@@@@@@@@@@@@@@@@@");
		String seq = request.getParameter("seq");

		log.info("seq:" + seq);
		BoardDTO bDTO = new BoardDTO();

		bDTO.setSeq(seq);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@ 3번 @@@@@@@@@@@@@@@@@@@@@@@@");
		boardService.updateBoardReadCnt(bDTO);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@ 4번 @@@@@@@@@@@@@@@@@@@@@@@@");
		UserInfoDTO uDTO = new UserInfoDTO();

		try {

			bDTO = boardService.getBoardDetail(seq);

			log.info(bDTO.getUser_name() + "네임");
			
			System.out.println("title" + bDTO.getTitle());
			System.out.println("content"  + bDTO.getContent());
			System.out.println("reg_dt" + bDTO.getReg_date());
			System.out.println("board_seq" + bDTO.getBOARD_SEQ());
			System.out.println("read_cnt" + bDTO.getRead_cnt());
			System.out.println("user_name" + bDTO.getUser_name());
			System.out.println("starcheck" + bDTO.getStarCheck());
			
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@ 5번 @@@@@@@@@@@@@@@@@@@@@@@@");
			System.out.println();
			
			uDTO.setUser_name(bDTO.getUser_name());
			uDTO = noticeService.getNoticeDetail2(uDTO);
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@ 6번 @@@@@@@@@@@@@@@@@@@@@@@@");
			log.info(uDTO.getUser_id() + "아이디");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (bDTO == null) {
			bDTO = new BoardDTO();
		} else {
			BoardFilter(bDTO);
		}
		model.addAttribute("bDTO", bDTO);
		model.addAttribute("uDTO", uDTO);
		return "board/boardDetail";
	}

	@RequestMapping(value = "board/boardModify")
	public String BoardModify(HttpServletRequest request, Model model, HttpSession session) {
		log.info(this.getClass().getName());

		if (session.getAttribute("SS_USER_ID") == null) {
	         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
	         model.addAttribute("url", "/user/LoginForm.do");
	         return "/redirect";
	     }
		
		String seq = request.getParameter("seq");

		BoardDTO bDTO = new BoardDTO();
		
		try {
			bDTO = boardService.getBoardDetail(seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (bDTO == null) {
			bDTO = new BoardDTO();
		} else {
			BoardFilter(bDTO);
		}
		model.addAttribute("bDTO", bDTO);

		return "board/boardModify";
	}

	@RequestMapping(value = "/board/boardModifyProc")
	public String boardModifyProc(HttpServletRequest request, Model model, HttpSession session) {
		log.info(this.getClass().getName());

		if (session.getAttribute("SS_USER_ID") == null) {
	         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
	         model.addAttribute("url", "/user/LoginForm.do");
	         return "/redirect";
	     }
		
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String seq = request.getParameter("seq");

		BoardDTO bDTO = new BoardDTO();
		bDTO.setContent(contents);
		bDTO.setSeq(seq);
		bDTO.setTitle(title);

		log.info("#####################################contents : " + contents);
		log.info("#####################################title : " + title);
		
		int result = 0;

		try {
			result = boardService.updateBoard(bDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			model.addAttribute("url", "/board/boardList.do");
			model.addAttribute("msg", "수정되었습니다");
		} else {
			model.addAttribute("url", "/board/boardDetail.do?seq=" + seq);
			model.addAttribute("msg", "수정을 실패했습니다");
		}

		return "/redirect";
	}

	@RequestMapping(value = "board/boardDelete")
	public String BoardDelete(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info(this.getClass().getName());
		
		if (session.getAttribute("SS_USER_ID") == null) {
	         model.addAttribute("msg", "로그인 후 다시 시도해주세요");
	         model.addAttribute("url", "/user/LoginForm.do");
	         return "/redirect";
	     }
		
		String seq = request.getParameter("seq");
		log.info("seq: "+seq);
		
		int result = 0;

		result = boardService.deleteBoard(seq);
		if (result > 0) {
			model.addAttribute("url", "/board/boardList.do");
			model.addAttribute("msg", "삭제되었습니다");
		} else {
			model.addAttribute("url", "/board/boardDetail.do?seq=" + seq);
			model.addAttribute("msg", "삭제를 실패했습니다");
		}

		return "/redirect";
	}

	public BoardDTO BoardFilter(BoardDTO pDTO) {
		pDTO.setTitle(pDTO.getTitle().replaceAll("& lt;", "&lt;").replaceAll("& gt;", "&gt;"));
		pDTO.setTitle(pDTO.getTitle().replaceAll("& #40;", "\\(").replaceAll("& #41;", "\\)"));
		pDTO.setTitle(pDTO.getTitle().replaceAll("& #39;", "'"));
		pDTO.setTitle(pDTO.getTitle().replaceAll("!스크립트", "script"));
		
		pDTO.setContent(pDTO.getContent().replaceAll("& lt;", "&lt").replaceAll("& gt;", "&gt"));
		pDTO.setContent(pDTO.getContent().replaceAll("& #40;", "\\(").replaceAll("& #41;", "\\)"));
		pDTO.setContent(pDTO.getContent().replaceAll("& #39;", "'"));
		pDTO.setContent(pDTO.getContent().replaceAll("!스크립트", "script"));
	
		return pDTO;
		
	}
	
	//댓글작성
		@RequestMapping(value = "/DExellent/board/CommentProc")
		public String CommentProc(HttpSession session, HttpServletRequest request, HttpServletResponse response,
				ModelMap model) throws Exception {
			log.info(this.getClass().getName() + "######## 댓글 작성Proc 실행########");

			try {

				String content = request.getParameter("content");
				String writer = (String) session.getAttribute("user_name");
				String board_seq = request.getParameter("seq");
				log.info("content : " + content);
				log.info("writer : " + writer);
				log.info("board_seq : " + board_seq);

				// 여기부터
				CommentDTO bDTO = new CommentDTO();
				bDTO.setBoard_seq(board_seq);
				bDTO.setContent(content);
				bDTO.setWriter(writer);

				
				log.info("board_seq : " + board_seq);
				log.info("content : " + content);
				log.info("writer : " + writer);

				int res = 0;

				res = BoardService.InsertComment(bDTO);
				log.info("res : " + res);

				if (res > 0) {
					model.addAttribute("url", "/board/boardList.do?Pno=1");
					model.addAttribute("msg", "등록되었습니다.");
				} else {
					model.addAttribute("url", "/board/boardList.do?Pno=1");
					model.addAttribute("msg", "등록에 실패했습니다.");
				}
				bDTO = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "/redirect";
		}

		// --------------------------댓글 수정 이동 전 권한 확인 및 댓글 삭제 실행-------------------
		@RequestMapping(value = "/DExellent/board/CommentUpdate")
		public String CommentUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response,
				ModelMap model) throws Exception {
			log.info(this.getClass().getName() + "댓글 수정 이동 전 권한 확인 및 댓글 삭제 실행");

			String rno = request.getParameter("rno");
			String User = (String) session.getAttribute("user_name");

			/*
			 * List<CommentDTO> bList = new ArrayList<>(); bList =
			 * BoardService.UserCheck2(rno);
			 */
			CommentDTO cDTO = new CommentDTO();
			cDTO = BoardService.UserCheck2(rno);
			String UserCheck2 = cDTO.getWriter();

			CommentDTO pDTO = new CommentDTO();
			if (User.equals("조정규") || UserCheck2.equals(User)) {
				try {
					pDTO = new CommentDTO();
					pDTO.setRno(rno);
					pDTO = BoardService.CommentUpdate(pDTO);

					model.addAttribute("pDTO", pDTO);
					model.addAttribute("rno", rno);

				} catch (Exception e) {
					e.printStackTrace();
				}
				pDTO = null;
				cDTO = null;
				
				return "/DExellent/board/CommentUpdate";
			} else {
				model.addAttribute("url", "/board/boardList.do?Pno=1");
				model.addAttribute("msg", "권한이 없습니다. 게시판 리스트로 이동합니다.");

				pDTO = null;
				cDTO = null;
			}
			return "/redirect";
		}

		// --------------------------댓글 삭제 이동 전 권한 확인 및 댓글 삭제 실행-------------------
		@RequestMapping(value = "/DExellent/board/CommentDelete")
		public String CommentDelete(HttpSession session, HttpServletRequest request, HttpServletResponse response,
				ModelMap model) throws Exception {
			log.info(this.getClass().getName() + "댓글 삭제 이동 전 권한 확인 및 댓글 삭제 실행");

			String rno = request.getParameter("rno");
			String User = (String) session.getAttribute("user_name");

			/*
			 * List<CommentDTO> bList = new ArrayList<>(); bList =
			 * BoardService.UserCheck2(rno); String UserCheck2 = bList.get(0).toString();
			 */
			
			CommentDTO cDTO = new CommentDTO();
			cDTO = BoardService.UserCheck2(rno);
			String UserCheck2 = cDTO.getWriter();

			CommentDTO pDTO = new CommentDTO();
			if (User.equals("조정규") || UserCheck2.equals(User)) {
				try {

					pDTO.setRno(rno);
					log.info("rno : " + rno);

					int res = BoardService.CommentDelete(pDTO);
					log.info("res : " + res);

					if (res > 0) {
						model.addAttribute("url", "/board/boardList.do?Pno=1");
						model.addAttribute("msg", "삭제되었습니다.");
					} else {
						model.addAttribute("url", "/board/boardList.do?Pno=1");
						model.addAttribute("msg", "삭제에 실패했습니다. 다시 시도해주세요.");
					}
					pDTO = null;
					cDTO = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
				return "/Redirect";
			} else {
				model.addAttribute("url", "/board/boardList.do?Pno=1");
				model.addAttribute("msg", "권한이 없습니다. 게시판 리스트로 이동합니다.");

				pDTO = null;
				cDTO = null;
			}
			return "/redirect";
		}
}
