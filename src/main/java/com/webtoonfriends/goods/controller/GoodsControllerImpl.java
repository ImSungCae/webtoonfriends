package com.webtoonfriends.goods.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webtoonfriends.common.base.BaseController;
import com.webtoonfriends.goods.service.GoodsService;
import com.webtoonfriends.goods.vo.GoodsVO;

@Controller("goodsController")
@RequestMapping(value = "/goods")
public class GoodsControllerImpl extends BaseController implements GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	@Override
	@RequestMapping(value = "/menuGoods.do",method = RequestMethod.GET)
	public ModelAndView menuGoods(@RequestParam("menuGoods") String menuGoods, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String viewName=(String)request.getAttribute("viewName");
		List<GoodsVO> goodsList=goodsService.menuGoods(menuGoods);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsList", goodsList);
		mav.addObject("menuGoods", menuGoods);
		return mav;
	}

}
