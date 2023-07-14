package com.webtoonfriends.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webtoonfriends.common.base.BaseController;
import com.webtoonfriends.member.vo.MemberVO;
import com.webtoonfriends.mypage.service.MyPageService;

@Controller("myPageController")
@RequestMapping(value = "/mypage")
public class MyPageControllerImpl extends BaseController implements MyPageController {
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberVO memberVO;
	
	
	
	@Override
	@RequestMapping(value = "/myDetailInfo.do",method = RequestMethod.GET)
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/modifyMyInfo.do",method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(
			@RequestParam("member_pwd") String member_pwd,
			@RequestParam("member_name") String member_name,
			@RequestParam("hp1") String hp1,
			@RequestParam("zipcode") String zipcode,
			@RequestParam("address") String address,
			@RequestParam("subAddress") String subAddress, 
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String,String> memberMap = new HashMap<String,String>();
		
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id=memberVO.getMember_id();
		
		memberMap.put("member_pwd",member_pwd);
		memberMap.put("member_name",member_name);
		memberMap.put("hp1",hp1);
		memberMap.put("zipcode",zipcode);
		memberMap.put("address",address);
		memberMap.put("subAddress",subAddress);
		memberMap.put("member_id", member_id);
		
		memberVO=(MemberVO)myPageService.modifyMyInfo(memberMap);
		
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responHeaders = new HttpHeaders();
		
		message = "mod_success";
		resEntity = new ResponseEntity(message,responHeaders,HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/deleteMember.do",method = RequestMethod.POST)
	public ResponseEntity deleteMember(@RequestParam("member_id") String member_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		myPageService.deleteMember(member_id);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responHeaders = new HttpHeaders();
		
		message = "delete_success";
		resEntity = new ResponseEntity(message,responHeaders,HttpStatus.OK);
		return resEntity;
	}

}
