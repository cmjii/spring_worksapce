package com.ezen.www.service;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ezen.www.domain.MemberVO;
import com.ezen.www.repository.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO mdao;

	@Inject
	BCryptPasswordEncoder passwordEncoder; //암호화 하는 객체
	
	@Override
	public int signUp(MemberVO mvo) {
	log.info("signUp sevice ok");
	// 아이디가 중복되면 회원가입 실패
	// => 아이디만 주고 DB에서 일치하는 mvo 객체를 리턴
	// 일치하는 유저가 있다면 가입 실패, 없다면 가입 가능
	MemberVO tempMvo = mdao.getUser(mvo.getId()); //id줄테니까 이거랑 일치하는 객체를 가져오세요.
	if(tempMvo != null) { //가져온 id가 null이 아닐 경우 == 기존 id 존재
		return 0; //0을 실패했다는 뜻으로 사용
	}
	// 아이디가 중복되지 않는다면 회원가입 진행
	// password가 null이거나 값이 없다면 가입 불가
	if(mvo.getId() == null || mvo.getId().length() ==0) {
		return 0;
	}
	if(mvo.getPw() == null || mvo.getPw().length() ==0) {
		return 0;
	}
	// 모두 다 성공하면 회원가입 진행
	// 회원가입 진행 할 때 password는 암호화하여 가입
	// 암호화 할 때 사용하는 메서드 (encode) / 입력 된 비번과 암호화 된 비번이 같은지 알 수 있는 메서드 (matches) => true/false로 리턴
	String pw = mvo.getPw();
	
	String encodePw = passwordEncoder.encode(pw); //passwordEncoder는 위에 객체 생성한 것임. 암호화 하는 객체
	mvo.setPw(encodePw); //암호화 된 비번으로 변경
	
	//회원가입
	int isok = mdao.insert(mvo);
	
		return isok;
	
	
	}

	@Override
	public MemberVO isUser(MemberVO mvo) {
		log.info("isUser sevice ok");
		
		//로그인 유저 확인
		//아이디를 주고 해당 아이디의 객체를 리턴
		MemberVO tempMvo = mdao.getUser(mvo.getId()); //회원가입 할 때 했던 메서드 호출
		
		//해당 아이디가 없는 경우
		if(tempMvo == null) {
			return null;			
		}
		
		//matches(원래 비번, 암호화 된 비번) 비교
		if(passwordEncoder.matches(mvo.getPw(), tempMvo.getPw())) {
			return tempMvo;
		}
		return null;
	}

	@Override
	public void lastLogin(String id) {
		mdao.lastLogin(id);
		
	}

	@Override
	public void update(MemberVO mvo) {
		log.info("pw :", mvo.getPw());
		log.info("name :", mvo.getName());
		if(mvo.getPw() == null) {
			
		}
		mdao.update(mvo);
		
	}

	
}
