package com.webtoonfriends.mypage.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.webtoonfriends.member.vo.MemberVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectMyDetailInfo",member_id);
	}

	@Override
	public void updateMyInfo(Map memberMap) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyInfo",memberMap);
	}

	@Override
	public void deleteMember(String member_id) throws DataAccessException {
		sqlSession.delete("mapper.mypage.deleteMember",member_id);
	}
	
}
