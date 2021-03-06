package poly.persistance.mongo.impl;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;

import poly.dto.BugsDTO;
import poly.dto.WordDTO;
import poly.persistance.mongo.IBugsMapper;
import poly.util.CmmUtil;


@Component("BugsMapper")
public class BugsMapper implements IBugsMapper {
	
	@Autowired
	private MongoTemplate mongodb;
	
	private Logger log = Logger.getLogger(this.getClass());

	@Override
	public boolean createCollection(String colNm) throws Exception {
	
		log.info(this.getClass().getName() + ".createCollection Start!");
		
		boolean res = false;
		
		//기존에 등록된 컬렉션 이름이 존재라는지 체크하고, 존재하면 기존 컬렉션 삭제함
		if(mongodb.collectionExists(colNm)) {
			mongodb.dropCollection(colNm); //기존 컬랙션 삭제
		}
		
		// 컬렉션 생성 및 인덱스 생성, MongoDB에서 데이터 가져오는 방식에 맞게 인덱스는 반드시 생성하자!
		// 데이터 양이 많지 않으면 문제되지 않으나, 최소 10만건 이상 데이터 저장시 속도가 약 10배 이상 발생함
		mongodb.createCollection(colNm).createIndex(new BasicDBObject("collect_time", 1).append("rank", 1), "rankIdx");
		
		res =true;
		
		log.info(this.getClass().getName() + ".createCollection End!");
		
		return res;
	}
	
	@Override
	public int insertRank(List<BugsDTO> pList, String colNm) throws Exception {
		 log.info(this.getClass().getName() + ".insertRank Start!");

	      int res = 0;

	      if (pList == null) {
	         pList = new ArrayList<BugsDTO>();
	      }

	      Iterator<BugsDTO> it = pList.iterator();

	      while (it.hasNext()) {
	    	  BugsDTO pDTO = (BugsDTO) it.next();

	         if (pDTO == null) {
	            pDTO = new BugsDTO();
	         }

	         mongodb.insert(pDTO, colNm);

	      }

	      res = 1;

	      log.info(this.getClass().getName() + ".insertRank End!");

	      return res;
	}
	
	@Override
	public int insertRank1(List<WordDTO> wList, String colNm) throws Exception {
		 log.info(this.getClass().getName() + ".insertRank Start!");

	      int res = 0;

	      if (wList == null) {
	    	  wList = new ArrayList<WordDTO>();
	      }

	      Iterator<WordDTO> it = wList.iterator();

	      while (it.hasNext()) {
	    	  WordDTO wDTO = (WordDTO) it.next();

	         if (wDTO == null) {
	        	 wDTO = new WordDTO();
	         }

	         mongodb.insert(wDTO, colNm);

	      }

	      res = 1;

	      log.info(this.getClass().getName() + ".insertRank End!");

	      return res;
	}
	
	@Override
	public List<BugsDTO> getRank(String colNm) throws Exception {

		log.info(this.getClass().getName() + ".getRank Start!");

		// 데이터를 가져올 컬렉션 선택
		DBCollection rCol = mongodb.getCollection(colNm);

		// 컬렉션으로부터 전체 데이터 가져오기
		Iterator<DBObject> cursor = rCol.find();

		// 컬렉션으로부터 전체 데이터 가져온 것을 List 형태로 저장하기 위한 변수 선언
		List<BugsDTO> rList = new ArrayList<BugsDTO>();

		
		BugsDTO rDTO = null;

		while (cursor.hasNext()) {

			rDTO = new BugsDTO();

			final DBObject current = cursor.next();

			String collect_time = CmmUtil.nvl((String) current.get("collect_time")); // 수집시간
			String rank = CmmUtil.nvl((String) current.get("rank")); // 순위
			String song = CmmUtil.nvl((String) current.get("song")); // 제목
			String singer = CmmUtil.nvl((String) current.get("singer")); // 가수
			String str = CmmUtil.nvl((String) current.get("str")); // 가사
		

			rDTO.setCollect_time(collect_time);
			rDTO.setRank(rank);
			rDTO.setSong(song);
			rDTO.setSinger(singer);
			rDTO.setStr(str);

			rList.add(rDTO); // List에 데이터 저장

			rDTO = null;

		}

		log.info(this.getClass().getName() + ".getRank End!");

		return rList;
	}

//	@Override
//	public String FileInsert( HttpServletRequest request ) throws IOException  {
//		
//		log.info(this.getClass().getName() + ".FileInsert Start!");
//		
//		String str = CmmUtil.nvl(request.getParameter("str"));
//		BugsDTO tDTO = null;
//		tDTO = new BugsDTO();
//		
//        try{
//        	
//        	FileWriter fw = new FileWriter("c:\\out.txt");
//            for(int i=0; i<str.length(); i++) {
//            	
//            	tDTO.setStr(str);
//                String data = tDTO + "\r\n";
//                fw.write(data);
//            }
//            fw.close();
//             
//        }catch(Exception e){
//        }
//
//
//		
//		log.info(this.getClass().getName() + ".FileInsert End!");
//		return null;
//	}


}

