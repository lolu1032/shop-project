package kr.co.dong.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.domain.NoticeDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<NoticeDTO> notice() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.co.dong.boardMapper.noticeBoard");
	}
}
