package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.commons.collections.map.HashedMap;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.BugsDTO;
import poly.dto.NlpDTO;
import poly.service.IBugsService;
import poly.service.INlpService;

@Controller
public class NlpController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "NlpService")
	private INlpService nlpService;

	@Resource(name = "BugsService")
	private IBugsService bugsService;

	@RequestMapping(value = "nlp/inputForm")
	public String inputForm() {
		log.info(this.getClass().getName() + ".inputForm start!");

		return "/nlp/inputForm";
	}

	/* 긍정, 부정 분석하기 */
	@RequestMapping(value = "nlp/wordAnalysis")
	public String wordAnalysis(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		log.info(this.getClass().getName() + ".wordAnalysis start!");

		String res = "";

		// 분석할 문장

		List<BugsDTO> rList = bugsService.getRank();

		if (rList == null) {
			rList = new ArrayList<BugsDTO>();
		}

		
		String str = "";
		
		for (int i = 0; i < rList.size(); i++) {
			str += rList.get(i).getStr() + " ";
		}

		// String text_message = CmmUtil.nvl(request.getParameter("text_message"));

		

		NlpDTO pDTO = new NlpDTO();

		pDTO.setWord(str);

		Map<String,Integer> pMap = new HashMap<String, Integer>(); 
		pMap = nlpService.preProcessWordAnalysisForMind(pDTO);
		int point = pMap.get("res");
		int pos = pMap.get("pos");
		int neg = pMap.get("neg");
		if(neg<0) {
			neg *= -1;
		}

		if (point < 0) {
			res = "문장의 분석 결과는" + point + "로 부정적인 결과가 나왔습니다";

		} else if (point == 0) {
			res = "문장의 분석 결과는 데이터 사전에 존재하지 않아 분석이 불가능 합니다";
			
			/* res = "\" " + str + "\" 문장의 분석 결과는 데이터 사전에 존재하지 않아 분석이 불가능 합니다"; */

		} else {
			res =  point + "로 긍정적인 결과가 나왔습니다";

		}

		// 분석 결과 넣어주기
		model.addAttribute("res", res);
		model.addAttribute("pos",pos);
		model.addAttribute("neg",neg);

		log.info(this.getClass().getName() + ".wordAnalysis end!");

		return "/nlp/wordAnalysis";

	}
}
