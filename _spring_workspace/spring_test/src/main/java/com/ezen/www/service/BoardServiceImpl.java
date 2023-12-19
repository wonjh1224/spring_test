package com.ezen.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.www.domain.BoardVO;
import com.ezen.www.domain.PagingVO;
import com.ezen.www.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO bdao;

	@Override
	public int register(BoardVO bvo) {
		log.info("register serviceImpl");
		return bdao.insert(bvo);
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		log.info("list serviceImpl");
		return bdao.selectList(pgvo);
	}

	@Override
	public Object getDetail(int bno) {
		log.info("detail serviceImpl");
		bdao.readCount(bno);
		return bdao.selectOne(bno);
	}

	@Override
	public void modify(BoardVO bvo) {
		log.info("modify serviceImpl");
		bdao.update(bvo);
		
	}

	@Override
	public int remove(int bno) {
		log.info("remove serviceImpl");
		return bdao.delete(bno);
	}

	@Override
	public int getTotalCount() {
		
		return bdao.getTotalCount();
	}
}
