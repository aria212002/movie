package com.icia.movie.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class COMMENT {
	private int cmNum;			// 댓글번호
	private int cmbNum;			// 게시글 번호
	private String cmWriter;		// 댓글 작성자
	private String cmContent;	// 댓글 내용
	private Date cmDate;			// 댓글 작성일
}
