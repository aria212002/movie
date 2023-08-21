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

import com.icia.movie.dto.COMMENT;
import com.icia.movie.dto.BOARD;
import com.icia.movie.service.BService;

@Controller
public class BController {

	@Autowired
	private BService bsvc;

	private ModelAndView mav;

	// customerService : 고객센터
	@RequestMapping(value = "customerService", method = RequestMethod.GET)
	public ModelAndView customerService(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		mav = bsvc.bdList(page);
		return mav;
	}

	// writeForm : 게시글 작성 페이지
	@RequestMapping(value = "writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "board/writeForm";
	}

	// bdWrite : 게시글 작성
	@RequestMapping(value = "bdWrite", method = RequestMethod.POST)
	public ModelAndView bdWrite(@ModelAttribute BOARD board) {
		mav = bsvc.bdWrite(board);
		return mav;
	}

	// bdView : 게시글 보기
	@RequestMapping(value = "bdView", method = RequestMethod.GET)
	public ModelAndView bView(@RequestParam("bdNum") int bdNum) {
		mav = bsvc.bdView(bdNum);
		return mav;
	}

	// bmForm : 게시글 수정 페이지
	@RequestMapping(value = "bmForm", method = RequestMethod.GET)
	public ModelAndView bmForm(@RequestParam("bdNum") int bdNum) {
		mav = bsvc.bmForm(bdNum);
		return mav;
	}

	// bdModify : 게시글 수정
	@RequestMapping(value = "bdModify", method = RequestMethod.POST)
	public ModelAndView bdModify(@ModelAttribute BOARD board) {
		mav = bsvc.bdModify(board);
		return mav;
	}

	// bdDelete : 게시글 삭제
	@RequestMapping(value = "/bdDelete", method = RequestMethod.GET)
	public ModelAndView bdDelete(@RequestParam("bdNum") int bdNum) {
		mav = bsvc.bdDelete(bdNum);
		return mav;
	}

	// cmList : 댓글 목록
	@RequestMapping(value = "cmList", method = RequestMethod.POST)
	public @ResponseBody List<COMMENT> cmList(@RequestParam("cmbNum") int cmbNum) {
		List<COMMENT> list = bsvc.cmList(cmbNum);
		return list;
	}

	// cmWrite : 댓글 작성
	@RequestMapping(value = "cmWrite", method = RequestMethod.POST)
	public @ResponseBody List<COMMENT> cmWrite(@ModelAttribute COMMENT comment) {
		List<COMMENT> list = bsvc.cmWrite(comment);
		return list;
	}

	// cmModify : 댓글 수정
	@RequestMapping(value = "cmModify", method = RequestMethod.POST)
	public @ResponseBody List<COMMENT> cmModify(@ModelAttribute COMMENT comment) {
		System.out.println("[1] jsp → controller" + comment);
		List<COMMENT> list = bsvc.cmModify(comment);
		System.out.println("[5] service → controller : " + list);
		return list;
	}

	// cmDelete : 댓글 삭제
	@RequestMapping(value = "cmDelete", method = RequestMethod.POST)
	public @ResponseBody List<COMMENT> cmDelete(@ModelAttribute COMMENT comment) {
		List<COMMENT> list = bsvc.cmDelete(comment);
		return list;
	}
}
