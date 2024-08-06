package kr.co.dong.payment.service;

import java.util.List;
import java.util.Map;

import kr.co.dong.domain.GoodsDTO;
import kr.co.dong.domain.OrdersDetailDTO;
import kr.co.dong.domain.OrdersDTO;
import kr.co.dong.domain.UsersDTO;

public interface PaymentService {
	// �ֹ����� �����ֱ�
	public int insertOrders(Map<String, Object> map);
	// �ֹ����� �� ��ǰ ����
	public int deleteOrdersList(String name);
	// ��ٱ��� ���� -> �ֹ������� �ű��
	public int moveCartData(Map<String, Object> map);
	// usersId�� null�̸� 0��������
	public String selectUsersId(String name);
	//   String guest = service.selectUsersId(username) == null �̸� guest���̺� �߰�
	public int insertGuest(Map<String, Object> map);
	// �ֹ� ���� ����Ʈ
	public List<OrdersDTO> orderDetailList(String name);
	// �̸��� �Է½� �Խ�Ʈ�� �ִ��� Ȯ�� (��ȸ����)
	public String selectGuestEmail(String email);
	// �̸��� �ߺ� üũ
	public String checkEmail(String email);
	// ���������� �̸��� �̸� ��������
	public UsersDTO selectEmailAndName(String username);
	// �ֹ����� ����Ʈ
	public List<OrdersDetailDTO> a(Map<String, Object> map);
}