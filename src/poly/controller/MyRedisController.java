package poly.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.service.IMyRedisService;


@Controller
public class MyRedisController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MyRedisService")
	private IMyRedisService myRedisService;
	
	// 빅데이터 처리를 위한
	
	@RequestMapping(value="myRedis/test")
	@ResponseBody
	public String myRedis(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		log.info(this.getClass().getName()+".myRedis start!");
		myRedisService.doSaveData();
		log.info(this.getClass().getName()+".myRedis end");
		return "success";
		
	}
	
	//리스트
	@RequestMapping(value="myRedis/test02")
	@ResponseBody
	public String test02(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		log.info(this.getClass().getName()+".test02 start!");
		myRedisService.doSaveDataforList();
		log.info(this.getClass().getName()+".test02 end");
		return "success";
		
	}
	
	//리스트 구조에 JSON
	@RequestMapping(value="myRedis/test03")
	@ResponseBody
	public String test03(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		log.info(this.getClass().getName()+".test03 start!");
		myRedisService.doSaveDataforListJSON();
		log.info(this.getClass().getName()+".test03 end");
		return "success";
		
	}
	
	//HashTable
	@RequestMapping(value="myRedis/test04")
	@ResponseBody
	public String test04(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		log.info(this.getClass().getName()+".test04 start!");
		myRedisService.doSaveDataforHashTable();
		log.info(this.getClass().getName()+".test04 end");
		return "success";
		
	}
	
	//set
	@RequestMapping(value="myRedis/test05")
	@ResponseBody
	public String test05(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		log.info(this.getClass().getName()+".test05 start!");
		myRedisService.doSaveDataforSet();
		log.info(this.getClass().getName()+".test05 end");
		return "success";
		
	}
	
	
	//zset
	@RequestMapping(value="myRedis/test06")
	@ResponseBody
	public String test06(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		log.info(this.getClass().getName()+".test06 start!");
		myRedisService.doSaveDataforZSet();
		log.info(this.getClass().getName()+".test06 end");
		return "success";
		
	}
	
}
