package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.repository.BoardDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{

	private final BoardDAO bdao;

	@Override
	public int insert(BoardVO bvo) {
		log.info("insert service ok");
		return bdao.insert(bvo);
	}

	@Override
	public List<BoardVO> getlist(PagingVO pgvo) {
		log.info("insert service ok");
		return bdao.getlist(pgvo);
	}

	@Override
	public BoardVO detail(int bno) {
		log.info("detail service ok");
		int isok = bdao.readcount(bno);
		return bdao.detail(bno);
	}

	@Override
	public int modify(BoardVO bvo) {
		log.info("detail service ok");
		return bdao.modify(bvo);
		
	}

	@Override
	public int delete(int bno) {
		log.info("delete service ok");
		return bdao.delete(bno);
	}
	
}
