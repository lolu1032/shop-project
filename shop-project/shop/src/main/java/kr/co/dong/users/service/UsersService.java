package kr.co.dong.users.service;

import javax.servlet.http.HttpSession;

import kr.co.dong.domain.UsersDTO;

public interface UsersService {
	public int insertUsers(UsersDTO ue);
	// ���̵� �ߺ� üũ
	public int checkId(String id);
	// ���̵� ��й�ȣ ��ġ
	public UsersDTO success(UsersDTO ue);
	// �̸��� �ߺ�üũ
	public String checkEmail(String email);
}
