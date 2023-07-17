package com.webtoonfriends.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webtoonfriends.goods.dao.GoodsDAO;
import com.webtoonfriends.goods.vo.GoodsVO;

@Service("goodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;

	public Map<String, List<GoodsVO>> listGoods() throws Exception {
		Map<String, List<GoodsVO>> goodsMap = new HashMap<String, List<GoodsVO>>();

		List<GoodsVO> goodsList = goodsDAO.selectGoodsList("bestgoods");
		goodsMap.put("bestgoods", goodsList);
		goodsList = goodsDAO.selectGoodsList("newgoods");
		goodsMap.put("newgoods", goodsList);

		/*
		 * goodsList = goodsDAO.selectMenusList("������"); goodsMap.put("cate_digital",
		 * goodsList);
		 * 
		 * goodsList = goodsDAO.selectMenusList("����"); goodsMap.put("cate_book",
		 * goodsList);
		 * 
		 * goodsList = goodsDAO.selectMenusList("�ǰ���ɽ�ǰ"); goodsMap.put("cate_health",
		 * goodsList);
		 * 
		 * goodsList = goodsDAO.selectMenusList("��Ȱ��ǰ"); goodsMap.put("cate_daily",
		 * goodsList);
		 */
		return goodsMap;
	}
	
	@Override
	public List<GoodsVO> menuGoods(String menuGoods) throws Exception {
		return goodsDAO.selectMenusList(menuGoods);
	}
}
