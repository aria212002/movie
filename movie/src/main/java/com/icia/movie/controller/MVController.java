package com.icia.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.movie.dto.INFO;
import com.icia.movie.dto.REVIEW;
import com.icia.movie.dto.SCHEDULE;
import com.icia.movie.dto.SEARCH;
import com.icia.movie.service.MVService;

@Controller
public class MVController {

	@Autowired
	private MVService msvc;

	private ModelAndView mav;

	// 영화 리스트 및 상세보기

	// movie_list : 영화 페이지 이동
	@RequestMapping(value = "/movie_list", method = RequestMethod.GET)
	public ModelAndView movieChart() {

		System.out.println("\n=============== 영화 차트 페이지 이동 ===============");
		System.out.println("[1] jsp → controller");

		mav = msvc.movieChart();
		System.out.println("[5] service → controller => mav : " + mav + "\n");

		System.out.println("[5] service → controller => mav : " + mav);

		return mav;
	}

	// mvSearch : 장르로 영화 검색
	@RequestMapping(value = "/mvSearch", method = RequestMethod.GET)
	public ModelAndView mvSearch(@ModelAttribute SEARCH search) {

		System.out.println("================== 장르 검색 ==================");
		System.out.println("[1] jsp → controller : " + search);
		// 서비스로 넘어가기
		mav = msvc.mvSearch(search);

		System.out.println("[5] controller → jsp => mav : " + mav);
		return mav;
	}

	// mvhome: 홈페이지 정보 불러오기
	@RequestMapping(value = "/mvhome", method = RequestMethod.GET)
	public @ResponseBody List<INFO> mvhome() {
		List<INFO> hList = msvc.mvhome();
		return hList;
	}

	// mvDetail : 영화 상세보기
	@RequestMapping(value = "/mvDetail", method = RequestMethod.GET)
	public ModelAndView mvDetail(@RequestParam("miName") String miName) {
		System.out.println("[1] jsp → controller => miName : " + miName);

		mav = msvc.mvDetail(miName);
		System.out.println("[5] service → controller => mav : " + mav + "\n");
		return mav;
	}

	// cList : 리뷰 리스트
	@RequestMapping(value = "cList", method = RequestMethod.GET)
	public @ResponseBody List<REVIEW> cList(@RequestParam("mrName") String mrName) {
		System.out.println("[1] jsp → controller : " + mrName);
		List<REVIEW> list = msvc.cList(mrName);
		System.out.println("[5] service → controller : " + list);
		return list;
	}

	// rvWrite : 리뷰 작성
	@RequestMapping(value = "rvWrite", method = RequestMethod.GET)
	public @ResponseBody List<REVIEW> rvWrite(@ModelAttribute REVIEW review) {
		List<REVIEW> list = msvc.rvWrite(review);
		return list;
	}

	// rvModify : 리뷰 수정
	@RequestMapping(value = "rvModify", method = RequestMethod.POST)
	public @ResponseBody List<REVIEW> rvModify(@ModelAttribute REVIEW review) {
		List<REVIEW> list = msvc.rvModify(review);
		return list;
	}

	// rvDelete : 리뷰 삭제
	@RequestMapping(value = "rvDelete", method = RequestMethod.POST)
	public @ResponseBody List<REVIEW> rvDelete(@ModelAttribute REVIEW review) {
		List<REVIEW> list = msvc.rvDelete(review);
		return list;
	}

	// mrIdCheck : 리뷰 존재 여부 check
	@RequestMapping(value = "/mrIdCheck", method = RequestMethod.GET)
	public @ResponseBody String mrIdCheck(@ModelAttribute REVIEW review) {
		System.out.println("[1] jsp → controller => review : " + review);

		String check = msvc.mrIdCheck(review);

		System.out.println("[5] service → controller => check : " + check + "\n");
		return check;
	}

	// mvWriteForm : 영화 정보 작성 페이지 이동
	@RequestMapping(value = "/mvWriteForm", method = RequestMethod.GET)
	public String mvwriteForm() {
		return "movies/mvwrite";
	}

