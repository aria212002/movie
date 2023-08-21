package com.icia.movie.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
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
import com.icia.movie.dto.KAKAO;
import com.icia.movie.dto.SCHEDULE;
import com.icia.movie.dto.TICKETING;
import com.icia.movie.service.rService;

@Controller
public class rController {
	
	@Autowired
	private rService rsvc;
	
	private ModelAndView mav=new ModelAndView();

	
	// 예매 페이지
	@RequestMapping(value="/reservePage", method=RequestMethod.GET)
	public ModelAndView reservePage(@RequestParam(required = false, defaultValue = "") String miName) {
		mav.clear();
		mav.setViewName("movies/mvReservation");
		mav.addObject("miName", miName);
		return mav;
	}
	
	// 예약번호 가지고 결제 페이지 이동
	@RequestMapping(value="/pay", method=RequestMethod.GET)
	public ModelAndView pay(@RequestParam int mtNumber) {
		mav.clear();
		mav.setViewName("pay");
		mav.addObject("mtNumber", mtNumber);
		return mav;
	}
	
	// 영화목록 가져오기
	@RequestMapping(value = "/msList", method = RequestMethod.GET)
	@ResponseBody
	public List<INFO> msList() {

		List<INFO> result = rsvc.msList();
		System.out.println("영화목록 "+result);
		return result;
	}
	
	// msTime : 영화제목과 날짜로 시간표 구하기
	@RequestMapping(value = "/msTime", method = RequestMethod.GET)
	@ResponseBody
	public List<SCHEDULE> msTime(@ModelAttribute SCHEDULE schedule) {
		
		List<SCHEDULE> result = rsvc.msTime(schedule);
		System.out.println("타임 테이블 "+result);
		return result;
	}
	
	// 스케쥴번호로 예약된 좌석 수 가져오기
	@RequestMapping(value = "/seatCheck", method = RequestMethod.GET)
	@ResponseBody
	public int seatCheck(@RequestParam int mtsNumber) {
		int result = rsvc.seatCheck(mtsNumber);
		System.out.println("스케쥴번호 "+mtsNumber+", 예약 좌석수 "+result);

		return result;
	}
	
	// 스케쥴번호로 정보를 가져와서 좌석 페이지로 이동
	@RequestMapping(value="/seat", method = RequestMethod.GET)
	public ModelAndView seat(@RequestParam int msNumber) {
		mav=rsvc.seat(msNumber);
		System.out.println("스케쥴정보 "+mav);
		return mav;
	}

	// 선택한 정보로 예매 내역 저장 후 예약번호 반환
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	@ResponseBody
	public int reserve(@ModelAttribute TICKETING ticketing) {

		int result = rsvc.reserve(ticketing);
		System.out.println("예약번호 "+result);

		return result;
	}
	
