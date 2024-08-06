package kr.co.dong.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.domain.CartsDTO;
import kr.co.dong.domain.GoodsDTO;
import kr.co.dong.domain.ImgsDTO;
import kr.co.dong.domain.OptionsDTO;
import kr.co.dong.goods.dao.GoodsDAO;

@Service
public class GoodServiceImpl implements GoodsService{
	@Autowired
	private GoodsDAO goodsDAO;
	@Override
	public List<GoodsDTO> goodsList() {
		// TODO Auto-generated method stub
		return goodsDAO.goodsList();
	}
	@Override
	public GoodsDTO goodsPage(String id) {
		// TODO Auto-generated method stub
		return goodsDAO.goodsPage(id);
	}
	@Override
	public List<ImgsDTO> imgsList(String id) {
		// TODO Auto-generated method stub
		return goodsDAO.imgsList(id);
	}
	@Override
	public int insertCart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsDAO.insertCart(map);
	}
	@Override
	public List<GoodsDTO> cartsList(String username) {
		// TODO Auto-generated method stub
		return goodsDAO.cartList(username);
	}
	@Override
	public int updateCartsUsername(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsDAO.updateCartsUsername(map);
	}
	@Override
	public int deleteCartsList(String cartsId) {
		// TODO Auto-generated method stub
		return goodsDAO.deleteCartsList(cartsId);
	}
}
