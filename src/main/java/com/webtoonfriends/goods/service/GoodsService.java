package com.webtoonfriends.goods.service;

import java.util.List;
import java.util.Map;

import com.webtoonfriends.goods.vo.GoodsVO;

public interface GoodsService {
	public Map<String,List<GoodsVO>> listGoods() throws Exception;
	public List<GoodsVO> menuGoods(String menuGoods) throws Exception;
}
