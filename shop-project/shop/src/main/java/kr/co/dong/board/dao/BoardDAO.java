package kr.co.dong.board.dao;

import java.util.List;

import kr.co.dong.domain.NoticeDTO;

public interface BoardDAO {
	// �������� ����Ʈ
	public List<NoticeDTO> notice();
	// �� ��������
	public NoticeDTO detailNotice(int id);
}
