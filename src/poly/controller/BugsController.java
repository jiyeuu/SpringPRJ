package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.BugsDTO;
import poly.service.IBugsService;

@Controller
public class BugsController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "BugsService")
	private IBugsService bugsService;

	// 멜론 top 수집
	@RequestMapping(value = "bugs/collectBugsRank")
	@ResponseBody
	public String collectBugsRank(HttpServletRequest request, HttpServletResponse response) throws Exception {

		log.info(this.getClass().getName() + ".collectBugsRank Start!");

		bugsService.collectBugsRank();

		log.info(this.getClass().getName() + ".collectBugsRank End!");

		return "success";

	}

	/**
	 * 멜론 데이터 가져오는 일반 화면
	 */
	@RequestMapping(value = "bugs/bugsTop100")
	public String bugsTop100(HttpServletRequest request, HttpServletResponse response) throws Exception {

		log.info(this.getClass().getName() + ".bugsTop100 Start!");

		log.info(this.getClass().getName() + ".bugsTop100 End!");

		return "/bugs/bugsTop100";
	}

	/**
	 * 멜론 데이터 가져오기
	 */
	/* @ResponseBody */
	@RequestMapping(value = "bugs/getRank")
	public String getRank(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		log.info(this.getClass().getName() + ".getRank Start!");

		List<BugsDTO> rList = bugsService.getRank();

		
		
		if (rList == null) {
			rList = new ArrayList<BugsDTO>();
		}

		log.info(this.getClass().getName() + ".getRank End!");
	
		model.addAttribute("rList",rList);
		
		log.info("rList 사이즈 : " + rList.size());
		
		return "/bugs/bugsTop100";
	}

	/**
	 * 멜론 데이터 가져오는 일반 화면
	 */
	@RequestMapping(value = "test")
	public String test(HttpServletRequest request, HttpServletResponse response) throws Exception {

		log.info(this.getClass().getName() + ".test Start!");

		log.info(this.getClass().getName() + ".test End!");

		return "/test";
	}
	/**
	 * 멜론 데이터 가져오는 일반 화면
	 */
	@RequestMapping(value = "rTest")
	@ResponseBody
	public Map<String,List<String>> rTest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		log.info(this.getClass().getName() + ".rTest Start!");
		Map<String, List<String>> pMap = bugsService.rTest();
		if(pMap==null) {
			pMap = new HashMap<String, List<String>>();
		}
		
		log.info(this.getClass().getName() + ".rTest End!");

		return pMap;
	}

	@RequestMapping(value = "rTest1")
	@ResponseBody
	public String rTest1(HttpServletRequest request, HttpServletResponse response) throws Exception {

		log.info(this.getClass().getName() + ".rTest1 Start!");

		RConnection c = new RConnection();

		c.eval("library(KoNLP)");
		c.eval("useNIADic()");
		c.eval("library(stringr)");
		c.eval("library(dplyr)");
	
		
		
		
		c.close();
		
		log.info(this.getClass().getName() + ".rTest1 End!");

		return "success";
	}

}
