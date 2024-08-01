package kr.co.dong.users.service;


import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.domain.UsersEntity;
import kr.co.dong.users.dao.UsersDAO;

@Service
public class UserServiceImpl implements UsersService{
	@Autowired
	private UsersDAO dao;
	
	@Override
	public int insertUsers(UsersEntity ue) {
		return dao.insertUsers(ue);
	}
	// 커스텀인셉션으로 컨트롤에 있는 오류메시지를 관리 <-- 알아보기
	@Override
	public int checkId(String id) {
		return dao.checkId(id);
	}

	@Override
	public UsersEntity success(UsersEntity ue) {
		return  dao.success(ue);
	}
	@Override
	public String checkEmail(String email) {
		// TODO Auto-generated method stub
		return dao.checkEmail(email);
	}
	
}
