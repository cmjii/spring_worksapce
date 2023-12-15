package com.ezen.www.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.www.domain.BoardVO;
import com.ezen.www.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {
	
	@Inject
	private BoardService bsv;
	
	//경로와 리턴의 값이 같을 경우 생략가능
	// /board/register => /board/register (매핑 되는 경로와 나가는 경로가 같다면 생략가능)
	@GetMapping("/register")
	public void register(){}
	
	//(@RequestParam("name")String name : 파라미터 받을 때 
	@PostMapping("/register")
	public String register(BoardVO bvo) {
		log.info("bvo >>{}",bvo);
		int isok = bsv.register(bvo);
		//목적지 경로 =destpage 똑같이 register.jsp로 갈거니까 이름이 같으니 생략가능 자동으로 옮겨줌
		return "redirect:/board/list"; //바로 리스트로 보내면 초기화 된 리스트 화면이 나옴 redirect를 사용하면 내부 로직을 한번 돈 후에 옮겨짐
								//mapping list로 가는거! 밑에 getMapping(list) 그래서 로직을 도는 거임 jsp로 가는 것이 아님.
	}
	
	// /board/list => /board/list  void 처리해도 상관없음
	@GetMapping("/list")
	public String list(Model m) {
		//리턴 타입은 목적지 경로에 대한 타입 (destpage가 리턴이라고 생각)
	
		//Model 객체 => setAttribute 역할을 하는 객체
		m.addAttribute("list", bsv.getList()); //여기서 add가 set이랑 같은 뜻. 보드서비스에서 리스트를 갖고오면 그걸 "list"에 넣어줘 "lis" 는 리턴값으로 넘어감
		
		return "/board/list";
	}
	
	@GetMapping({"/detail","/modify"}) //여러개 가능
	public void detail(Model m, @RequestParam("bno") int bno) {
		log.info("bno >>{}",bno);
		m.addAttribute("bvo", bsv.getDetail(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo,Model m, @RequestParam("bno") int bno) {
		log.info("bvo : ",bvo);
		//update
		int isok = bsv.modify(bno);
		return "redirect:/board/detail"; //bno필요
	}
}
