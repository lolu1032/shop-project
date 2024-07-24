package kr.co.dong.goods.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.domain.GoodsEntity;
import kr.co.dong.domain.ImgsEntity;
import kr.co.dong.domain.OptionsEntity;
@Repository
public class GoodsDAOImpl implements GoodsDAO{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<GoodsEntity> goodsList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.dong.goodsMapper.goodsList");
	}
	@Override
	public GoodsEntity goodsPage(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.dong.goodsMapper.goodsPage",id);
	}
	@Override
	public List<ImgsEntity> imgsList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.dong.goodsMapper.goodsPageImg",id);
	}
	@Override
	public int InsertCarts(String id) {
		// TODO Auto-generated method stub
		return sqlSession.insert("kr.co.dong.goodsMapper.insertCarts",id);
	}
}
