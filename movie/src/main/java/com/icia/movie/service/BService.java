package com.icia.movie.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.movie.dto.PAGING;
import com.icia.movie.dao.BDAO;
import com.icia.movie.dto.BOARD;
import com.icia.movie.dto.COMMENT;

@Service
public class BService {

	private ModelAndView mav;

	@Autowired
	private BDAO bdao;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HttpSession session;

	// 게시글 작성
	public ModelAndView bdWrite(BOARD board) {
		mav = new ModelAndView();

		int result = bdao.bdWrite(board);

		if (result > 0) {
			mav.setViewName("redirect:customerService");
		} else {
			mav.setViewName("board/writeForm");
		}
		return mav;
	}

	// 게시글 목록
	public ModelAndView bdList(int page) {
		mav = new ModelAndView();

		int block = 5;
		int limit = 10;
		int bCount = bdao.bdCount();

		int maxPage = (int) (Math.ceil((double) bCount / limit));
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

		List<BOARD> bdList = bdao.bdList(paging);

		mav.addObject("paging", paging);
		mav.addObject("bdList", bdList);

		mav.setViewName("customerService");

		return mav;
	}

	// 게시글 보기
	public ModelAndView bdView(int bdNum) {
		mav = new ModelAndView();

		BOARD board = bdao.bdView(bdNum);

		mav.setViewName("board/BoardView");
		mav.addObject("view", board);

		return mav;
	}

	// 게시글 수정 페이지
	public ModelAndView bmForm(int bdNum) {
		mav = new ModelAndView();

		BOARD board = bdao.bdView(bdNum);

		mav.addObject("modify", board);
		mav.setViewName("board/modify");

		return mav;
	}

	// 게시글 수정
	public ModelAndView bdModify(BOARD board) {
		mav = new ModelAndView();

		int result = bdao.bdModify(board);

		if (result > 0) {
			mav.setViewName("redirect:bdView?bdNum=" + board.getBdNum());
		} else {
			mav.setViewName("redirect:bmForm?bdNum=" + board.getBdNum());
		}
		return mav;
	}

	// 게시글 삭제
	public ModelAndView bdDelete(int bdNum) {
		mav = new ModelAndView();

		int result = bdao.bdDelete(bdNum);
		if (result > 0) {
			mav.setViewName("customerService");
		} else {
			mav.setViewName("redirect:bdView?bdNum=" + bdNum);
		}
		return mav;
	}

	// 댓글 목록
	public List<COMMENT> cmList(int cmbNum) {
		List<COMMENT> list = bdao.cmList(cmbNum);
		return list;
	}

	// 댓글 입력
	public List<COMMENT> cmWrite(COMMENT comment) {
		System.out.println("[2] controller → service : " + comment);

		try {
			bdao.cmWrite(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<COMMENT> list = bdao.cmList(comment.getCmbNum());
		System.out.println("[4] dao → service : " + comment);
		return list;
	}

	// 댓글 수정
	public List<COMMENT> cmModify(COMMENT comment) {
		System.out.println("[2] controller → service : " + comment);

		try {
			bdao.cmModify(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<COMMENT> list = bdao.cmList(comment.getCmbNum());
		System.out.println("[4] dao → service : " + comment);
		return list;
	}

	// 댓글 삭제
	public List<COMMENT> cmDelete(COMMENT comment) {
		System.out.println("[2] controller → service : " + comment);

		try {
			bdao.cmDelete(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<COMMENT> list = bdao.cmList(comment.getCmbNum());
		System.out.println("[4] dao → service : " + comment);
		return list;
	}
}
