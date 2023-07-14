package com.webtoonfriends.mypage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webtoonfriends.member.vo.MemberVO;
import com.webtoonfriends.mypage.dao.MyPageDAO;

@Service("myPageService")
@Transactional(propagation=Propagation.REQUIRED)
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private MyPageDAO myPageDAO;

	@Override
	public MemberVO myDetailInfo(String member_id) throws Exception {
		return myPageDAO.selectMyDetailInfo(member_id);
	}

	@Override
	public MemberVO modifyMyInfo(Map memberMap) throws Exception {
		String member_id = (String)memberMap.get("member_id");
		myPageDAO.updateMyInfo(memberMap);
		return myPageDAO.selectMyDetailInfo(member_id);
	}

	@Override
	public void deleteMember(String member_id) throws Exception {
		myPageDAO.deleteMember(member_id);
	}

}
