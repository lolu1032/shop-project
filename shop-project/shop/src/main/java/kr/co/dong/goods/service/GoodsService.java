package kr.co.dong.goods.service;

import java.util.List;
import java.util.Map;

import kr.co.dong.domain.CartsEntity;
import kr.co.dong.domain.GoodsEntity;
import kr.co.dong.domain.ImgsEntity;
import kr.co.dong.domain.OptionsEntity;

public interface GoodsService {
	// 상품전체 리스트 (나중에 타입으로 구분할예정)
	public List<GoodsEntity> goodsList();
	// 상품페이지
	public GoodsEntity goodsPage(String id);
	// 색상별 상품이미지
	public List<ImgsEntity> imgsList(String id);
	// 비회원 장바구니 넣을때
	public int insertCart(Map<String, Object> map);
	// 카트 리스트
	public List<GoodsEntity> cartsList(String username);
	// 장바구니 비회원 -> 회원
	public int updateCartsUsername(Map<String, Object> map);
}