	// mvWrite : 영화 정보 작성
	@RequestMapping(value = "/mvWrite", method = RequestMethod.GET)
	public ModelAndView mvWrite(@ModelAttribute INFO info) {
		System.out.println("[1] jsp -> controller => info : " + info);

		mav = msvc.mvWrite(info);
		System.out.println("[5] service -> controller => mav: " + mav + "\n");

		return mav;
	}

	// 관리자용 영화 리스트
	@RequestMapping(value = "/mvList", method = RequestMethod.GET)
	public ModelAndView mvList() {

		System.out.println("[1] jsp → controller ");
		// 서비스로 넘어가기
		mav = msvc.mvList();

		System.out.println("[5] controller → jsp => mav : " + mav);
		return mav;
	}

	// mvModiForm : 영화 정보 수정 페이지 이동
	@RequestMapping(value = "/mvModiForm", method = RequestMethod.GET)
	public ModelAndView mvModiForm(@RequestParam("miName") String miName) {
		mav = msvc.mvModiForm(miName);
		return mav;
	}

	// mvModify : 영화 정보 수정
	@RequestMapping(value = "/mvModify", method = RequestMethod.GET)
	public ModelAndView mvModify(@ModelAttribute INFO info) {
		System.out.println("[1] jsp -> controller  " + info);
		mav = msvc.mvModify(info);
		System.out.println("[5] controller → jsp => mav : " + mav);
		return mav;
	}

	// mvDelete : 영화 정보 삭제
	@RequestMapping(value = "/mvDelete", method = RequestMethod.GET)
	public ModelAndView mvDelete(@RequestParam("miName") String miName) {
		System.out.println("[1] jsp -> controller  " + miName);
		mav = msvc.mvDelete(miName);
		return mav;
	}

	// twriteForm : 상영관 정보 작성 페이지 이동
	@RequestMapping(value = "/twriteForm", method = RequestMethod.GET)
	public String twriteForm() {
		return "movies/twrite";
	}

	// tWrite : 상영관 정보 작성
	@RequestMapping(value = "/tWrite", method = RequestMethod.GET)
	public ModelAndView tWrite(@ModelAttribute SCHEDULE schedule) {
		System.out.println("\n================ 회원가입 ==================");
		System.out.println("[1] jsp -> controller => teater : " + schedule);

		mav = msvc.tWrite(schedule);
		System.out.println("[5] service -> controller => mav: " + mav + "\n");

		return mav;
	}

	// tList 상영관 리스트
	@RequestMapping(value = "/tList", method = RequestMethod.GET)
	public ModelAndView tList() {

		System.out.println("[1] jsp → controller ");
		// 서비스로 넘어가기
		mav = msvc.tList();

		System.out.println("[5] controller → jsp => mav : " + mav);
		return mav;
	}

	// tDetail : 상영관 상세보기
	@RequestMapping(value = "/tDetail", method = RequestMethod.GET)
	public ModelAndView tDetail(@RequestParam("mtTheater") String mtTheater) {
		System.out.println("[1] jsp -> controller => board : ");
		mav = msvc.tDetail(mtTheater);
		System.out.println("[5] controller → jsp => mav : " + mav);
		return mav;
	}

	// tModiForm : 상영관 수정 페이지 이동
	@RequestMapping(value = "/tModiForm", method = RequestMethod.GET)
	public ModelAndView tModiForm(@RequestParam("mtTheater") String mtTheater) {
		mav = msvc.tModiForm(mtTheater);
		return mav;
	}

	// tModify : 상영관 정보 수정
	@RequestMapping(value = "/tModify", method = RequestMethod.GET)
	public ModelAndView tModify(@ModelAttribute SCHEDULE schedule) {
		System.out.println("[1] jsp -> controller  " + schedule);
		mav = msvc.tModify(schedule);
		System.out.println("[5] controller → jsp => mav : " + mav);
		return mav;
	}

	// tDelete : 상영관 삭제
	@RequestMapping(value = "/tDelete", method = RequestMethod.GET)
	public ModelAndView tDelete(@RequestParam("mtTheater") String mtTheater) {
		System.out.println("[1] jsp -> controller  " + mtTheater);
		mav = msvc.tDelete(mtTheater);
		return mav;
	}

