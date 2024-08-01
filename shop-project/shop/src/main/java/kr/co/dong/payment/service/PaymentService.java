package kr.co.dong.payment.service;

import java.util.List;
import java.util.Map;

import kr.co.dong.domain.OrdersEntity;
import kr.co.dong.domain.UsersEntity;

public interface PaymentService {
	// 주문내역 정보넣기
	public int insertOrders(Map<String, Object> map);
	// 주문성공 후 상품 삭제
	public int deleteOrdersList(String name);
	// 장바구니 정보 -> 주문내역에 옮기기
	public int moveCartData(String name);
	// usersId가 null이면 0내보내기
	public String selectUsersId(String name);
	//   String guest = service.selectUsersId(username) == null 이면 guest테이블에 추가
	public int insertGuest(Map<String, Object> map);
	// 주문 내역 리스트
	public List<OrdersEntity> orderDetailList(String name);
	// 이메일 입력시 게스트에 있는지 확인 (비회원용)
	public String selectGuestEmail(String email);
	// 이메일 중복 체크
	public String checkEmail(String email);
	// 세션있을시 이메일 이름 가져오기
	public UsersEntity selectEmailAndName(String username);
}
