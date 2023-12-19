package com.ezen.www.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.www.domain.MemberVO;
import com.ezen.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	@Inject
	private MemberService msv;
	
	@Inject
	HttpServletRequest request;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(MemberVO mvo, Model m) {
		log.info("mvo : ",mvo);
		int isok = msv.signUp(mvo);
		log.info("signUp? :"+(isok>0? "ok":"fail"));
		if(isok == 0) {
			m.addAttribute("join", "1");
			return "/member/register";
		}else {
			m.addAttribute("join","2");
		}
		return "index";
		
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(Model m,MemberVO mvo, HttpServletRequest request) {
		log.info("mvo : ",mvo);
		//mvo 객체가 DB에 일치하는지 체크
		MemberVO loginMvo = msv.isUser(mvo); 
		if(loginMvo != null) {
			//로그인 성공 시
			HttpSession ses = request.getSession();
			ses.setAttribute("ses", loginMvo); //session에 로그인 객체 저장
			ses.setMaxInactiveInterval(60*10); //로그인 유지 시간
		}else {
			//로그인 실패 시
			m.addAttribute("msg_login", "1");
		}
		return "index";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, Model m) {
		 //세션 객체 삭제 => 세션 끊기
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("ses");
		msv.lastLogin(mvo.getId());
		request.getSession().removeAttribute("ses"); //세션 객체 삭제
		request.getSession().invalidate();
		m.addAttribute("msg_logout","1");
		
		return "index";
		
	}
	
	@GetMapping("/modify")
	public void modify() {}
	
	@PostMapping("/edit")
	public String edit(MemberVO mvo, RedirectAttributes re) { //modify랑 똑같이 이름 설정해도 됨
		log.info("mvo : ",mvo);
		int isok = msv.update(mvo);
		log.info("edit : ",(isok>0? "ok":"fail"));
		re.addFlashAttribute("msg_modify","1");
		return "redirect:/member/logout";
	}
	
	@GetMapping("/remove")
	public String remove(RedirectAttributes re) {
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("ses");
		//String id = mvo.getId();
		//msv.remove(id); => ses에서 id만 빼와서 id만 전달 후 사용
		msv.remove(mvo);
		re.addFlashAttribute("msg_remove", "1");
		return "redirect:/member/logout";
	}
	
}
