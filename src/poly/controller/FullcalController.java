package poly.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FullcalController {
	
	
	private Logger log = Logger.getLogger(this.getClass());

	
	/* 캘린더로 이동 */
	@RequestMapping(value = "fullcal")
	public String fullcal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info(this.getClass().getName() + ".fullcal ok!");

		return "/fullcal";

	}

}
