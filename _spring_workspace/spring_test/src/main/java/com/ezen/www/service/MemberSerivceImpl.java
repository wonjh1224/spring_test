package com.ezen.www.service;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ezen.www.domain.MemberVO;
import com.ezen.www.repository.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberSerivceImpl implements MemberService {

	@Inject
	private MemberDAO mdao;

	@Inject
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public int signUp(MemberVO mvo) {
		log.info("register service");
		// 아이디가 중복되면 회원가입 실패
		// => 아이디만 주고 DB에서 일치하는 mvo 객체를 리턴
		// 일치하는 유저가 있다면 가입 실패, 없다면 가입 가능
		MemberVO tempMvo = mdao.getUser(mvo.getId());
		if (tempMvo != null) {
			// 기존 아이디가 있는 경우
			return 0;

		}

		// 아이디가 중복되지 않는다면 회원가입 진행
		// password가 null이거나 값이 없다면 가입불가
		if (mvo.getId() == null || mvo.getId().length() == 0) {
			return 0;
		}
		if (mvo.getPw() == null || mvo.getPw().length() == 0) {
			return 0;
		}

		// 회원가입 진행
		// password는 암호화 하여 가입
		// 암호화(encode) / matches(입력된 비번, 암호화된 비번) 맞다면 true, false
		String pw = mvo.getPw();
		String encodePw = passwordEncoder.encode(pw);
		mvo.setPw(encodePw);

		// 회원가입
		int isOk = mdao.insert(mvo);

		return isOk;
	}

	@Override
	public MemberVO isUser(MemberVO mvo) {
		log.info("login service");
		// 로그인 유저 확인
		// 아이디를 주고 해당 아이디의 객체를 리턴
		MemberVO tmpMvo = mdao.getUser(mvo.getId()); // 회원가입할 때 했던 메서드 호출

		// 해당 아이디가 없는 경우
		if (tmpMvo == null) {
			return null;
		}
		// matches(원래비번, 암호화된 비번) 비교
		if (passwordEncoder.matches(mvo.getPw(), tmpMvo.getPw())) {
			return tmpMvo;
		}
		return null;
	}

	@Override
	public void lastLogin(String id) {
		mdao.last(id);

	}

	@Override
	public void modify(MemberVO mvo) {

		if (mvo.getPw() == null || mvo.getPw().length() == 0) {
			MemberVO tmpvo = mdao.getUser(mvo.getId());
			mvo.setPw(tmpvo.getPw());
			mdao.update(mvo);
		} else {
			String pw = mvo.getPw();
			String encodePw = passwordEncoder.encode(pw);
			mvo.setPw(encodePw);
			mdao.update(mvo);
		}

	}

	@Override
	public void remove(String id) {
		log.info("remove check service");
		mdao.delete(id);
	}

}
