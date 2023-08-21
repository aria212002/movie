package com.icia.movie.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.movie.dao.MDAO;
import com.icia.movie.dto.MEMBER;
import com.icia.movie.dto.PAGING;
import com.icia.movie.dto.SEARCH;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MService {

	@Autowired
	private MDAO mdao;

	@Autowired
	private BCryptPasswordEncoder pwEnc;

	@Autowired
	private HttpSession session;

	private ModelAndView mav;

	// 아이디 중복 체크
	public String idCheck(String mbId) {
		String result = null;

		String checkId = mdao.idCheck(mbId);

		if (checkId == null) {
			result = "OK";
		} else {
			result = "NO";
		}
		return result;
	}

	// 회원가입
	public ModelAndView mJoin(MEMBER member) {
		mav = new ModelAndView();

		String mbAddr = "(" + member.getAddr1() + ") " + member.getAddr2() + ", " + member.getAddr3();

		member.setMbAddr(mbAddr);

		member.setMbPw(pwEnc.encode(member.getMbPw()));

		int result = mdao.mJoin(member);

		if (result > 0) {
			mav.setViewName("homepage");
		} else {
			mav.setViewName("member/joinForm");
		}

		return mav;
	}

	// 로그인
	public ModelAndView mLogin(MEMBER member) {
		mav = new ModelAndView();
		String encPw = mdao.mLogin(member.getMbId());
		String mbPw = member.getMbPw();
		if (encPw != null) {
			if (pwEnc.matches(mbPw, encPw)) {
				session.setAttribute("loginId", member.getMbId());
				mav.setViewName("homepage");
				System.out.println("loginId : " + session.getAttribute("loginId"));
			} else {
				String msg = "비밀번호를 잘못 입력하셨습니다";
				mav.addObject("msg", msg);
				mav.setViewName("member/loginFail");
			}
		} else {
			String msg = "아이디가 존재하지 않습니다";
			mav.addObject("msg", msg);
			mav.setViewName("member/loginFail");
		}

		return mav;
	}

	// 회원목록
	public ModelAndView mList(int page) {
		mav = new ModelAndView();

		int block = 5;
		int limit = 10;
		int mCount = mdao.mCount();
		int maxPage = (int) (Math.ceil((double) mCount / limit));
		if (page > maxPage) {
			page = maxPage;
		}

		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		int startPage = (((int) (Math.ceil((double) page / block))) - 1) * block + 1;
		int endPage = startPage + block - 1;
		if (endPage > maxPage) {
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

		List<MEMBER> mvmList = mdao.mList(paging);

		mav.addObject("paging", paging);
		mav.addObject("mvmList", mvmList);

		mav.setViewName("member/memberList");

		return mav;
	}

	// 회원상세보기
	public ModelAndView mView(String mbId) {
		mav = new ModelAndView();

		MEMBER member = mdao.mView(mbId);

		mav.addObject("view", member);
		mav.setViewName("member/memberView");

		return mav;
	}

	// 회원수정 페이지 이동
	public ModelAndView modifyForm(String mbId) {
		mav = new ModelAndView();

		MEMBER member = mdao.mView(mbId);

		mav.addObject("modify", member);
		mav.setViewName("member/modify");

		return mav;
	}

	// 회원수정
	public ModelAndView mModify(MEMBER member) {
		mav = new ModelAndView();

		String mbAddr = "(" + member.getAddr1() + ") " + member.getAddr2() + ", " + member.getAddr3();

		member.setMbAddr(mbAddr);

		member.setMbPw(pwEnc.encode(member.getMbPw()));

		int result = mdao.mModify(member);

		if (result > 0) {
			mav.setViewName("member/memberView");
		} else {
			mav.setViewName("member/modify");
		}

		return mav;
	}

	// 회원 삭제
	public ModelAndView mDelete(String mbId) {
		mav = new ModelAndView();

		int result = mdao.mDelete(mbId);

		if (result > 0) {
			mav.setViewName("homepage");
			session.invalidate();
		} else {
			mav.setViewName("redirect:/mView?mbId=" + mbId);
		}

		return mav;
	}

	// 회원 검색
	public ModelAndView mSearch(SEARCH search) {
		mav = new ModelAndView();

		List<MEMBER> mvmList = mdao.mSearch(search);

		mav.addObject("mvmList", mvmList);
		mav.setViewName("member/memberList");

		return mav;
	}

	// 아이디 찾기
	public String mFindId(MEMBER member) {
		
		String result=mdao.mFindId(member);
		if(result==null) {
			result="NO";
		}
		return result;
	}

	// 비밀번호 변경
	public void mChangePassword(MEMBER member) {
		member.setMbPw(pwEnc.encode(member.getMbPw()));
		mdao.mChangePassword(member);
	}

	// 휴대폰 본인 인증
		public void phoneCheck(String mbPhone, int randomNumber) {
			String api_key = "NCSDEQA46ZBZU9H0";
		    String api_secret = "KEFBXYGRG9VNHWQXJV68ENP4BCM63G27";
		    Message coolsms = new Message(api_key, api_secret);

		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", mbPhone);    // 수신전화번호
		    params.put("from", "01084342259");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		    params.put("type", "SMS");
		    params.put("text", "인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
		    params.put("app_version", "test app 1.2"); // application name and version

		    try {
		        JSONObject obj = (JSONObject) coolsms.send(params);
		        System.out.println(obj.toString());
		      } catch (CoolsmsException e) {
		        System.out.println(e.getMessage());
		        System.out.println(e.getCode());
		      }
		}

	// 아이디 존재 확인
	public String idCheck2(String mbId) {
		String result = null;

		String checkId2 = mdao.idCheck(mbId);

		if (checkId2 != null) {
			result = "OK";
		} else {
			result = "NO";
		}
		return result;
	}

}
