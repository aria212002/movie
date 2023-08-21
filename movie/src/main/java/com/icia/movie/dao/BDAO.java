package com.icia.movie.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.movie.dto.BOARD;
import com.icia.movie.dto.COMMENT;
import com.icia.movie.dto.PAGING;

@Repository
public class BDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// 게시글 작성
	public int bdWrite(BOARD board) {
		return sql.insert("Board.bdWrite", board);
	}

	// 전체 게시글 갯수
	public int bdCount() {
		return sql.selectOne("Board.bdCount");
	}

	// 게시글 목록
	public List<BOARD> bdList(PAGING paging) {
		return sql.selectList("Board.bdList", paging);
	}

	// 게시글 보기
	public BOARD bdView(int bdNum) {
		return sql.selectOne("Board.bdView", bdNum);
	}

	// 게시글 수정
	public int bdModify(BOARD board) {
		return sql.update("Board.bdModify", board);
	}

	// 게시글 삭제
	public int bdDelete(int bdNum) {
		return sql.delete("Board.bdDelete", bdNum);
	}

	// 댓글 입력
	public void cmWrite(COMMENT comment) {
		sql.insert("COMMENT.cmWrite", comment);
	}

	// 댓글 목록
	public List<COMMENT> cmList(int cmbNum) {
		return sql.selectList("COMMENT.cmList", cmbNum);
	}

	// 댓글 수정
	public void cmModify(COMMENT comment) {
		System.out.println("[3] service → dao => comment : " + comment);
		sql.update("COMMENT.cmModify", comment);
	}

	// 댓글 삭제
	public void cmDelete(COMMENT comment) {
		System.out.println("[3] service → dao => comment : " + comment);
		sql.delete("COMMENT.cmDelete", comment);
	}

}
