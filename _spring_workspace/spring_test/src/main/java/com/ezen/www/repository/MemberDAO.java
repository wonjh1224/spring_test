package com.ezen.www.repository;

import com.ezen.www.domain.MemberVO;


public interface MemberDAO {

	MemberVO getUser(String id);

	int insert(MemberVO mvo);

	void last(String id);

	void update(MemberVO mvo);

	void delete(String id);

}
