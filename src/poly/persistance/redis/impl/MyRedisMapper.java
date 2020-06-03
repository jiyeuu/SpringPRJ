package poly.persistance.redis.impl;

import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;
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

		redisDB.setKeySerializer(new StringRedisSerializer());
		redisDB.setValueSerializer(new StringRedisSerializer());
		
		if(redisDB.hasKey(redisKey)) {
			String res = (String) redisDB.opsForValue().get(redisKey);
			
			log.info("res : " + res);
		}else {
			redisDB.opsForValue().getAndSet(redisKey, saveData);
			
			redisDB.expire(redisKey, 2, TimeUnit.DAYS);
			
			log.info("No Data!!");
			
		}
		
	}

	@Override
	public void doSaveDataforList() throws Exception {
	
		
		log.info("doSaveDataforList start!!");
		
		String redisKey = "Test02-List";


		redisDB.setKeySerializer(new StringRedisSerializer());
		redisDB.setValueSerializer(new StringRedisSerializer());
		
		if(redisDB.hasKey(redisKey)) {
			
			List<String> pList = (List) redisDB.opsForList().range(redisKey, 0, -1);
			
			Iterator<String> it = pList.iterator();
			
			while (it.hasNext()) {
				String data = (String) it.next();
				
				log.info("data : " + data);
				
			}
		}else {
			for(int i=0;i<10;i++) {
				
				//redisDB.opsForList().rightPush(redisKey, "[" + i + "] 번째 데이터입니다.");
				redisDB.opsForList().leftPush(redisKey, "[" + i + "] 번째 데이터입니다.");
				
			}
			
			redisDB.expire(redisKey, 5, TimeUnit.HOURS);
			
			log.info("Save Data!!");
			
		}
		
		
		
	}

	@Override
	public void doSaveDataforListJSON() throws Exception {
		// TODO Auto-generated method stub
	log.info("doSaveDataforListJSON start!!");
		
		String redisKey = "Test02-List-JSON";
		
		redisDB.setKeySerializer(new StringRedisSerializer());
		redisDB.setValueSerializer(new Jackson2JsonRedisSerializer<>(MyJsonDTO.class));
		
		MyJsonDTO pDTO = null;
		
		if(redisDB.hasKey(redisKey)) {
			
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
