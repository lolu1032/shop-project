package kr.co.dong.payment.dao;

import java.util.List;
import java.util.Map;

import kr.co.dong.domain.OrdersEntity;

public interface PaymentDAO {
	// 주문 정보에 값 넣기
	public int insertOrders(Map<String, Object> map);
	// 주문 성공 상품 삭제
	public int deleteOrdersList(String name);
	// 장바구니 데이터 옮기기
	public int moveCartData(String name);
	// usersId 0내보내기
	public String selectUsersId(String name);
	// String guest = service.selectUsersId(username) == null 이면 guest테이블에 추가
	public int insertGuest(Map<String, Object> map);
	// 주문내역 리스트
	public List<OrdersEntity> orderDetailList(String name);
	// 이메일 입력시 게스트에 있는지 확인 (비회원용)
	public String selectGuestEmail(String email);
	
}
