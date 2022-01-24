package com.example.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.lesson03.bo.ReviewBO;

@RestController
public class Lesson03Ex03RestControll {

	@Autowired
	private ReviewBO reviewBO;
	
	// http://localhost:8080/lesson03/ex03?id=23&review=도미노피자 역시 맛있어~~
	@RequestMapping("/lesson03/ex03")
	public String ex03(
			@RequestParam("id") int id,
			@RequestParam("review") String review) {
		
		int rowCount = reviewBO.updateReviewById(id, review);
		return "변경 완료 : " + rowCount;
	}
}
