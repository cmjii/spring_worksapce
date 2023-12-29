package com.ezen.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.www.domain.BoardDTO;
import com.ezen.www.domain.BoardVO;
import com.ezen.www.domain.CommentVO;
import com.ezen.www.domain.FileVO;
import com.ezen.www.domain.PagingVO;
import com.ezen.www.repository.BoardDAO;
import com.ezen.www.repository.CommentDAO;
import com.ezen.www.repository.FileDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO bdao;
	@Inject
	private FileDAO fdao;
	@Inject
	private CommentDAO cdao;
	@Override
	public int register(BoardDTO bdto) {
		log.info("register service impl");
		//기존 보드 내용을 DB에 저장
		int isok= bdao.insert(bdto.getBvo());
		if(bdto.getFlist() == null) {
			//파일의 값이 없다면..
			isok *=1; //그냥 성공한 걸로 처리
		}else {
			//파일저장
			if(isok>0 && bdto.getFlist().size()>0) {
				//fvo는 bno가 아직 설정되기 전
				//현재 BoardDTO 시점에서는 아직 bno가 생성되지 않음
				//insert를 통해 자동 생성 -> DB에서 검색해서 가져오기
				int bno = bdao.selectBno();
				for(FileVO fvo : bdto.getFlist()) {
					fvo.setBno(bno);
					//파일 저장
					isok *= fdao.insertFile(fvo);
				}
			}
		}
		return isok;
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		// TODO Auto-generated method stub
		int isok = bdao.updateCommentCount();
		if(isok== 0) {
			log.info("updateCommentCoount error");
		}
		int isokf = bdao.updateFileCount();
		if(isok== 0) {
			log.info("updateFileCount error");
		}
		return bdao.selectList(pgvo);
	}

	@Override
	public BoardDTO getDetail(int bno) {
		bdao.readcountUpdate(bno);
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setBvo(bdao.getDetail(bno)); //게시글 내용 채우기
		boardDTO.setFlist(fdao.getFileList(bno)); //bno에 해당하는 모든 파일 리스트 검색
		return boardDTO;
	}



	@Override
	public void update(BoardDTO bdto) {
		int isok = bdao.update(bdto.getBvo());
		if(bdto.getFlist()==null) {
			isok *=1; //이미 처리 된것과 같은 효과 (리턴으로 빼버려도 됨)
		}else {
			if(isok>0 && bdto.getFlist().size()>0) {
				int bno = bdto.getBvo().getBno();
				for(FileVO fvo : bdto.getFlist()) {
					fvo.setBno(bno);
					isok *= fdao.insertFile(fvo);
				}
			}
		}

	}

	@Override
	public int remove(int bno) {
		return bdao.delete(bno);
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return bdao.getTotalCount(pgvo);
	}

	@Override
	public int fileremove(String uuid) {
		// TODO Auto-generated method stub
		return fdao.delete(uuid);
	}

	
}
