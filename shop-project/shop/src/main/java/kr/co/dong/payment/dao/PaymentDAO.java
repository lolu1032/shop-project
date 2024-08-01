package kr.co.dong.payment.dao;

import java.util.List;
import java.util.Map;

import kr.co.dong.domain.OrdersEntity;
import kr.co.dong.domain.UsersEntity;

public interface PaymentDAO {
	// �ֹ� ������ �� �ֱ�
	public int insertOrders(Map<String, Object> map);
	// �ֹ� ���� ��ǰ ����
	public int deleteOrdersList(String name);
	// ��ٱ��� ������ �ű��
	public int moveCartData(String name);
	// usersId 0��������
	public String selectUsersId(String name);
	// String guest = service.selectUsersId(username) == null �̸� guest���̺� �߰�
	public int insertGuest(Map<String, Object> map);
	// �ֹ����� ����Ʈ
	public List<OrdersEntity> orderDetailList(String name);
	// �̸��� �Է½� �Խ�Ʈ�� �ִ��� Ȯ�� (��ȸ����)
	public String selectGuestEmail(String email);
	// �̸��� �ߺ� Ȯ��
	public String checkEmail(String email);
	// ������ ������ �̸����̶� �̸� ��������
	public UsersEntity selectEmailAndName(String username);
	
}
