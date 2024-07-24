package kr.co.dong.goods.service;

import java.util.List;

import kr.co.dong.domain.CartsEntity;
import kr.co.dong.domain.GoodsEntity;
import kr.co.dong.domain.ImgsEntity;
import kr.co.dong.domain.OptionsEntity;

public interface GoodsService {
	// ��ǰ��ü ����Ʈ (���߿� Ÿ������ �����ҿ���)
	public List<GoodsEntity> goodsList();
	// ��ǰ������
	public GoodsEntity goodsPage(String id);
	// ���� ��ǰ�̹���
	public List<ImgsEntity> imgsList(String id);
	// ��ٱ��� �߰�
	public int insertCarts(String id);
}
