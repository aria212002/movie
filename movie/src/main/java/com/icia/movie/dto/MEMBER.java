package com.icia.movie.dto;

import lombok.Data;

@Data
public class MEMBER{
		
	private String mbId;			// 아이디
	private String mbPw;		// 비밀번호
	private String mbName;		// 이름
	private String mbGender;		// 성별
	private String mbBirth;		// 생년월일
	private String mbAddr;		// 주소
	private String mbPhone;		// 연락처
	private String mbEmail;		// 이메일
	
	private String addr1;	// 우편번호
	private String addr2;	// 주소
	private String addr3;	// 상세주소
}
