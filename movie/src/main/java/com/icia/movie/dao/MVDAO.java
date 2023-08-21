package com.icia.movie.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.movie.dto.INFO;
import com.icia.movie.dto.PAGING;
import com.icia.movie.dto.REVIEW;
import com.icia.movie.dto.SCHEDULE;
import com.icia.movie.dto.SEARCH;
import com.icia.movie.dto.TICKETING;

@Repository
public class MVDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// 영화 정보 작성
	public int mvWrite(INFO info) {
		System.out.println("[3] service -> DAO : " + info);
		return sql.insert("Movie.mvWrite", info);
	}

	// 영화 리스트
	public List<INFO> mvList() {
		System.out.println("[3] service -> DAO : ");
		return sql.selectList("Movie.mvList");
	}

	// 영화 수정
	public int mvModify(INFO info) {
		System.out.println("[3] service → dao " + info);
		return sql.update("Movie.mvModify", info);
	}

	// 영화 삭제
	public int mvDelete(String miName) {
		System.out.println("[3] controller → service " + miName);
		return sql.delete("Movie.mvDelete", miName);
	}

	// 영화 리스트 및 상세보기

	public List<INFO> movieChart() {
		System.out.println("[3] service → dao");
		return sql.selectList("Movie.movieChart");
	}

	// mvDetail : 영화 상세보기
	public INFO mvDetail(String miName) {
		System.out.println("[3] service → dao => miName : " + miName);
		return sql.selectOne("Movie.mvDetail", miName);
	}

	// 장르 검색
	public List<INFO> mvSearch(SEARCH search) {
		System.out.println("[3] service -> DAO : " + search);
		return sql.selectList("Movie.mvSearch", search);
	}

	public int bCount() {
		return sql.selectOne("Movie.bCount");
	}

	// cList : 리뷰 리스트
	public List<REVIEW> cList(String mrName) {
		System.out.println("[3] service → dao");
		return sql.selectList("Movie.cList", mrName);
	}

	// rvWrite : 리뷰 작성
	public void rvWrite(REVIEW review) {
		sql.insert("Movie.rvWrite", review);

	}

	// rvModify : 리뷰 수정
	public void rvModify(REVIEW review) {
		sql.update("Movie.rvModify", review);

	}

	// rvDelete : 리뷰 삭제
	public void rvDelete(REVIEW review) {
		sql.delete("Movie.rvDelete", review);

	}

	// 리뷰 아이디 체크
	public int mrIdCheck(REVIEW review) {
		return sql.selectOne("Movie.mrIdCheck", review);
	}

	// 상영관 작성
	public int tWrite(SCHEDULE theater) {
		System.out.println("[3] service -> DAO : " + theater);
		return sql.insert("Movie.tWrite", theater);
	}

	// 상영관 리스트
	public List<SCHEDULE> tList() {
		return sql.selectList("Movie.tList");
	}

	// 상영관 상세보기
	public SCHEDULE tDetail(String mtTheater) {
		return sql.selectOne("Movie.tDetail", mtTheater);
	}

	// 상영관 수정
	public int tModify(SCHEDULE schedule) {
		return sql.update("Movie.tModify", schedule);
	}

	// 상영관 삭제
	public int tDelete(String mtTheater) {
		return sql.delete("Movie.tDelete", mtTheater);
	}

	// 스케쥴 작성
	public int sWrite(SCHEDULE schedule) {
		System.out.println("[3] service -> DAO : " + schedule);
		return sql.insert("Movie.sWrite", schedule);
	}

	// 스케쥴 상세보기
	public SCHEDULE sView(int msNumber) {
		System.out.println("[3] service -> DAO : " + msNumber);
		return sql.selectOne("Movie.sView", msNumber);
	}

	// 스케쥴 번호로 정보 불러오기
	public SCHEDULE snView(int msNumber) {
		System.out.println("[3] service -> DAO : " + msNumber);
		return sql.selectOne("Movie.snView", msNumber);
	}

	// 스케쥴 수정
	public int sModify(SCHEDULE schedule) {
		System.out.println("[3] service -> DAO : " + schedule);
		return sql.update("Movie.sModify", schedule);
	}

	// 스케쥴 리스트 상영관 이름으로
	public List<SCHEDULE> sList2(String mtTheater) {
		return sql.selectList("Movie.sList2", mtTheater);
	}

	// 스케쥴 삭제
	public int sDelete(int msNumber) {
		return sql.delete("Movie.sDelete", msNumber);
	}

	// 스케쥴 리스트
	public List<SCHEDULE> sList(String miName) {
		return sql.selectList("Movie.sList", miName);
	}

	// tiketingList : 내 예매 내역 확인
	public List<TICKETING> ticketingList(String mbId) {
		System.out.println(mbId);
		return sql.selectList("ticketing.ticketingList", mbId);
	}

	// 전체 예약 내역 갯수
	public int adtCount() {
		return sql.selectOne("ticketing.adtCount");
	}

	// 관리자탭 예약 내역
	public List<TICKETING> adminTicketList(PAGING paging) {
		return sql.selectList("ticketing.adminTicketList", paging);
	}

	// 예약 관리 검색
	public List<TICKETING> adtSearch(SEARCH search) {
		return sql.selectList("ticketing.adtSearch", search);
	}
}
