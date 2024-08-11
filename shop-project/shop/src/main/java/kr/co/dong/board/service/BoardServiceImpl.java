package kr.co.dong.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.board.dao.BoardDAO;
import kr.co.dong.domain.NoticeDTO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO dao;

	@Override
	public List<NoticeDTO> notice() {
		// TODO Auto-generated method stub
		return dao.notice();
	}

	@Override
	public NoticeDTO detailNotice(int id) {
		// TODO Auto-generated method stub
		return dao.detailNotice(id);
	}
}
