package com.myweb.www.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.service.BoardService;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor //객체를 생성자를 통해 주입 service에 inject의존성 주입대신 final붙여서 객체 등록
@RequestMapping("/board/*")
public class BoardController {
	
	private final BoardService bsv;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String insert(BoardVO bvo) {
		log.info("bvo : "+bvo);
		int isok =bsv.insert(bvo);
		return "index";
	}
	
	@GetMapping("/list")
	public void list(Model m, PagingVO pgvo) {
		List<BoardVO> list = bsv.getlist(pgvo);
		m.addAttribute("list", list);
	}
	
	@GetMapping({"/detail","/modify"})
	public void detail(Model m, @RequestParam("bno")int bno) {
		log.info("bno :"+bno);
		m.addAttribute("bvo",bsv.detail(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo, Model m) {
		log.info("bvo :" +bvo);
		int isok = bsv.modify(bvo);
		return "redirect:/board/detail?bno="+bvo.getBno();
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("bno") int bno, RedirectAttributes re) {
		log.info("bno : "+bno);
		int isok = bsv.delete(bno);
		re.addFlashAttribute("de", isok);
		return "redirect:/board/list";
		
	}

}
