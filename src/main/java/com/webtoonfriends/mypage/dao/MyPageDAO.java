package com.webtoonfriends.mypage.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.webtoonfriends.member.vo.MemberVO;

public interface MyPageDAO {
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException;
	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public void deleteMember(String member_id) throws DataAccessException;
}
