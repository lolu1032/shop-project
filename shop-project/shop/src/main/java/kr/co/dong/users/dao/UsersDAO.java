package kr.co.dong.users.dao;

import java.util.List;

import kr.co.dong.domain.UsersDTO;

public interface UsersDAO {
	public int insertUsers(UsersDTO ue);
	// 아이디 중복체크
	public int checkId(String id);
	// 로그인 성공
	public UsersDTO success(UsersDTO ue);
	// 이메일 중복
	public String checkEmail(String email);
}
