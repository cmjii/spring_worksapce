package com.ezen.www.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.www.domain.BoardVO;
import com.ezen.www.domain.FileVO;
import com.ezen.www.domain.PagingVO;
import com.ezen.www.handler.FileHandler;
import com.ezen.www.handler.PagingHandler;
import com.ezen.www.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {
	
	@Inject
	private BoardService bsv;
	@Inject
	private FileHandler fhd;
	
	//경로와 리턴의 값이 같을 경우 생략가능
	// /board/register => /board/register (매핑 되는 경로와 나가는 경로가 같다면 생략가능)
	@GetMapping("/register")
	public void register(){}
	
	//(@RequestParam("name")String name : 파라미터 받을 때 
	@PostMapping("/register")
	public String register(BoardVO bvo,@RequestParam(name="files",required = false)MultipartFile[] files) { //required == 필수여부 선택 (false로 주면 파라미터가 없어도 null에러가 뜨지않음)
		log.info("bvo >>{}"+bvo);
		log.info("files : "+files.toString());
		//파일 핸들러 처리.
		List<FileVO> flist = null;
		
		if(files[0].getSize()>0) { //file배열의 길이를 볼 경우엔 null이나 빈 객체가 들어와서 길이가 잡히는 경우가 있어 더 정확한 방법을 사용하는 것
			flist = fhd.uploadFiles(files);
			log.info("flist : "+flist);
		}
		
		//int isok = bsv.register(bvo);
		//목적지 경로 =destpage 똑같이 register.jsp로 갈거니까 이름이 같으니 생략가능 자동으로 옮겨줌
		return "redirect:/board/list"; //바로 리스트로 보내면 초기화 된 리스트 화면이 나옴 redirect를 사용하면 내부 로직을 한번 돈 후에 옮겨짐
								//mapping list로 가는거! 밑에 getMapping(list) 그래서 로직을 도는 거임 jsp로 가는 것이 아님.
	}
	
	// /board/list => /board/list  void 처리해도 상관없음
	@GetMapping("/list")
	public String list(Model m, PagingVO pgvo) {
		log.info(">> pgvo : "+pgvo);
		//리턴 타입은 목적지 경로에 대한 타입 (destpage가 리턴이라고 생각)
	
		//Model 객체 => setAttribute 역할을 하는 객체
		m.addAttribute("list", bsv.getList(pgvo)); //여기서 add가 set이랑 같은 뜻. 보드서비스에서 리스트를 갖고오면 그걸 "list"에 넣어줘 "lis" 는 리턴값으로 넘어감
		
		//paginghandler 객체 다시 생성 (pgvo, totalCount)
		int totalCount = bsv.getTotalCount(pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		m.addAttribute("ph", ph);
		return "/board/list";
	}
	
	@GetMapping({"/detail","/modify"}) //여러개 가능
	public void detail(Model m, @RequestParam("bno") int bno) {
		log.info("bno >>{}"+bno);
		m.addAttribute("bvo", bsv.getDetail(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo, Model m) {
		log.info("bvo : "+bvo);
		bsv.update(bvo);
		//m.addAttribute("bno",bvo.getBno()); -> 이 버전으로도 처리 가능
		return "redirect:/board/detail?bno="+bvo.getBno(); 
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") int bno, RedirectAttributes re) {
		log.info("bno : "+bno);
		int isok = bsv.remove(bno);
		//페이지가 새로고침 될 때 남아있을 필요가 없는 데이터 
		//리다이렉트 될 때 데이터를 보내는 객체 (RedirectAttributes)
		re.addFlashAttribute("isDel",isok);//한번만 데이터를 일시적으로 보내는 객체
		//위에 re객체를 보냈을 때 받는 것은 밑에 리턴 값임 바로 jsp로 보내고 싶다면 model사용이 아닌 redirect를 사용
		return "redirect:/board/list";
	}
	

}
