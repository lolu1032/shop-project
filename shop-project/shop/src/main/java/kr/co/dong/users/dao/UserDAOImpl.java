package kr.co.dong.users.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.javassist.expr.NewExpr;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.domain.UsersDTO;

@Repository
public class UserDAOImpl implements UsersDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertUsers(UsersDTO ue) {
		// TODO Auto-generated method stub
		return sqlSession.insert("kr.co.dong.usersMapper.insertUsers",ue);
	}

	@Override
	public int checkId(String id) {
		return sqlSession.selectOne("kr.co.dong.usersMapper.checkId", id);
	}

	@Override
	public UsersDTO success(UsersDTO ue) {
		Map<String, Object> login = new HashMap<String, Object>();
		login.put("login", ue.getLogin());
		login.put("pw",ue.getPw());
		return sqlSession.selectOne("kr.co.dong.usersMapper.sucess",login);
	}

	@Override
	public String checkEmail(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.co.dong.usersMapper.checkEmail", email);
	}
}
