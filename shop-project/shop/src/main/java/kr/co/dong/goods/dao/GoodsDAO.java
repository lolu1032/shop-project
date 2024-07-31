package kr.co.dong.goods.dao;

import java.util.List;
import java.util.Map;

import kr.co.dong.domain.CartsEntity;
import kr.co.dong.domain.GoodsEntity;
import kr.co.dong.domain.ImgsEntity;
import kr.co.dong.domain.OptionsEntity;

public interface GoodsDAO {
	// ��ǰ ��ü ����Ʈ (���߿� Ÿ������ �ƿ��� ���� ���� ��������)
	public List<GoodsEntity> goodsList();
	// ��ǰ ������ ������
	public GoodsEntity goodsPage(String id);
	// ��ǰ ���� �̹���
	public List<ImgsEntity> imgsList(String id);
	// ��ȸ�� ��ٱ���
	public int insertCart(Map<String, Object> map);
	// ��ٱ��� ����Ʈ
	public List<GoodsEntity> cartList(String username);
	// ��ٱ��� ��ȸ�� -> ȸ��
	public int updateCartsUsername(Map<String, Object> map);
	// ��ٱ��� ���� ����
	public int deleteCartsList(String cartsId);
}
