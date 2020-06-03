package poly.persistance.redis.impl;

import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Component;

import poly.dto.MyJsonDTO;
import poly.persistance.redis.IMyRedisMapper;
import poly.util.CmmUtil;

@Component("MyRedisMapper")
public class MyRedisMapper implements IMyRedisMapper {

@Autowired
public RedisTemplate<String, Object> redisDB;
	
private Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public void doSaveData() throws Exception {
		// TODO Auto-generated method stub
		
		String redisKey = "Test01";
		String saveData = "난 저장되는 데이터이다.";

		//redis 저장 및 읽기에 대한 데이터 타입지정 (String타입으로)
		redisDB.setKeySerializer(new StringRedisSerializer());
		redisDB.setValueSerializer(new StringRedisSerializer());
		
		//데이터가 존재하면 바로 반환
		if(redisDB.hasKey(redisKey)) { //key가 존개하면 데이터 읽기
			String res = (String) redisDB.opsForValue().get(redisKey);
			
			log.info("res : " + res);
			
		}else {
			redisDB.opsForValue().getAndSet(redisKey, saveData);
			
			//TTL설정을 위한 함수 실행
			//redisKey로 저장되는 데이터는 2일동안 유효시간을 가짐
			redisDB.expire(redisKey, 2, TimeUnit.DAYS);
			
			log.info("No Data!!");
			
		}
		
	}

	
	/* 리스트형태 데이터 저장하기 */
	/*
	 * @Override public void doSaveDataforList() throws Exception {
	 * 
	 * log.info("doSaveDataforList start!!");
	 * 
	 * String redisKey = "멜론차트 TOP-100";
	 * 
	 * 
	 * redisDB.setKeySerializer(new StringRedisSerializer());
	 * redisDB.setValueSerializer(new StringRedisSerializer());
	 * 
	 * if(redisDB.hasKey(redisKey)) {
	 * 
	 * List<String> pList = (List) redisDB.opsForList().range(redisKey, 0, -1);
	 * 
	 * Iterator<String> it = pList.iterator();
	 * 
	 * while (it.hasNext()) 
	 * { String data = (String) it.next();
	 * 
	 * log.info("data : " + data);
	 * 
	 * }
	 * 
	 * } else { for(int i=0; i<10; i++) {
	 * 
	 * 
	 * //오름차순 저장 rightPush redisDB.opsForList().rightPush(redisKey, "[" + i +
	 * "] 번째 데이터입니다."); //내림차순 저장 leftPush //redisDB.opsForList().leftPush(redisKey,
	 * "[" + i + "] 번째 데이터입니다.");
	 * 
	 * 
	 * }
	 * 
	 * //5시간 redisDB.expire(redisKey, 5, TimeUnit.HOURS);
	 * 
	 * log.info("Save Data!!");
	 * 
	 * } }
	 */
	
