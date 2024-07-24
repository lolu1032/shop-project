package kr.co.dong.users.dao;

import java.util.List;

import kr.co.dong.domain.UsersEntity;

public interface UsersDAO {
	public int insertUsers(UsersEntity ue);
	// 아이디 중복체크
	public int checkId(String id);
	// 로그인 성공
	public UsersEntity success(UsersEntity ue);
}
