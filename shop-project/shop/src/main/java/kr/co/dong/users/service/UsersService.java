package kr.co.dong.users.service;

import javax.servlet.http.HttpSession;

import kr.co.dong.domain.UsersDTO;

public interface UsersService {
	public int insertUsers(UsersDTO ue);
	// 아이디 중복 체크
	public int checkId(String id);
	// 아이디 비밀번호 일치
	public UsersDTO success(UsersDTO ue);
	// 이메일 중복체크
	public String checkEmail(String email);
}
