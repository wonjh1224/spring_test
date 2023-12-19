package com.ezen.www.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.www.domain.MemberVO;
import com.ezen.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	private MemberService msv;
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(MemberVO mvo) {
		log.info("mvo > {} ",mvo);
		int isOk = msv.signUp(mvo);
		log.info(isOk>0?"ok":"fail");
		
		return "index";
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/login")
	public String login(MemberVO mvo, Model m, HttpServletRequest request) {
		log.info("mvo > {} ",mvo);
		//mvo 객체가 db에 값과 일치하는지 체크
		MemberVO loginMvo = msv.isUser(mvo);
		
		if(loginMvo != null) {
			//로그인 성공시
			HttpSession ses = request.getSession();
			ses.setAttribute("ses", loginMvo); //session에 로그인 객체 저장
			ses.setMaxInactiveInterval(60*15); //로그인 유지시간
			log.info("{}",ses.getAttribute("ses"));
			
			MemberVO lastLogin = (MemberVO)request.getSession().getAttribute("ses");
			msv.lastLogin(lastLogin.getId());
			
		}else {
			//로그인 실패시
			m.addAttribute("msg_login", "1");
		}
		return "index";
	}
	
	//세션 삭제, 끊기 메서드
	public void sessionOut(HttpServletRequest request) {
		request.getSession().removeAttribute("ses"); //삭제
		request.getSession().invalidate(); //끊기
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, Model m) {
		//세션 객체 삭제 => 세션 끊기
//		request.getSession().removeAttribute("ses"); //삭제
//		request.getSession().invalidate(); //끊기
		sessionOut(request);
		m.addAttribute("msg_logout", "1");
		
		return "index";
	}
	
	
	@GetMapping("/detail")
	public void detail() {
		
	}

	@PostMapping("/modify")
	public String modify(MemberVO mvo, RedirectAttributes re) {
		log.info("mvo > {}", mvo);
		msv.modify(mvo);
		re.addFlashAttribute("msg_modify", "1");
		return "redirect:/member/logout";
	}
	
	@PostMapping("/delete")
	public String modify(HttpServletRequest request, RedirectAttributes re) {
		
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("ses");
		String id = mvo.getId();
		msv.remove(id);
		
		re.addFlashAttribute("msg_delete", "1");
		
		return "redirect:/member/logout";
	}
	
	
	
	
}
