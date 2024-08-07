package kr.co.dong.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class BoardController {
	@GetMapping("noticeBoard")
	public String a() {
		return "board/noticeBoard";
	}
}
