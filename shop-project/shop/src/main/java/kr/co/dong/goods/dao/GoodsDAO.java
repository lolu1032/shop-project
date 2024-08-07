package kr.co.dong.goods.dao;

import java.util.List;
import java.util.Map;

import kr.co.dong.domain.CartsDTO;
import kr.co.dong.domain.GoodsDTO;
import kr.co.dong.domain.ImgsDTO;
import kr.co.dong.domain.OptionsDTO;

public interface GoodsDAO {
	// 상품 전체 리스트 (나중에 타입으로 아우터 상의 하의 나눌예정)
	public List<GoodsDTO> goodsList();
	// 상품 들어갔을때 페이지
	public GoodsDTO goodsPage(String id);
	// 상품 색상별 이미지
	public List<ImgsDTO> imgsList(String id);
	// 비회원 장바구니
	public int insertCart(Map<String, Object> map);
	// 장바구니 리스트
	public List<GoodsDTO> cartList(String username);
	// 장바구니 비회원 -> 회원
	public int updateCartsUsername(Map<String, Object> map);
	// 장바구니 선택 삭제
	public int deleteCartsList(String cartsId);
}
