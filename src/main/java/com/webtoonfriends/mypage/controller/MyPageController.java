package com.webtoonfriends.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MyPageController {
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity modifyMyInfo(@RequestParam("member_pwd")  String member_pwd,
			@RequestParam("member_name") String member_name,
			@RequestParam("hp1")  String hp1,
			@RequestParam("zipcode")  String zipcode,
			@RequestParam("address")  String address,
			@RequestParam("subAddress")  String subAddress,
					            HttpServletRequest request, HttpServletResponse response)  throws Exception;

	public ResponseEntity deleteMember(@RequestParam("member_id")  String member_id,  HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
