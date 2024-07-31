package kr.co.dong.payment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.domain.OrdersEntity;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertOrders(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("kr.co.dong.paymentMapper.insertOrders",map);
	}

	@Override
	public int deleteOrdersList(String name) {
		// TODO Auto-generated method stub
		return sqlSession.delete("kr.co.dong.paymentMapper.deleteOrders",name);
	}

	@Override
	public int moveCartData(String name) {
		// TODO Auto-generated method stub
		return sqlSession.insert("kr.co.dong.paymentMapper.moveCartData",name);
	}

	@Override
	public String selectUsersId(String name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.dong.paymentMapper.selectUsersId", name);
	}

	@Override
	public int insertGuest(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("kr.co.dong.paymentMapper.insertGuest",map);
	}

	@Override
	public List<OrdersEntity> orderDetailList(String name) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.dong.paymentMapper.ordersList", name);
	}

	@Override
	public String selectGuestEmail(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.dong.paymentMapper.selectGuestEmail", email);
	}
}