	//https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=
	 @Override
	 public void doSaveDataforList() throws Exception {
		 
		String redisKey = "멜론차트 TOP-100";

		redisDB.setKeySerializer(new StringRedisSerializer());
		redisDB.setValueSerializer(new StringRedisSerializer());
		try {
			
			if(redisDB.hasKey(redisKey)) {
				  
				  List<String> pList = (List) redisDB.opsForList().range(redisKey, 0, -1);
				 
				  Iterator<String> it = pList.iterator();
				  
				  while (it.hasNext()) 
				  { 
					 String data = (String) it.next();
				  
				  	log.info("노래 제목 : " + data);
				  
				  }
				  
				  } else { 
			
					  String url2 = "https://www.melon.com/chart/";
				      String url3 = "https://www.melon.com/chart/#params%5Bidx%5D=51";
				      
				      Document doc2 = Jsoup.connect(url2).get();
				      Document doc3 = Jsoup.connect(url3).get();
				      
				      Elements rowElements = doc2.select("table > tbody > tr#lst50 > td:nth-child(6) > div > div > div.ellipsis.rank01 > span");
				      Elements rowElements1 = doc3.select("table > tbody > tr#lst100 > td:nth-child(6) > div > div > div.ellipsis.rank01 > span");
				      
				      for(Element row : rowElements) {
					         
					         Elements tdElements = row.getElementsByTag("a");
					         redisDB.opsForList().rightPush(redisKey, tdElements.get(0).text());
					      }
				      
				      for(Element row1 : rowElements1 )
				      {
				    	  Elements tdElements1 = row1.getElementsByTag("a");
				    	  redisDB.opsForList().rightPush(redisKey, tdElements1.get(0).text());     
				      }	 
				      
				      redisDB.expire(redisKey, 5, TimeUnit.HOURS);
				  }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		log.info("Save Data!!");
	}
	

	

	/*
	 * DTO를 활용한 JSON 데이터 저장 
	 * Redis는 값에 저장되는 데이터 타입은 String으로 
	 * JSON 데이터를 문자열로 변환하여 저장할 수 있음
	 */

	@Override
	public void doSaveDataforListJSON() throws Exception {
		// TODO Auto-generated method stub
	log.info("doSaveDataforListJSON start!!");
		
		String redisKey = "Test02-List-JSON";
		
		redisDB.setKeySerializer(new StringRedisSerializer());
		
		//DTO를 JSON 구조로 변경
		redisDB.setValueSerializer(new Jackson2JsonRedisSerializer<>(MyJsonDTO.class));
		
		MyJsonDTO pDTO = null;
		
		if(redisDB.hasKey(redisKey)) {
			
			//redis에 저장된 데이터 전체 가져오기
			List<MyJsonDTO> pList = (List) redisDB.opsForList().range(redisKey, 0, -1);
			
			Iterator<MyJsonDTO> it = pList.iterator();
			
			while (it.hasNext()) {
				
				MyJsonDTO rDTO = (MyJsonDTO) it.next();
				
				if(rDTO==null) {
					rDTO=new MyJsonDTO();
				}
				
				
				log.info("name :"+CmmUtil.nvl(rDTO.getName()));
				log.info("email :"+CmmUtil.nvl(rDTO.getEmail()));
				log.info("addr :"+CmmUtil.nvl(rDTO.getAddr()));
				
			}
		}else {

			pDTO = new MyJsonDTO();
			
			pDTO.setName("윤여진");
			pDTO.setEmail("fkzm1725@naver.com");
			pDTO.setAddr("서울시 중랑구");
			
			redisDB.opsForList().rightPush(redisKey, pDTO);
			
			pDTO = null;
			
			pDTO = new MyJsonDTO();
			
			pDTO.setName("윤여진1");
			pDTO.setEmail("fkzm1725@gmail.com");
			pDTO.setAddr("서울시 강서구");
			
			redisDB.opsForList().rightPush(redisKey, pDTO);
			
			pDTO = null;
			
			redisDB.expire(redisKey, 100, TimeUnit.MINUTES);
			
			log.info("Save Data!!");
			
		}
		
		
		
	}

	/* HashtTable 형태로 키와 값이 존재하는 구조로 저장 */

	@Override
	public void doSaveDataforHashTable() throws Exception {
		// TODO Auto-generated method stub
		
	log.info("doSaveDataforHashTable start!!");
		
		String redisKey = "Test03-HashTable";
		
		redisDB.setKeySerializer(new StringRedisSerializer());
		redisDB.setValueSerializer(new Jackson2JsonRedisSerializer<>(MyJsonDTO.class));
		
		if(redisDB.hasKey(redisKey)) {
			
			String name = CmmUtil.nvl((String) redisDB.opsForHash().get(redisKey, "name"));
			String email = CmmUtil.nvl((String) redisDB.opsForHash().get(redisKey, "email"));
			String addr = CmmUtil.nvl((String) redisDB.opsForHash().get(redisKey, "addr"));
			
			log.info("name : " + name);
			log.info("email : " + email);
			log.info("addr : " + addr);
			
		}else {
			
			redisDB.opsForHash().put(redisKey, "name", "윤여진");
			redisDB.opsForHash().put(redisKey, "email", "fkzm1725@naver.com");
			redisDB.opsForHash().put(redisKey, "addr", "서울시 중랑구");
			
	redisDB.expire(redisKey, 100, TimeUnit.MINUTES);
			
			log.info("Save Data!!");
			
		}
		
	}

	/* Set은 중복을 허용하지 않기 때문에 데이터 저장 속도는 List에 비해 느림 
	 * 순서상관없음
	 */

	@Override
	public void doSaveDataforSet() throws Exception {
		
		String redisKey = "Test03-Set";

		redisDB.setKeySerializer(new StringRedisSerializer());
		redisDB.setValueSerializer(new StringRedisSerializer());
		
		if(redisDB.hasKey(redisKey)) {
			Set rSet = (Set)redisDB.opsForSet().members(redisKey);
			
			Iterator<String> it = rSet.iterator();
			
			while(it.hasNext()) {
				String value = CmmUtil.nvl((String)it.next());
				
				log.info("value"+ value);
				
			}
			
		}else {
			
			redisDB.opsForSet().add(redisKey, "1번째 저장합니다.");
			redisDB.opsForSet().add(redisKey, "2번째 저장합니다.");
			redisDB.opsForSet().add(redisKey, "3번째 저장합니다.");
			redisDB.opsForSet().add(redisKey, "4번째 저장합니다.");
			
			redisDB.expire(redisKey, 100, TimeUnit.MINUTES);
			
			log.info("Save Data!!");
		}
		
	}

	/* Zset은 저장 순서를 지정할 수 있는 데이터 구조 */

	@Override
	public void doSaveDataforZSet() throws Exception {
		// TODO Auto-generated method stub
		
		String redisKey = "Test04-ZSet";

		redisDB.setKeySerializer(new StringRedisSerializer());
		redisDB.setValueSerializer(new StringRedisSerializer());
		
		if(redisDB.hasKey(redisKey)) {
			
			long cnt = redisDB.opsForZSet().size(redisKey);
			
			Set rSet = (Set) redisDB.opsForZSet().range(redisKey, 0, cnt);
			
			
			if(rSet == null) {
				rSet = new LinkedHashSet<String>();
			}
			
			
			Iterator<String> it = rSet.iterator();
			
			while(it.hasNext()) {
				String value = CmmUtil.nvl((String)it.next());
				
				log.info("value"+ value);
				
			}
			
		}else {
			
			redisDB.opsForZSet().add(redisKey, "1번째 저장합니다.",1);
			redisDB.opsForZSet().add(redisKey, "2번째 저장합니다.",2);
			redisDB.opsForZSet().add(redisKey, "3번째 저장합니다.",3);
			redisDB.opsForZSet().add(redisKey, "4번째 저장하지만, 2번째 위치로 가고싶다.",1.1);
			
			redisDB.expire(redisKey, 100, TimeUnit.MINUTES);
			
			log.info("Save Data!!");
		}
		
	}

	
	
}
