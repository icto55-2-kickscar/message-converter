package com.sds.icto.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MCController {

	@RequestMapping("/hello")
	@ResponseBody
	public String hello() {
		return "HelloWorld";
	}

	@RequestMapping("/api/checkEmail")
	@ResponseBody
	public Object checkEmail(String email) {
		System.out.println("---------->" + email);

		Map<String, Object> map = new HashMap<String, Object>();

		// kickscar@gmail.com 이 없음
		// Dao로 체크할 것
		if( "kickscar@gmail.com".equals( email ) == false ) {
			map.put("result", false );
			map.put("data", "사용할 수 있습니다." );
		} else  {
			map.put("result", true );
			map.put("data", "사용할 수 없습니다." );
		}

		return map;
	}

	@RequestMapping("/form")
	public String form() {
		return "joinform";
	}

}
