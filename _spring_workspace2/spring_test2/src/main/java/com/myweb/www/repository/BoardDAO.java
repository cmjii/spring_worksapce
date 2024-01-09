package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> getlist(PagingVO pgvo);

	BoardVO detail(int bno);

	int modify(BoardVO bvo);

	int delete(int bno);

	int readcount(int bno);

}
