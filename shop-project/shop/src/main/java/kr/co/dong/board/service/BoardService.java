package kr.co.dong.board.service;

import java.util.List;

import kr.co.dong.domain.NoticeDTO;

public interface BoardService {
	// 공지사항 리스트
	public List<NoticeDTO> notice();
	// 공지사항 상세페이지
	public NoticeDTO detailNotice(int id);
}
