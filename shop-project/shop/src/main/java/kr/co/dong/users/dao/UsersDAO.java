package kr.co.dong.users.dao;

import java.util.List;

import kr.co.dong.domain.UsersEntity;

public interface UsersDAO {
	public int insertUsers(UsersEntity ue);
	// ���̵� �ߺ�üũ
	public int checkId(String id);
	// �α��� ����
	public UsersEntity success(UsersEntity ue);
}
