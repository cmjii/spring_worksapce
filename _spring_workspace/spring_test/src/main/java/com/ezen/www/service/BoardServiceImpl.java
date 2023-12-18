package com.ezen.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.www.domain.BoardVO;
import com.ezen.www.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO bdao;

	@Override
	public int register(BoardVO bvo) {
		log.info("register service impl");
		return bdao.insert(bvo);
	}

	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		return bdao.selectList();
	}

	@Override
	public BoardVO getDetail(int bno) {
		bdao.readcountUpdate(bno);
		return bdao.selectDetail(bno);
	}



	@Override
	public void update(BoardVO bvo) {
		bdao.update(bvo);

	}

	@Override
	public int remove(int bno) {
		return bdao.delete(bno);
	}

	
}
