package com.webtoonfriends.goods.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.webtoonfriends.goods.vo.GoodsVO;

@Repository("goodsDAO")
public class GoodsDAOImpl implements GoodsDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsVO> selectGoodsList(String goodsStatus) throws DataAccessException {
		return sqlSession.selectList("mapper.goods.selectGoodsList",goodsStatus);
	}
	
	@Override
	public List<GoodsVO> selectMenusList(String goodsSort) throws DataAccessException {
		return sqlSession.selectList("mapper.goods.selectMenuList",goodsSort);
	}

	
	
	
}