	// sWriteForm : 스케쥴 작성 페이지 이동
	@RequestMapping(value = "/sWriteForm", method = RequestMethod.GET)
	public ModelAndView sWriteForm(@RequestParam("miName") String miName) {
		mav = msvc.sWriteForm(miName);
		return mav;
	}

	// sWrite : 스케쥴 작성
	@RequestMapping(value = "/sWrite", method = RequestMethod.GET)
	public ModelAndView sWrite(@ModelAttribute SCHEDULE schedule) {
		System.out.println("\n================ 회원가입 ==================");
		System.out.println("[1] jsp -> controller => teater : " + schedule);

		mav = msvc.sWrite(schedule);
		System.out.println("[5] service -> controller => mav: " + mav + "\n");

		return mav;
	}

	// sView : 스케쥴 상세보기
	@RequestMapping(value = "/sView", method = RequestMethod.GET)
	public ModelAndView sView(@RequestParam("msNumber") int msNumber) {
		System.out.println("[1] jsp -> controller => board : " + msNumber);
		mav = msvc.sView(msNumber);
		System.out.println("[5] controller → jsp => mav : " + mav);
		return mav;
	}

	// sModiForm : 스케쥴 수정페이지로 이동
	@RequestMapping(value = "/sModiForm", method = RequestMethod.GET)
	public ModelAndView tModify(@RequestParam("msNumber") int msNumber) {
		System.out.println("[1] jsp -> controller  " + msNumber);
		mav = msvc.sModiForm(msNumber);
		System.out.println("[5] controller → jsp => mav : " + mav);
		return mav;
	}

	// sModify : 스케쥴 수정
	@RequestMapping(value = "/sModify", method = RequestMethod.GET)
	public ModelAndView sModify(@ModelAttribute SCHEDULE schedule) {
		System.out.println("[1] jsp -> controller  " + schedule);
		mav = msvc.sModify(schedule);
		System.out.println("[5] controller → jsp => mav : " + mav);
		return mav;
	}

	// sDelete : 스케쥴 삭제
	@RequestMapping(value = "/sDelete", method = RequestMethod.GET)
	public ModelAndView sDelete(@RequestParam("msNumber") int msNumber) {
		System.out.println("[1] jsp -> controller  " + msNumber);
		mav = msvc.sDelete(msNumber);
		return mav;
	}

	// sList : 스케쥴 리스트
	@RequestMapping(value = "/sList", method = RequestMethod.GET)
	public ModelAndView sList(@RequestParam("miName") String miName) {
		System.out.println("[1] jsp -> controller => board : " + miName);
		mav = msvc.sList(miName);
		System.out.println("[5] controller → jsp => mav : " + mav);
		return mav;
	}

	// sList2 : 스케쥴 리스트 상영관 이름으로
	@RequestMapping(value = "/sList2", method = RequestMethod.GET)
	public ModelAndView sList2(@RequestParam("mtTheater") String mtTheater) {
		System.out.println("[1] jsp -> controller => board : " + mtTheater);
		mav = msvc.sList2(mtTheater);
		System.out.println("[5] controller → jsp => mav : " + mav);
		return mav;
	}

	// tiketingList : 내 예매 내역
	@RequestMapping(value = "/ticketingList", method = RequestMethod.GET)
	public ModelAndView ticketingList(@RequestParam("mbId") String mbId) {
		System.out.println("[1] jsp -> controller  " + mbId);
		mav = msvc.ticketingList(mbId);
		System.out.println("[5] controller → jsp => mav : " + mav);
		return mav;
	}

	// adminTicketList : 관리자 예약 관리
	@RequestMapping(value = "/adminTicketList", method = RequestMethod.GET)
	public ModelAndView adminTicketList(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		mav = msvc.adminTicketList(page);
		return mav;
	}

	// adtSearch : 예약 관리 검색
	@RequestMapping(value = "/adtSearch", method = RequestMethod.GET)
	public ModelAndView adtSearch(@ModelAttribute SEARCH search) {
		mav = msvc.adtSearch(search);
		return mav;
	}

}
