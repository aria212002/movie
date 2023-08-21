package com.icia.movie.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	// 홈페이지로 이동
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "homepage";
	}
	
	/*
	 * //movie_list 목록으로 넘어가기
	 * 
	 * @RequestMapping(value = "/movie_list", method = RequestMethod.GET) public
	 * String movie_list() {
	 * 
	 * return "movies/movies-list"; }
	 */
	
	/*
	 * // movieView 영화 상세보기
	 * 
	 * @RequestMapping(value = "/movieView", method = RequestMethod.GET) public
	 * String movieView() {
	 * 
	 * return "movies/movieView"; }
	 */
	
	
	// mvReservation 영화 예매하기 페이지로 이동
	@RequestMapping(value = "/mvReservation", method = RequestMethod.GET)
	public String mvReservation() {
		
		return "movies/mvReservation";
	}
	
}
