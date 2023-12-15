package com.ezen.www.repository;

import java.util.List;

import com.ezen.www.domain.BoardVO;

public interface BoardDAO{

	int insert(BoardVO bvo);

	List<BoardVO> selectList();

	BoardVO selectDetail(int bno);

	int readcountUpdate(int bno);

	int modify(int bno);


	
}
