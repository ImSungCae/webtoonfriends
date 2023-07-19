package com.webtoonfriends.order.service;

import java.util.List;

import com.webtoonfriends.order.vo.OrderVO;

public interface OrderService {
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception;
}
