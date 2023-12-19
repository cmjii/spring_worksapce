package com.ezen.www.repository;

import java.util.List;

import com.ezen.www.domain.BoardVO;
import com.ezen.www.domain.PagingVO;

public interface BoardDAO{

	int insert(BoardVO bvo);

	List<BoardVO> selectList(PagingVO pgvo);

	BoardVO selectDetail(int bno);

	int readcountUpdate(int bno);

	void update(BoardVO bvo);

	int delete(int bno);

	int getTotalCount();


	
}
