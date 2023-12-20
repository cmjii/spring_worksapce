package com.ezen.www.service;

import java.util.List;

import com.ezen.www.domain.BoardVO;
import com.ezen.www.domain.PagingVO;

public interface BoardService {

	int register(BoardVO bvo);

	//Object getList(); //변수에 넣어서 온게 아니게 때문에 오브젝트가 된것.
	List<BoardVO> getList(PagingVO pgvo);

	BoardVO getDetail(int bno);


	void update(BoardVO bvo);

	int remove(int bno);

	int getTotalCount(PagingVO pgvo); 
}
