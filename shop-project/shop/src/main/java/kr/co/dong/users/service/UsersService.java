package kr.co.dong.users.service;

import javax.servlet.http.HttpSession;

import kr.co.dong.domain.UsersEntity;

public interface UsersService {
	public int insertUsers(UsersEntity ue);
	// ���̵� �ߺ� üũ
	public int checkId(String id);
	// ���̵� ��й�ȣ ��ġ
	public UsersEntity success(UsersEntity ue);
}
