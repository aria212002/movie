package com.icia.movie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.movie.dto.MEMBER;
import com.icia.movie.dto.SEARCH;
import com.icia.movie.service.MService;

@Controller
public class MController {

	@Autowired
	private MService msvc;

	@Autowired
	private HttpSession session;

	private ModelAndView mav;

	// joinForm : 회원가입 페이지로 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/joinForm";
	}

	// idCheck: 아이디 중복 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public @ResponseBody String idCheck(@RequestParam("mbId") String mbId) {
		String result = msvc.idCheck(mbId);
		return result;
	}

	// mJoin : 회원가입
	@RequestMapping(value = "/mJoin", method = RequestMethod.POST)
	public ModelAndView mJoin(@ModelAttribute MEMBER member) {
		mav = msvc.mJoin(member);
		return mav;
	}

	// loginForm : 로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "member/loginForm";
	}

	// mLogin : 로그인
	@RequestMapping(value = "/mLogin", method = RequestMethod.POST)
	public ModelAndView mLogin(@ModelAttribute MEMBER member) {
		mav = msvc.mLogin(member);

		return mav;
	}

	// mLogout : 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String mLogout() {
		session.invalidate();
		return "homepage";
	}

	// mList : 회원목록
	@RequestMapping(value = "/mList", method = RequestMethod.GET)
	public ModelAndView mList(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		mav = msvc.mList(page);
		return mav;
	}

	// mView : 회원상세보기
	@RequestMapping(value = "/mView", method = RequestMethod.GET)
	public ModelAndView mView(@RequestParam("mbId") String mbId) {
		mav = msvc.mView(mbId);
		return mav;
	}

	// modifyForm : 회원수정 페이지 이동
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public ModelAndView mModiForm(@RequestParam("mbId") String mbId) {
		mav = msvc.modifyForm(mbId);
		return mav;
	}

	// mModify : 회원수정
	@RequestMapping(value = "/mModify", method = RequestMethod.POST)
	public ModelAndView mModify(@ModelAttribute MEMBER member) {
		mav = msvc.mModify(member);
		return mav;
	}

	// mDelete : 회원삭제
	@RequestMapping(value = "/mDelete", method = RequestMethod.GET)
	public ModelAndView memberDelete(@RequestParam String mbId) {
		System.out.println(mbId);
		mav = msvc.mDelete(mbId);
		System.out.println("5");
		return mav;
	}

	// mSearch : 회원검색
	@RequestMapping(value = "/mSearch", method = RequestMethod.GET)
	public ModelAndView mSearch(@ModelAttribute SEARCH search) {
		mav = msvc.mSearch(search);
		return mav;
	}

	// findForm : 아이디 찾기 페이지
	@RequestMapping(value = "/findForm", method = RequestMethod.GET)
	public String findForm() {
		return "member/findId";
	}

	// mFindId : 아이디 찾기
	@RequestMapping(value = "/mFindId", method = RequestMethod.POST)
	@ResponseBody
	public String mFindId(@ModelAttribute MEMBER member) {
		String result=msvc.mFindId(member);
		return result;
	}

	// changePW : 비밀번호 변경 페이지
	@RequestMapping(value = "/changePW", method = RequestMethod.GET)
	public String changePW() {
		return "member/newPassword";
	}

	// mChangePassword : 비밀번호 변경
	@RequestMapping(value = "/mChangePassword", method = RequestMethod.POST)
	@ResponseBody
	public void mChangePassword(@ModelAttribute MEMBER member) {
		msvc.mChangePassword(member);
	}

	// phoneCheck : 휴대폰 본인 인증
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("mbPhone") String mbPhone) { // 휴대폰 문자보내기
		int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);// 난수 생성

		msvc.phoneCheck(mbPhone, randomNumber);

		return Integer.toString(randomNumber);
	}

	// idCheck2 : 아이디 존재 확인
	@RequestMapping(value = "/idCheck2", method = RequestMethod.GET)
	public @ResponseBody String idCheck2(@RequestParam("mbId") String mbId) {
		String result = msvc.idCheck2(mbId);
		return result;
	}

}
