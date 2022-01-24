package com.example.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.lesson04.bo.UserBO;
import com.example.lesson04.model.User;

@RequestMapping("/lesson04/ex01")
@Controller
public class UserController {
	
	@Autowired
	private UserBO userBO;
	
	// http://localhost:8080/lesson04/ex01/add_user_view
	@RequestMapping(path = "/add_user_view", method = RequestMethod.GET)
	public String addUserView() {	// @ResponseBody 없으면 view의 경로를 리턴한다.
		return "lesson04/addUser"; 	// /WEB-INF/jsp/lesson04/addUser.jsp
	}
	
	// http://localhost:8080/lesson04/ex01/add_user
	@PostMapping("/add_user")
	public String addUser(
			@RequestParam("name") String name,
			@RequestParam("yyyymmdd") String yyyymmdd,
			@RequestParam("email") String email,
			@RequestParam(value="introduce", required=false) String introduce) {
		
		// 쿼리 파라미터들을 받아온다.
		
		// DB insert
		userBO.addUser(name, yyyymmdd, email, introduce);
		
		// 결과 view 화면 리턴
		return "lesson04/afterAddUser";
	}
	
	// http://localhost:8080/lesson04/ex01/get_last_user
	@GetMapping("/get_last_user")
	public String getLastUser(Model model) {
		// 마지막(가장 최근)에 추가된 사람 한명 정보 가져오기
		User lastUser = userBO.getLastUser();
		model.addAttribute("result", lastUser);	// 결과 jsp view에 객체 값을 넘겨준다.
		model.addAttribute("subject", "회원 정보");
		
		return "lesson04/getLastUser";
	}
	
}
