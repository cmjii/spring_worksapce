package com.ezen.www.service;

import java.util.List;

import com.ezen.www.domain.BoardVO;

public interface BoardService {

	int register(BoardVO bvo);

	//Object getList(); //변수에 넣어서 온게 아니게 때문에 오브젝트가 된것.
	List<BoardVO> getList();

	BoardVO getDetail(int bno);

	int modify(int bno); 
}
