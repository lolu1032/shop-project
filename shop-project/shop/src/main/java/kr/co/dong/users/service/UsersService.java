package kr.co.dong.users.service;

import javax.servlet.http.HttpSession;

import kr.co.dong.domain.UsersEntity;

public interface UsersService {
	public int insertUsers(UsersEntity ue);
	// 아이디 중복 체크
	public int checkId(String id);
	// 아이디 비밀번호 일치
	public UsersEntity success(UsersEntity ue);
}
