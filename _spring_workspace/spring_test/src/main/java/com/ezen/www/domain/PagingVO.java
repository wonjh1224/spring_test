package com.ezen.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class PagingVO {

	private int pageNo; //현재 페이지 넘버
	private int qty;    //한 페이지 게시글 수
	
	public PagingVO() {
		this.pageNo = 1;
		this.qty = 10;
	}
	
	public int getPageStart() {
		//DB상에서 limit의 시작값 구하는 메서드
		return(this.pageNo-1)*this.qty;
	}
	
}
