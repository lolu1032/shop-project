package kr.co.dong.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.domain.CartsEntity;
import kr.co.dong.domain.GoodsEntity;
import kr.co.dong.domain.ImgsEntity;
import kr.co.dong.domain.OptionsEntity;
import kr.co.dong.goods.dao.GoodsDAO;

@Service
public class GoodServiceImpl implements GoodsService{
	@Autowired
	private GoodsDAO goodsDAO;
	@Override
	public List<GoodsEntity> goodsList() {
		// TODO Auto-generated method stub
		return goodsDAO.goodsList();
	}
	@Override
	public GoodsEntity goodsPage(String id) {
		// TODO Auto-generated method stub
		return goodsDAO.goodsPage(id);
	}
	@Override
	public List<ImgsEntity> imgsList(String id) {
		// TODO Auto-generated method stub
		return goodsDAO.imgsList(id);
	}
	@Override
	public int insertCart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsDAO.InsertCart(map);
	}
}
