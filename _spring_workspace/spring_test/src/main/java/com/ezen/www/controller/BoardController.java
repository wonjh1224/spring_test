package com.ezen.www.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.www.domain.BoardVO;
import com.ezen.www.domain.PagingVO;
import com.ezen.www.handler.PagingHandler;
import com.ezen.www.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {
	
	@Inject
	private BoardService bsv;
	
	//경로와 리턴의 값이 같을경우 생략가능 
	// /board/register => /board/register	
	@GetMapping("/register")
	public void register() {
		
	}
	
	//@RequestParam("writer")String writer : 파라미터 받을 때
	@PostMapping("/register")
	public String register(BoardVO bvo) {
		log.info(">>> bvo >>>" + bvo);
		int isOk = bsv.register(bvo);
		//목적지 경로
		return "redirect:/board/list";
	}
	
	// /board/list => /board/list
	@GetMapping("/list")
	public String list(Model m, PagingVO pgvo) {

		log.info("pgvo : {}", pgvo);
		//리턴타입은 목적지 경로에 대한 타입(destPage가 리턴타입이라고 생각)
		//Model 객체 => setAttribute 역할을 하는 객체
		m.addAttribute("list", bsv.getList(pgvo));
		
		//ph 객체 생성 (pvgo, totalCount)
		int totalCount = bsv.getTotalCount();
		log.info("전체 게시글 수:{}", totalCount);
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		m.addAttribute("ph", ph);
		
		
		return "/board/list";
	}
	
	@GetMapping({"/detail", "/modify"})
	public void detail(Model m, @RequestParam("bno") int bno) {
		log.info("bno >>> "+bno);
		m.addAttribute("bvo", bsv.getDetail(bno));
		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo) {
		log.info(">>> bvo >>> " + bvo);
		//update
		bsv.modify(bvo);
		
		return "redirect:/board/detail?bno="+bvo.getBno();
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") int bno, RedirectAttributes re) {
		log.info(" bno>>> "+ bno);
		int isOk = bsv.remove(bno);
		//페이지가 새로고침 될 때 남아있을 필요가 없는 데이터
		//리다이렉트 될 때 데이터를 보내는 객체(RedirectAttribute)
		//한번만 일회성으로 데이터 보낼 때 사용 
		re.addFlashAttribute("isDel", isOk);
		return "redirect:/board/list";
	}
	
	
	
	
	
}
