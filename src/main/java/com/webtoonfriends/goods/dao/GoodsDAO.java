package com.webtoonfriends.goods.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.webtoonfriends.goods.vo.GoodsVO;
import com.webtoonfriends.goods.vo.ImageFileVO;

public interface GoodsDAO {

	public List<GoodsVO> selectGoodsList(String goodsStatus ) throws DataAccessException;
	
	public List<GoodsVO> selectMenusList(String goodsSort ) throws DataAccessException;
	
	public List<GoodsVO> selectGoodsBySearchWord(String searchWord) throws DataAccessException;
	
	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException;
	public List<ImageFileVO> selectGoodsDetailImage(String goods_id) throws DataAccessException;
}