	// 선택한 정보로 카카오 결제
	@RequestMapping(value = "/kakaoPay", method = RequestMethod.POST)
	@ResponseBody
	public String kakaoPay(@ModelAttribute TICKETING ticketing) {
		try {
			// 보내는 부분
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK 01325cb3fef89cd5fe1216fc3b62e83d"); // 어드민 키
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
			String parameter = "cid=TC0ONETIME" // 가맹점 코드
					+ "&partner_order_id="+ticketing.getMtNumber() // 가맹점 주문번호
					+ "&partner_user_id="+ticketing.getMtId() // 가맹점 회원 id
					+ "&item_name="+URLEncoder.encode(ticketing.getMtName(),"UTF-8") // 상품명
					+ "&quantity="+ticketing.getMtCount() // 상품 수량
					+ "&total_amount="+ticketing.getMtPrice() // 총 금액
					+ "&vat_amount=0" // 부가세
					+ "&tax_free_amount=0" // 상품 비과세 금액
					+ "&approval_url=http://localhost:9091/movie/successKakao?mtNumber="+ticketing.getMtNumber() // 결제 성공 시
					+ "&fail_url=http://localhost:9091/movie/failKakao?mtNumber="+ticketing.getMtNumber() // 결제 실패 시
					+ "&cancel_url=http://localhost:9091/movie/cancelKakao?mtNumber="+ticketing.getMtNumber(); // 결제 취소 시
			OutputStream send = connection.getOutputStream(); 
			DataOutputStream dataSend = new DataOutputStream(send); 
			dataSend.writeBytes(parameter); // 형변환
			dataSend.close(); // flush가 자동으로 호출이 되고 닫는다.
			
			int result = connection.getResponseCode(); // 응답 코드
			InputStream receive; 
			
			if(result == 200) {
				receive = connection.getInputStream();
			}else {
				receive = connection.getErrorStream(); 
			}
			// 읽는 부분
			InputStreamReader read = new InputStreamReader(receive); 
			BufferedReader change = new BufferedReader(read); 
			// 받는 부분


			return change.readLine(); // 문자열로 형변환
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";

	}
	
	
	
	// 스케쥴번호로 예약된 좌석 번호 가져오기
	@RequestMapping(value = "/reservedSeat", method = RequestMethod.GET)
	@ResponseBody
	public List<String> reservedSeat(@RequestParam int mtsNumber) {

		List<String> result = rsvc.reservedSeat(mtsNumber);
		System.out.println("예약 좌석번호 "+result);
		
		return result;
	}
	

	
	// 예매 취소시 예약 번호로 예약내역 삭제
	@RequestMapping(value="/reserveDel", method = RequestMethod.GET)
	public ModelAndView reserveDel(@RequestParam int mtNumber) {

		mav=rsvc.reserveDel(mtNumber);
		
		return mav;
	}
	
	
	// 예약번호로 결제 완료시 MTPAYMENT 1로 변환
	@RequestMapping(value="/successPay", method = RequestMethod.GET)
	public ModelAndView successPay(@RequestParam int mtNumber) {
		
		mav=rsvc.successPay(mtNumber);

		
		return mav;
	}
	
	// 예약번호 가지고 결제 성공 페이지 이동
	@RequestMapping(value="/successKakao", method=RequestMethod.GET)
	public ModelAndView successKakao(@ModelAttribute KAKAO kakao) {
		mav.clear();
		mav.setViewName("redirect:/successPay");
		mav.addObject("mtNumber", kakao.getMtNumber());
		return mav;
	}
	// 결제 실패시 예약번호 가지고 목록 페이지 이동
	// 예약번호를 가지고 재결제 창이나 예약내역으로 이동해도 무방
	@RequestMapping(value="/failKakao", method=RequestMethod.GET)
	public ModelAndView failKakao(@ModelAttribute KAKAO kakao) {
		mav.clear();
		mav.setViewName("redirect:/reservePage");
		mav.addObject("mtNumber", kakao.getMtNumber());
		return mav;
	}
	// 예약번호 가지고 예약내역 삭제 페이지 이동
	@RequestMapping(value="/cancelKakao", method=RequestMethod.GET)
	public ModelAndView cancelKakao(@ModelAttribute KAKAO kakao) {
		mav.clear();
		mav.setViewName("redirect:/reserveDel");
		mav.addObject("mtNumber", kakao.getMtNumber());
		return mav;
	}
	
	// 회원예매 본인이 취소
	@RequestMapping(value="/reserveDel2", method = RequestMethod.GET)
	public ModelAndView reserveDel2(@RequestParam int mtNumber) {

		mav=rsvc.reserveDel2(mtNumber);
		
		return mav;
	}
	
	// 관리자 예매 취소
	@RequestMapping(value="/reserveDel3", method = RequestMethod.GET)
	public ModelAndView reserveDel3(@RequestParam int mtNumber) {

		mav=rsvc.reserveDel3(mtNumber);
		
		return mav;
	}
	
	// msInfo : 영화이름으로 영화 시작시간 가져오기
	@RequestMapping(value = "/msInfo", method = RequestMethod.GET)
	@ResponseBody
	public List<SCHEDULE> msInfo(@RequestParam String msName) {
		List<SCHEDULE> msTime = rsvc.msInfo(msName);
		System.out.println("예약 좌석번호 "+msTime);
	
		return msTime;
	}
	
}
