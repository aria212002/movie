package com.icia.movie.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.movie.dto.MEMBER;
import com.icia.movie.dto.PAGING;
import com.icia.movie.dto.SEARCH;

@Repository
public class MDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// 아이디 중복 체크
	public String idCheck(String mbId) {
		return sql.selectOne("Member.idCheck", mbId);
	}

	// 회원가입
	public int mJoin(MEMBER member) {
		return sql.insert("Member.mJoin", member);
	}

	// 로그인
	public String mLogin(String mbId) {
		return sql.selectOne("Member.mLogin", mbId);
	}

	// 전체 게시글 갯수
	public int mCount() {
		return sql.selectOne("Member.mCount");
	}

	// 회원목록
	public List<MEMBER> mList(PAGING paging) {
		return sql.selectList("Member.mList", paging);
	}

	// 회원상세보기
	public MEMBER mView(String mbId) {
		return sql.selectOne("Member.mView", mbId);
	}

	// 회원수정
	public int mModify(MEMBER member) {
		return sql.update("Member.mModify", member);
	}

	// 회원삭제
	public int mDelete(String mbId) {
		return sql.delete("Member.mDelete", mbId);
	}

	// 회원검색
	public List<MEMBER> mSearch(SEARCH search) {
		return sql.selectList("Member.mSearch", search);
	}

	// 아이디 찾기
	public String mFindId(MEMBER member) {
		return sql.selectOne("Member.mFindId", member);
	}

	// 비밀번호 변경
	public void mChangePassword(MEMBER member) {
		sql.update("Member.mChangePassword", member);
	}
	
	// 아이디 존재 확인
	public String idCheck2(String mbId) {
		return sql.selectOne("Member.idCheck2", mbId);
	}

}
