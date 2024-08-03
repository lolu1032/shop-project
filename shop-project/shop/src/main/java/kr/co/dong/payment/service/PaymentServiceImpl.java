package kr.co.dong.payment.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.domain.OrdersEntity;
import kr.co.dong.domain.UsersEntity;
import kr.co.dong.payment.dao.PaymentDAO;

@Service
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDAO dao;

	@Override
	public int insertOrders(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertOrders(map);
	}

	@Override
	public int deleteOrdersList(String name) {
		// TODO Auto-generated method stub
		return dao.deleteOrdersList(name);
	}

	@Override
	public int moveCartData(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.moveCartData(map);
	}

	@Override
	public String selectUsersId(String name) {
		// TODO Auto-generated method stub
		return dao.selectUsersId(name);
	}

	@Override
	public int insertGuest(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertGuest(map);
	}

	@Override
	public List<OrdersEntity> orderDetailList(String name) {
		// TODO Auto-generated method stub
		return dao.orderDetailList(name);
	}

	@Override
	public String selectGuestEmail(String email) {
		// TODO Auto-generated method stub
		return dao.selectGuestEmail(email);
	}

	@Override
	public String checkEmail(String email) {
		// TODO Auto-generated method stub
		return dao.checkEmail(email);
	}

	@Override
	public UsersEntity selectEmailAndName(String username) {
		// TODO Auto-generated method stub
		return dao.selectEmailAndName(username);
	}

	@Override
	public List<OrdersEntity> ordersDetailGoodsList(String imp) {
		// TODO Auto-generated method stub
		return dao.ordersDetailGoodsList(imp);
	}
}