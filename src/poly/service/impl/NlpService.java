package poly.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.NlpDTO;
import poly.persistance.mapper.INlpMapper;
import poly.service.INlpService;
import poly.util.CmmUtil;
import poly.util.StringUtil;

@Service("NlpService")
public class NlpService implements INlpService {

	@Resource(name = "NlpMapper")
	private INlpMapper nlpMapper;

	private Logger log = Logger.getLogger(this.getClass());

	private Map<String, List<NlpDTO>> NLP_DIC = new HashMap<String, List<NlpDTO>>();

	@Override
	@PostConstruct
	public void getWord() throws Exception {
		log.info(this.getClass().getName() + ".getWord start!");

		// 데이터 사전 조회하기 위한 변수를 정장할DTO
		NlpDTO pDTO = new NlpDTO();

		// 가나다 별 데이터가 정장될 변수
		List<NlpDTO> rList = null;

		// ㄱ실행
		pDTO.setWord("ㄱ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㄱ", rList);

		// ㄴ실행
		pDTO.setWord("ㄴ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㄴ", rList);

		// ㄷ실행
		pDTO.setWord("ㄷ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㄷ", rList);

		// ㄹ실행
		pDTO.setWord("ㄹ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㄹ", rList);

		// ㅁ실행
		pDTO.setWord("ㅁ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㅁ", rList);

		// ㅂ실행
		pDTO.setWord("ㅂ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㅂ", rList);

		// ㅅ실행
		pDTO.setWord("ㅅ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㅅ", rList);

		// ㅇ실행
		pDTO.setWord("ㅇ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㅇ", rList);

		// ㅈ실행
		pDTO.setWord("ㅈ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㅈ", rList);

		// ㅊ실행
		pDTO.setWord("ㅊ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㅊ", rList);

		// ㅋ실행
		pDTO.setWord("ㅋ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㅋ", rList);

		// ㅌ실행
		pDTO.setWord("ㅌ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㅌ", rList);

		// ㅍ실행
		pDTO.setWord("ㅍ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㅍ", rList);

		// ㅎ실행
		pDTO.setWord("ㅎ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㅎ", rList);

		// ㄲ실행
		pDTO.setWord("ㄲ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㄲ", rList);

		// ㄸ실행
		pDTO.setWord("ㄸ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㄸ", rList);

		// ㅃ실행
		pDTO.setWord("ㅃ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㅃ", rList);

		// ㅆ실행
		pDTO.setWord("ㅆ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㅆ", rList);

		// ㅉ실행
		pDTO.setWord("ㅉ");
		rList = nlpMapper.getWord(pDTO); // db조회

		if (rList == null) {
			rList = new ArrayList<NlpDTO>();
		}

		NLP_DIC.put("ㅉ", rList);

		log.info(this.getClass().getName() + ".getWord End!");
	}

	/*
	 * 감정 분석을 위한 문장 나누는 전처리 단계
	 * 
	 * @param 분석할 문장 정보
	 * 
	 * @return 감정 분석 평가 결과
	 */

	public int preProcessWordAnalysisForMind(NlpDTO pDTO) throws Exception {
		log.info(this.getClass().getName() + ".WordAnalysisForMind start!");

		int res = 0;

		// 분석할 문장(특수문자 제거)
		log.info(CmmUtil.nvl(pDTO.getWord()));
		String str = CmmUtil.nvl(pDTO.getWord()).replaceAll("[^\\uAC00-\\uD7A3xfe0-9a-zA-Z\\\\s]", " ");

		// 연속된 공백 제거
		str = str.replaceAll("\\s{2,}", " ");

		log.info("str : " + str);

		// 공백으로 단어를 나누기
		String[] textArr = str.split(" ");

		log.info("textArr : " + textArr.length);

		// 데이터 사전의 단어의 수가 최대 3개로 정의

		// 최대 반복 횟수
		int maxCnt = textArr.length;

		log.info("###textArr : " + textArr.length);
		log.info("###maxCnt : " + maxCnt);

		for (int i = 0; i < maxCnt; i++) {

			// 문장의 첫글자
			String firstWord2 = textArr[i].substring(0, 1);

			String text2 = " ";
			
			log.info("###반복횟수 : " + i);
			
			if(i == maxCnt - 1 ) {
				text2 = textArr[i];
				
			}else if(i == maxCnt - 2){
				text2 = textArr[i] + " " + textArr[i + 1];
			}else {
				text2 = textArr[i] + " " + textArr[i + 1] + " " + textArr[i + 2];

			}
			
			res += WordAnalysisForMind(firstWord2, text2);
		}

		log.info("Res : " + res);

		log.info(this.getClass().getName() + ".WordAnalysisForMind end!");

		return res;
	}

	public int WordAnalysisForMind(String firstWord, String str) throws Exception {

		int res = 0;

		log.info("firstWord : " + firstWord);
		log.info("str : " + str);

		// 데이터 사전 종류
		String dicType = StringUtil.getFirstWord(firstWord);

		log.info("DIC Type : " + dicType);

		// 데이터 사전에 존재하는 것만 분석 수행
		if (dicType.length() > 0) {

			// 문장의 첫글자를 통해 해당되는 데이터 사전 가져오기
			List<NlpDTO> rList = NLP_DIC.get(StringUtil.getFirstWord(firstWord));

			if (rList == null) {
				rList = new ArrayList<NlpDTO>();

			}

			Iterator<NlpDTO> it = rList.iterator();

			while (it.hasNext()) {
				NlpDTO rDTO = it.next();

				if (rDTO == null) {
					rDTO = new NlpDTO();
				}

				// 일치하는 값이 존재한다면,
				if (str.indexOf(CmmUtil.nvl(rDTO.getWord())) > -1) {
					log.info("DIC-word : " + CmmUtil.nvl(rDTO.getWord()));
					log.info("DIC-word getPolarity : " + CmmUtil.nvl(rDTO.getWord()));
					log.info("str : " + str);

					res += Integer.parseInt(CmmUtil.nvl(rDTO.getPolarity(), "0"));

					// 데이터 사전에 검샏이 되어있기 때문에 더 이상 while을 실행하지 않는다
					break;
				}

			}

		}

		return res;
	}

}
