package com.webtoonfriends.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.webtoonfriends.order.vo.OrderVO;

public interface OrderDAO {
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException;
	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException;
	public OrderVO findMyOrder(String order_id) throws DataAccessException;
	public void removeGoodsFromCart(List<OrderVO> myOrderList)throws DataAccessException;
	public void removeGoodsFromCart(OrderVO orderVO)throws DataAccessException;
	
	
}
