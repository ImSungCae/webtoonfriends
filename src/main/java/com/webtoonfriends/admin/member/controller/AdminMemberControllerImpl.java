package com.webtoonfriends.admin.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.webtoonfriends.admin.member.service.AdminMemberService;
import com.webtoonfriends.common.base.BaseController;
import com.webtoonfriends.member.vo.MemberVO;

@Controller("adminMemberController")
@RequestMapping(value = "/admin/member")
public class AdminMemberControllerImpl extends BaseController implements AdminMemberController {
	@Autowired
	private AdminMemberService adminMemberService;

	@RequestMapping(value = "/adminMemberMain.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminGoodsMain(Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");
		String beginDate = null, endDate = null;

		String[] tempDate = calcSearchPeriod(fixedSearchPeriod).split(",");
		beginDate = tempDate[0];
		endDate = tempDate[1];
		dateMap.put("beginDate", beginDate);
		dateMap.put("endDate", endDate);

		HashMap<String, Object> condMap = new HashMap<String, Object>();
		if (section == null) {
			section = "1";
		}
		condMap.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}
		condMap.put("pageNum", pageNum);
		condMap.put("beginDate", beginDate);
		condMap.put("endDate", endDate);
		ArrayList<MemberVO> member_list = adminMemberService.listMember(condMap);
		mav.addObject("member_list", member_list);

		String beginDate1[] = beginDate.split("-");
		String endDate2[] = endDate.split("-");
		mav.addObject("beginYear", beginDate1[0]);
		mav.addObject("beginMonth", beginDate1[1]);
		mav.addObject("beginDay", beginDate1[2]);
		mav.addObject("endYear", endDate2[0]);
		mav.addObject("endMonth", endDate2[1]);
		mav.addObject("endDay", endDate2[2]);

		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		return mav;
	}

	@RequestMapping(value = "/memberDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView memberDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String member_id = request.getParameter("member_id");
		MemberVO member_info = adminMemberService.memberDetail(member_id);
		mav.addObject("member_info", member_info);
		return mav;
	}

	@Override
	public void modifyMemberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {

	}

	@Override
	public ModelAndView deleteMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}

}