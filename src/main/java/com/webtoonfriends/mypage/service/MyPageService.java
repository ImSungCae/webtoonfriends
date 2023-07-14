package com.webtoonfriends.mypage.service;

import java.util.Map;

import com.webtoonfriends.member.vo.MemberVO;

public interface MyPageService {
	public MemberVO myDetailInfo(String member_id) throws Exception;
	public MemberVO  modifyMyInfo(Map memberMap) throws Exception;
	public void  deleteMember(String member_id) throws Exception;
}
