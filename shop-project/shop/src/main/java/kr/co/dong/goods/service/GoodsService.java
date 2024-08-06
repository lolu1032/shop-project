package kr.co.dong.goods.service;

import java.util.List;
import java.util.Map;

import kr.co.dong.domain.CartsDTO;
import kr.co.dong.domain.GoodsDTO;
import kr.co.dong.domain.ImgsDTO;
import kr.co.dong.domain.OptionsDTO;

public interface GoodsService {
	// 상품전체 리스트 (나중에 타입으로 구분할예정)
	public List<GoodsDTO> goodsList();
	// 상품페이지
	public GoodsDTO goodsPage(String id);
	// 색상별 상품이미지
	public List<ImgsDTO> imgsList(String id);
	// 비회원 장바구니 넣을때
	public int insertCart(Map<String, Object> map);
	// 카트 리스트
	public List<GoodsDTO> cartsList(String username);
	// 장바구니 비회원 -> 회원
	public int updateCartsUsername(Map<String, Object> map);
	// 장바구니 선택적 삭제
	public int deleteCartsList(String cartsId);
}
