package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.BoardVO;

public interface BoardService {

	int insert(BoardVO bvo);

	List<BoardVO> getlist();

	BoardVO detail(int bno);

	int modify(BoardVO bvo);

	int delete(int bno);

}
