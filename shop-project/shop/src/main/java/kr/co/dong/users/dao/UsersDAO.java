package kr.co.dong.users.dao;

import java.util.List;

import kr.co.dong.domain.UsersDTO;

public interface UsersDAO {
	public int insertUsers(UsersDTO ue);
	// ���̵� �ߺ�üũ
	public int checkId(String id);
	// �α��� ����
	public UsersDTO success(UsersDTO ue);
	// �̸��� �ߺ�
	public String checkEmail(String email);
}
