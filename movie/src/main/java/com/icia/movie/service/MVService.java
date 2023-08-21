package com.icia.movie.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.movie.dao.MVDAO;
import com.icia.movie.dto.INFO;
import com.icia.movie.dto.PAGING;
import com.icia.movie.dto.REVIEW;
import com.icia.movie.dto.SCHEDULE;
import com.icia.movie.dto.SEARCH;
import com.icia.movie.dto.TICKETING;

@Service
public class MVService {

	private ModelAndView mav;

	@Autowired
	private MVDAO mvdao;

	@Autowired
	HttpServletRequest request;

	@Autowired
	private HttpSession session;

	// 영화 정보 작성
	public ModelAndView mvWrite(INFO info) {
		System.out.println("[2] controller → service ");
		mav = new ModelAndView();

		int result = mvdao.mvWrite(info);

		if (result > 0) {
			mav.setViewName("redirect:movie_list");
		} else {
			mav.setViewName("movies/mvwrite");
		}

		return mav;
	}

	// 영화 리스트
	public ModelAndView mvList() {
		System.out.println("[2] controller → service ");
		mav = new ModelAndView();

		List<INFO> info = mvdao.mvList();
		System.out.println("[4] info" + info);
		mav.addObject("mvlist", info);
		mav.setViewName("movies/list");
		return mav;
	}

	// 영화 정보 수정 페이지 이동
	public ModelAndView mvModiForm(String miName) {
		mav = new ModelAndView();
		INFO info = mvdao.mvDetail(miName);

		mav.setViewName("movies/mvmodify");
		mav.addObject("mvmodify", info);
		return mav;
	}

	// 영화 정보 수정
	public ModelAndView mvModify(INFO info) {
		System.out.println("[2] controller → service ");
		mav = new ModelAndView();

		int result = mvdao.mvModify(info);

		if (result > 0) {
			mav.setViewName("redirect:mvList");
		} else {
			mav.setViewName("redirect:mvList");
		}

		return mav;

	}

	// 영화 정보 삭제
	public ModelAndView mvDelete(String miName) {
		mav = new ModelAndView();
		System.out.println("[2] controller → service " + miName);

		int result = mvdao.mvDelete(miName);

		if (result > 0) {
			mav.setViewName("redirect:mvList");
			
		} else {
			mav.setViewName("redirect:mvList");

		}

		return mav;
	}

	// movieChart : 영화 차트 페이지
	public ModelAndView movieChart() {
		mav = new ModelAndView();
		System.out.println("[2] controller → service");
		List<INFO> mList = mvdao.movieChart();

		mav.addObject("mList", mList);

		mav.setViewName("movies/movies-list");

		System.out.println("[4] dao → service => mList : " + mList);
		return mav;
	}

	// mvSearch : 장르로 영화 검색
		public ModelAndView mvSearch(SEARCH search) {
			System.out.println("[2] controller → service :" + search);
			mav = new ModelAndView();

			List<INFO> info = mvdao.mvSearch(search);
			System.out.println("[4] dao → service => " + info);
			mav.addObject("mList", info);
			mav.addObject("keyword", search.getKeyword());
			mav.setViewName("movies/movies-list");
			return mav;
		}

	// mvhome : 홈페이지 정보 불러오기
	public List<INFO> mvhome() {
		List<INFO> hList = mvdao.movieChart();
		return hList;
	}

	// mvDetail : 영화 상세보기
	public ModelAndView mvDetail(String miName) {
		mav = new ModelAndView();
		System.out.println("[2] controller → service => miName : " + miName);

		INFO info = mvdao.mvDetail(miName);

		mav.addObject("view", info);
		mav.setViewName("movies/movieView");
		System.out.println("[4] dao → service => info : " + info);

		return mav;
	}

	// cList : 리뷰 리스트
	public List<REVIEW> cList(String mrName) {

		System.out.println("[2] controller → service : " + mrName);

		List<REVIEW> list = mvdao.cList(mrName);

		System.out.println("[4] dao → service => list : " + list);
		return list;
	}

