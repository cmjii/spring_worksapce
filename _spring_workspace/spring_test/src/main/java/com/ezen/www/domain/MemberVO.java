package com.ezen.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@ToString
@Getter
public class MemberVO {

	private String id;
	private String pw;
	private String name;
	private String email;
	private String home;
	private String reg_date;
	private String last_login;
	private int age;
	
}
