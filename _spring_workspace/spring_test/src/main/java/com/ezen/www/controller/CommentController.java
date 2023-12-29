package com.ezen.www.controller;

import java.util.List;

import javax.inject.Inject;
import javax.print.attribute.standard.Media;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.www.domain.CommentVO;
import com.ezen.www.service.CommentService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/comment/*")
@Slf4j
@RestController //-> 비동기를 받는 컨트롤러 (일반 컨트롤러를 사용해도 무방) 구분해주기 위해서 사용
public class CommentController {
	
	@Inject
	private CommentService csv;
	
	// ResponseEntity 객체 사용 : body내용 + httpStatus 상태
	// @RequestBody : body 값 추출 body를 가져올 때 사용 -> consumes : 가져오는 데이터의 형태
	// produces : 내보내는 데이터 형식 / 나가는 데이터 타입 : mediaType
	// json : application / json, text: text_plain
	@PostMapping(value= "/post",consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> post(@RequestBody CommentVO cvo){ //비동기에 있는 body를 cvo객체로 들고와줘
		log.info("cvo : "+cvo);
		int isok = csv.post(cvo);
		return isok>0? new ResponseEntity<String>("1",HttpStatus.OK):new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
							//ok는 네트워크에 200을 가져가는 것, 잘 갔다는 뜻								//잘 안갔다는 뜻 
				
	}

	@GetMapping(value="/{bno}",produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<CommentVO>> list(@PathVariable("bno")int bno){
		log.info("bno : "+bno);
		List<CommentVO> list = csv.getList(bno);
		return new ResponseEntity<List<CommentVO>>(list,HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{cnoVal}",produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> delete(@PathVariable("cnoVal")int cno){
		log.info("cno : "+cno);
		int isok = csv.delete(cno);
		return isok>0? new ResponseEntity<String>("1",HttpStatus.OK):new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping(value="/modify",consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modify(@RequestBody CommentVO cvo){
		log.info("cvo : "+cvo);
		int isok = csv.modify(cvo);
		return isok>0? new ResponseEntity<String>("1",HttpStatus.OK):new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

}
