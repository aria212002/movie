package com.icia.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.movie.dao.rDAO;
import com.icia.movie.dto.INFO;
import com.icia.movie.dto.SCHEDULE;
import com.icia.movie.dto.TICKETING;

@Service
public class rService {

	@Autowired
	private rDAO rdao;

	private ModelAndView mav = new ModelAndView();

	// 영화목록 가져오기
	public List<INFO> msList() {

		List<INFO> result = rdao.msList();

		return result;
	}

	// 영화 제목과 날짜로 타임 테이블 가져오기
	public List<SCHEDULE> msTime(SCHEDULE schedule) {
		System.out.println(schedule);
		List<SCHEDULE> result = rdao.msTime(schedule);
		System.out.println(result);

		return result;
	}

	// 스케쥴번호로 정보를 가져와서 좌석 페이지로 이동
	public ModelAndView seat(int msNumber) {

		mav.clear();
		SCHEDULE result = rdao.seat(msNumber);
		mav.addObject("result", result);
		mav.setViewName("movies/seat");

		return mav;
	}

	// 스케쥴번호로 예약된 좌석 수 가져오기
	public int seatCheck(int mtsNumber) {

		int result;
		try {
			result = rdao.seatCheck(mtsNumber);
		} catch (Exception e) {
			result = 0;
			e.printStackTrace();
		}

		return result;
	}

	// 선택한 정보로 예매 내역 저장 후 예약번호 반환
	public int reserve(TICKETING ticketing) {
		
		// 예약번호는 예약번호 중 가장 큰값에 1을 더해서 설정
		// 예약내역이 없을시 에러 방지 위해 초기값 및 try-catch 사용
		int maxMtNumber = 0;
		try {
			maxMtNumber = rdao.maxMtNumber();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ticketing.setMtNumber(maxMtNumber + 1);
		rdao.reserve(ticketing);
		int result = ticketing.getMtNumber();

		return result;
	}

	// 스케쥴번호로 예약된 좌석 번호 가져오기
	public List<String> reservedSeat(int mtsNumber) {
		List<String> result;
		try {
			result = rdao.reservedSeat(mtsNumber);
		} catch (Exception e) {
			result = null;
			e.printStackTrace();
		}

		return result;
	}

	// 예매 취소시 예약 번호로 예약내역 삭제
	public ModelAndView reserveDel(int mtNumber) {

		mav.clear();
		rdao.reserveDel(mtNumber);
		mav.setViewName("redirect:/reservePage");

		return mav;
	}

	public ModelAndView successPay(int mtNumber) {

		mav.clear();
		rdao.successPay(mtNumber);
		// 아이디를 가지고 마이페이지로 이동
		// 예약번호를 가지고 예약내역 출력으로 이동하는 것으로 변경해도 무방
		String mtId = rdao.callId(mtNumber);
		mav.setViewName("redirect:/ticketingList?mbId=" + mtId);

		return mav;
	}

	public ModelAndView reserveDel2(int mtNumber) {

		mav.clear();
		String mtId = rdao.callId(mtNumber);
		rdao.reserveDel2(mtNumber);
		mav.setViewName("redirect:/ticketingList?mbId=" + mtId);

		return mav;
	}
	
	public ModelAndView reserveDel3(int mtNumber) {

		mav.clear();
		String mtId = rdao.callId(mtNumber);
		rdao.reserveDel3(mtNumber);
		mav.setViewName("redirect:/adminTicketList");

		return mav;
	}
	
	// msInfo : 영화이름으로 영화 시작시간 가져오기
	public List<SCHEDULE> msInfo(String msName) {
		mav.clear();
		List<SCHEDULE> msTime;
		
		try {
		msTime = rdao.msInfo(msName);
		
		System.out.println(msTime);
	} catch (Exception e) {
		msTime = null;
		e.printStackTrace();
	}
		
		return msTime;
	}

}
