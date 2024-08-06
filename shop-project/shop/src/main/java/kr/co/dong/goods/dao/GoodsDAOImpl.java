package kr.co.dong.goods.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.domain.CartsDTO;
import kr.co.dong.domain.GoodsDTO;
import kr.co.dong.domain.ImgsDTO;
import kr.co.dong.domain.OptionsDTO;
@Repository
public class GoodsDAOImpl implements GoodsDAO{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<GoodsDTO> goodsList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.dong.goodsMapper.goodsList");
	}
	@Override
	public GoodsDTO goodsPage(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.dong.goodsMapper.goodsPage",id);
	}
	@Override
	public List<ImgsDTO> imgsList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.dong.goodsMapper.goodsPageImg",id);
	}
	@Override
	public int insertCart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("kr.co.dong.goodsMapper.insertCarts",map);
	}
	@Override
	public List<GoodsDTO> cartList(String username) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.dong.goodsMapper.cartsList",username);
	}
	@Override
	public int updateCartsUsername(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("kr.co.dong.goodsMapper.updateCartsUsername", map);
	}
	@Override
	public int deleteCartsList(String cartsId) {
		return sqlSession.delete("kr.co.dong.goodsMapper.deleteCartsList",cartsId);
	}
}
