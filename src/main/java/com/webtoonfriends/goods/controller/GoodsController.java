package com.webtoonfriends.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface GoodsController {
	public ModelAndView menuGoods(@RequestParam("menuGoods") String menuGoods,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}