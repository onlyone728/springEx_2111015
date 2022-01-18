package com.example.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller	// @RestController가 아님에 주의, 뷰는 @ResponseBody가 없다.
public class Ex02Controller {
	
	@RequestMapping("/lesson01/ex02/1")
	public String view() {
		// @ResponseBody가 아닌 상태로 String을 리턴하면, 
		// ViewResolver에 의해 리턴된 String의 경로에 해당하는 view를 찾고 view 화면이 구성된다.
		
		//		prefix					suffix
		// /WEB-INF/jsp/ *lesson01/ex02*  .jsp
		return "lesson01/ex02";
	}
}
