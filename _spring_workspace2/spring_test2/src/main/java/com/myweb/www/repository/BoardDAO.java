package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> getlist();

	BoardVO detail(int bno);

	int modify(BoardVO bvo);

	int delete(int bno);

	int readcount(int bno);

}
