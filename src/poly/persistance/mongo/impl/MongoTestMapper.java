package poly.persistance.mongo.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

import com.mongodb.BasicDBObject;

import poly.persistance.mongo.IMongoTestMapper;

@Component("MongoTestMapper")
public class MongoTestMapper implements IMongoTestMapper {

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
		
		mongodb.createCollection(colNm).createIndex(new BasicDBObject("user_id", 1), "testIdx");
		
		res =true;
		
		log.info(this.getClass().getName() + ".createCollection End!");
		
		return false;
	}
	
	

}
