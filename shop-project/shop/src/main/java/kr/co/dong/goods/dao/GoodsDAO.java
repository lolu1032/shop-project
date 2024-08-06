package kr.co.dong.goods.dao;

import java.util.List;
import java.util.Map;

import kr.co.dong.domain.CartsDTO;
import kr.co.dong.domain.GoodsDTO;
import kr.co.dong.domain.ImgsDTO;
import kr.co.dong.domain.OptionsDTO;

public interface GoodsDAO {
	// ��ǰ ��ü ����Ʈ (���߿� Ÿ������ �ƿ��� ���� ���� ��������)
	public List<GoodsDTO> goodsList();
	// ��ǰ ������ ������
	public GoodsDTO goodsPage(String id);
	// ��ǰ ���� �̹���
	public List<ImgsDTO> imgsList(String id);
	// ��ȸ�� ��ٱ���
	public int insertCart(Map<String, Object> map);
	// ��ٱ��� ����Ʈ
	public List<GoodsDTO> cartList(String username);
	// ��ٱ��� ��ȸ�� -> ȸ��
	public int updateCartsUsername(Map<String, Object> map);
	// ��ٱ��� ���� ����
	public int deleteCartsList(String cartsId);
}
