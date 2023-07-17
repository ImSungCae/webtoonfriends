package com.webtoonfriends.goods.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.webtoonfriends.goods.vo.GoodsVO;

public interface GoodsDAO {

	public List<GoodsVO> selectGoodsList(String goodsStatus ) throws DataAccessException;
	
	public List<GoodsVO> selectMenusList(String goodsSort ) throws DataAccessException;
	
}