	// rvWrite : 리뷰 작성
	public List<REVIEW> rvWrite(REVIEW review) {
		try {
			mvdao.rvWrite(review);
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<REVIEW> list = mvdao.cList(review.getMrName());

		return list;
	}

	// rvModify : 리뷰 수정
	public List<REVIEW> rvModify(REVIEW review) {
		try {
			mvdao.rvModify(review);
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<REVIEW> list = mvdao.cList(review.getMrName());

		return list;
	}

	// rvDelete : 리뷰 삭제
	public List<REVIEW> rvDelete(REVIEW review) {
		try {
			mvdao.rvDelete(review);
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<REVIEW> list = mvdao.cList(review.getMrId());

		return list;
	}

	// 리뷰 아이디 체크
	public String mrIdCheck(REVIEW review) {

		String check = null;

		int result = mvdao.mrIdCheck(review);

		if (result > 0) {
			check = "OK";
		} else {
			check = "NO";
		}

		System.out.println(check);
		return check;
	}

	// 상영관 작성
	public ModelAndView tWrite(SCHEDULE schedule) {
		System.out.println("[2] controller → service ");
		mav = new ModelAndView();

		int result = mvdao.tWrite(schedule);

		if (result > 0) {
			mav.setViewName("redirect:tList");
		} else {
			mav.setViewName("movies/swrite");
		}

		return mav;
	}

	// 상영관 리스트
	public ModelAndView tList() {
		System.out.println("[2] controller → service ");
		mav = new ModelAndView();

		List<SCHEDULE> schedule = mvdao.tList();
		System.out.println("[4] info" + schedule);
		mav.addObject("tlist", schedule);
		mav.setViewName("movies/tlist");
		return mav;
	}

	// 상영관 상세보기
	public ModelAndView tDetail(String mtTheater) {
		System.out.println("[2] controller → service ");
		mav = new ModelAndView();

		SCHEDULE schedule = mvdao.tDetail(mtTheater);
		System.out.println("[4] dao → service board : " + mtTheater);

		mav.setViewName("movies/tview");
		mav.addObject("tView", schedule);

		return mav;
	}

	// 상영관 수정 페이지 이동
	public ModelAndView tModiForm(String mtTheater) {
		mav = new ModelAndView();
		SCHEDULE schedule = mvdao.tDetail(mtTheater);

		mav.setViewName("movies/tmodify");
		mav.addObject("tmodify", schedule);
		return mav;
	}

	// 상영관 정보 수정
	public ModelAndView tModify(SCHEDULE schedule) {
		System.out.println("[2] controller → service ");
		mav = new ModelAndView();

		int result = mvdao.tModify(schedule);

		if (result > 0) {
			mav.setViewName("redirect:tList");
		} else {
			mav.setViewName("redirect:tList");
		}

		return mav;
	}

	// 상영관 삭제
	public ModelAndView tDelete(String mtTheater) {
		mav = new ModelAndView();
		System.out.println("[2] controller → service " + mtTheater);

		int result = mvdao.tDelete(mtTheater);

		if (result > 0) {
			mav.setViewName("redirect:tList");
		} else {
			mav.setViewName("redirect:tLList");

		}

		return mav;
	}

	// 스케쥴 작성 페이지 이동
		public ModelAndView sWriteForm(String miName) {
			mav = new ModelAndView();
			INFO info = mvdao.mvDetail(miName);

			mav.setViewName("movies/swrite");
			mav.addObject("tView", info);
			return mav;
		}

	// 스케쥴 작성
	public ModelAndView sWrite(SCHEDULE schedule) {
		System.out.println("[2] controller → service ");
		mav = new ModelAndView();

		int result = mvdao.sWrite(schedule);

		if (result > 0) {
			mav.setViewName("redirect:mvList");
		} else {
			mav.setViewName("redirect:tList");
		}

		return mav;
	}

	// 스케쥴 상세보기
	public ModelAndView sView(int msNumber) {
		System.out.println("[2] controller → service " + msNumber);
		mav = new ModelAndView();

		SCHEDULE schedule = mvdao.sView(msNumber);
		System.out.println("[4] dao → service board : " + schedule);

		mav.setViewName("movies/sview");
		mav.addObject("sView", schedule);

		return mav;
	}

	// 스케쥴 리스트 상영관 이름으로
	public ModelAndView sList2(String mtTheater) {
		System.out.println("[2] controller → service ");
		mav = new ModelAndView();
		List<SCHEDULE> schedule = mvdao.sList2(mtTheater);
		System.out.println("[4] info" + mtTheater);
		mav.addObject("slist", schedule);
		mav.setViewName("movies/slist");
		return mav;
	}
	
	// 스케쥴 수정 정보 불러오기
	public ModelAndView sModiForm(int msNumber) {
		mav = new ModelAndView();

		SCHEDULE schedule = mvdao.snView(msNumber);

		mav.setViewName("movies/smodify");
		mav.addObject("smodify", schedule);
		return mav;
	}

	// 스케쥴 수정
	public ModelAndView sModify(SCHEDULE schedule) {
		System.out.println("[2] controller → service " + schedule);
		mav = new ModelAndView();

		int result = mvdao.sModify(schedule);
		System.out.println("[4] dao → service board : " + result);
		if (result > 0) {
			mav.setViewName("redirect:tList");
		} else {
			mav.setViewName("redirect:tList");
		}

		return mav;
	}

	// 스케쥴 삭제
	public ModelAndView sDelete(int msNumber) {
		mav = new ModelAndView();
		System.out.println("[2] controller → service " + msNumber);

		int result = mvdao.sDelete(msNumber);

		if (result > 0) {
			mav.setViewName("redirect:tList");
		} else {
			mav.setViewName("redirect:tLList");

		}

		return mav;
	}

	// 스케쥴 리스트
		public ModelAndView sList(String miName) {
			System.out.println("[2] controller → service ");
			mav = new ModelAndView();

			List<SCHEDULE> schedule = mvdao.sList(miName);
			System.out.println("[4] info" + schedule);
			mav.addObject("slist", schedule);
			mav.setViewName("movies/slist");
			return mav;
		}

	// tiketingList :  내 예매내역 확인
	public ModelAndView ticketingList(String mbId) {
		mav = new ModelAndView();
		List<TICKETING> myTicket = mvdao.ticketingList(mbId);
		System.out.println(myTicket);
		
		mav.addObject("myTicket", myTicket);
		mav.setViewName("movies/myTiketList");
		
		return mav;
	}

	// adminTicketList :  관리자탭 예약 관리
		public ModelAndView adminTicketList(int page) {
			mav = new ModelAndView();
			
			int block = 5;
			int limit = 10;
			int adtCount = mvdao.adtCount();
			int maxPage = (int)(Math.ceil((double)adtCount/limit));
			if(page>maxPage) {
				page = maxPage;
			}
			
			int startRow = (page-1)*limit+1;
			int endRow = page*limit;
			int startPage = (((int)(Math.ceil((double)page/block)))-1)*block+1;
			int endPage = startPage+block-1;
			if(endPage>maxPage) {
				endPage = maxPage;
			}
			
			PAGING paging = new PAGING();
			
			paging.setPage(page);
			paging.setMaxPage(maxPage);
			paging.setStartRow(startRow);
			paging.setEndRow(endRow);
			paging.setStartPage(startPage);
			paging.setEndPage(endPage);
			paging.setLimit(limit);	
			
			List<TICKETING> adminTicketList = mvdao.adminTicketList(paging);
			
			System.out.println(adminTicketList);
			mav.addObject("paging", paging);
			mav.addObject("adList",adminTicketList);
			mav.setViewName("movies/adminTicketList");
			
			return mav;
		}
		
		// 예약 관리 검색
		public ModelAndView adtSearch(SEARCH search) {
			mav = new ModelAndView();
			
			List<TICKETING> adminTicketList = mvdao.adtSearch(search);
			
			mav.addObject("adList",adminTicketList);
			mav.setViewName("movies/adminTicketList");
			
			return mav;
		}

}
