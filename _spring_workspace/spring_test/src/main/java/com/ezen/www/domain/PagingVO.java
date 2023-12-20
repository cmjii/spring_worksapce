package com.ezen.www.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class PagingVO {
	
	private int pageNo; //현재 페이지 번호
	private int qty; //한 화면에 보여줄 게시글 수(10개)
	
//	검색 라인 추가 
	private String type; //(검색에 사용되는 멤버변수) list.jsp에 있는 select의 name이 type이기 때문에 type으로 설정
	private String keyword; //검색 할 단어 
	
	
	public PagingVO() {
		this.pageNo =1;
		this.qty=10;
	}
	
	public PagingVO(int pageNo, int qty) {
		this.pageNo = pageNo;
		this.qty = qty;
	}
	
	public int getPageStart() {
		//DB상에서 limit의 시작값 구하는 메서드
		return(this.pageNo-1)*this.qty;
	}
	
	//댓글라인 추가
	//여러가지의 타입을 같이 검색하기 위해서 타입을 배열로 구분
	//getter로 반응하기 때문에 get을 반드시 붙어야함
	//get, set 뒤에 오는 단어는 무조건 대문자로 작성 (규칙임)
	public String[] getTypeToArray() {
		return this.type == null? new String[] {} : this.type.split(""); //null이면 배열 안이 비었어요, null이 아니면 한글자씩 떼ㅁ
	}
	
}
