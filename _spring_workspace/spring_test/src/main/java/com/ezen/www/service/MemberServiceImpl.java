package com.ezen.www.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
	HttpServletRequest request;
	
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
	public int update(MemberVO mvo) {
		//pw의 여부에 따라서 변경사항을 나누어 처리
		//pw가 없다면 기존값으로 설정 / pw가 있다면 암호화 처리하여 변경
		if(mvo.getPw() == null || mvo.getPw().length()==0) {
			MemberVO sesMvo = (MemberVO) request.getSession().getAttribute("ses"); //HttpServletRequest request는 위에 의존성 주입으로 추가 (컨트롤러도 마찬가지)
			mvo.setPw(sesMvo.getPw());
		}else {
			String setpw = passwordEncoder.encode(mvo.getPw());
			mvo.setPw(setpw);
		}
		log.info("수정 후 mvo : {}",mvo);
		
		return mdao.update(mvo);
		
	}

	@Override
	public int remove(MemberVO mvo) {
		
		return mdao.remove(mvo);
	}

	
}
