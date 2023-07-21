package com.webtoonfriends.mypage.service;

import java.util.List;
import java.util.Map;

import com.webtoonfriends.member.vo.MemberVO;
import com.webtoonfriends.order.vo.OrderVO;

public interface MyPageService {
	
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception;
	public void cancelOrder(String order_id) throws Exception;
	public void returnOrder(String order_id) throws Exception;
	public void exchangeOrder(String order_id) throws Exception;
	public MemberVO myDetailInfo(String member_id) throws Exception;
	public MemberVO  modifyMyInfo(Map memberMap) throws Exception;
	public void  deleteMember(String member_id) throws Exception;
}
