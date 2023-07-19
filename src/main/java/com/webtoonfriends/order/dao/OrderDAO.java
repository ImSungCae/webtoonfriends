package com.webtoonfriends.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.webtoonfriends.order.vo.OrderVO;

public interface OrderDAO {
	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException;
	public void removeGoodsFromCart(List<OrderVO> myOrderList)throws DataAccessException;
}
