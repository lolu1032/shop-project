package kr.co.dong.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.dong.board.service.BoardService;
import kr.co.dong.domain.NoticeDTO;
@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	
	@GetMapping("noticeBoard")
	public String notice(Model model) {
		return "board/noticeBoard";
	}
}
