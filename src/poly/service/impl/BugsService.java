package poly.service.impl;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Service;

import poly.dto.BugsDTO;
import poly.persistance.mongo.IBugsMapper;
import poly.service.IBugsService;
import poly.util.DateUtil;

@Service("BugsService")
public class BugsService implements IBugsService {

	@Resource(name = "BugsMapper")
	private IBugsMapper bugsMapper;

	@Resource(name="BugsService")
	private IBugsService bugsService;

	private Logger log = Logger.getLogger(this.getClass());

	@Override
	public int collectBugsRank() throws Exception {

		log.info(this.getClass().getName() + ".collectBugsRank Start!");

		int res = 0;

		List<BugsDTO> pList = new ArrayList<BugsDTO>();

		// 멜론 Top100 중 50위까지 정보 가져오는 페이지
		String url = "https://music.bugs.co.kr/chart";

		// JSOUP 라이브러리를 통해 사이트 접속되면, 그 사이트의 전체 HTML소스 저장할 변수
		Document doc = null;

		doc = Jsoup.connect(url).get();

		// <div class="service_list_song"> 이 태그 내에서 있는 HTML소스만 element에 저장됨
		Elements element = doc.select("div#CHARTrealtime > table > tbody");

		// Iterator을 사용하여 멜론 Top100의 50위까지 순위 정보를 가져오기
		Iterator<Element> it = element.select("tr").iterator();// 멜론 50위까지 차크

		// 순위는 1위부터 50위까지 수집되기 때문에 반복문을 통해 데이터 저장
		while (it.hasNext()) {

			Element songInfo = it.next();

			// 크롤링을 통해 데이터 저장하기
			
			String lyric = songInfo.select("td").eq(3).select("a").attr("href");
			// String song = songInfo.select("div.ellipsis a").eq(0).text();
			// String singer = songInfo.select("div.ellipsis a").eq(1).text();
			Document doc1 = Jsoup.connect(lyric).get();
			Elements ele = doc1.select("article#container");
			//String rank = ele.select("table > tbody > tr > td > div > strong").text();
			String song = ele.select("header > div.innerContainer > h1").text();
			String singer = ele.select("section.summaryInfo > div.innerContainer > div.basicInfo > table > tbody > tr")
					.eq(0).select("td").text();

			String str = ele.select("xmp").text();

			songInfo = null;

			// MongoDB에 저장할 List 형태의 맞는 DTO 데이터 저장하기
			BugsDTO pDTO = new BugsDTO();
			//pDTO.setRank(rank);
			pDTO.setCollect_time(DateUtil.getDateTime("yyyyMMddhhmmss"));
			pDTO.setSong(song);
			pDTO.setSinger(singer);
			pDTO.setStr(str);

			// 한번에 여러개의 데이터를 MongoDB에 저장할 List 형태의 데이터 저장하기
			pList.add(pDTO);

		}

		String colNm = "BugsTOP100_" + DateUtil.getDateTime("yyyyMMdd");
		// MongoDB Collection 생성하기
		bugsMapper.createCollection(colNm);
		// MongoDB에 데이터저장하기
		bugsMapper.insertRank(pList, colNm);

		log.info(this.getClass().getName() + ".collectBugsRank End!");

		return res;
	}

	@Override
	public List<BugsDTO> getRank() throws Exception {

		log.info(this.getClass().getName() + ".getRank Start!");

		// 조회할 컬렉션 이름
		String colNm = "BugsTOP100_" + DateUtil.getDateTime("yyyyMMdd"); // 생성할 컬렉션명

		List<BugsDTO> rList = bugsMapper.getRank(colNm);

		if (rList == null) {
			rList = new ArrayList<BugsDTO>();
		}

		log.info(this.getClass().getName() + ".getRank End!");

		return rList;
	}

	//R 연동하는 방법
	@Override
	public void rTest() throws Exception {
		// TODO Auto-generated method stub
		
		List<BugsDTO> rList = bugsService.getRank();

		if (rList == null) {
			rList = new ArrayList<BugsDTO>();
		}
		
		String[] str = new String[rList.size()];
		for(int i = 0; i<rList.size();i++) {
			str[i]=rList.get(i).getStr();
		}
		
		RConnection c = new RConnection(); //r연결
		
		
		c.eval("library(Rserve)");
		c.eval("library(KoNLP)");
		c.eval("library(stringr)");
		c.eval("library(dplyr)");
		
		
		c.assign("str", str); //"r내부 str", 이클립스 str
		c.eval("a <- str"); //넣는거
		
		REXP x = c.eval("a"); //추출
		String[] d = x.asStrings();
		for(int i = 0; i<d.length;i++) {
			log.info(d[i]);
		}
		
		c.eval("nouns <- extractNoun(a)");
		c.eval("wordcount <- table(unlist(nouns))");
		c.eval("df_word <- as.data.frame(wordcount, stringsAsFactors = F)");
		c.eval("df_word <- rename(df_word, word = Var1, freq = Freq)");
		c.eval("df_word <- filter(df_word, nchar(word) >= 2)");
		c.eval("top_50 <- df_word %>% arrange(desc(freq)) %>% head(50)");
		
		REXP x1 = c.eval("top_50");
		String[] d1 = x1.asStrings();
		for(int i = 0; i<d1.length;i++) {
			log.info(d1[i]);
		}
		
	}

	
	
	

}
