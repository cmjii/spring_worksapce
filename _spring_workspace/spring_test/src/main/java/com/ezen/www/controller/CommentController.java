package com.ezen.www.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.www.service.CommentService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/comment/*")
@Slf4j
@RestController //-> 비동기를 받는 컨트롤러 (일반 컨트롤러를 사용해도 무방) 구분해주기 위해서 사용
public class CommentController {
	
	@Inject
	private CommentService cvs;

}
