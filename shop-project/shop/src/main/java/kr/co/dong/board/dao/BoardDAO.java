package kr.co.dong.board.dao;

import java.util.List;

import kr.co.dong.domain.NoticeDTO;

public interface BoardDAO {
	// 공지사항 리스트
	public List<NoticeDTO> notice();
	// 상세 공지사항
	public NoticeDTO detailNotice(int id);
}
