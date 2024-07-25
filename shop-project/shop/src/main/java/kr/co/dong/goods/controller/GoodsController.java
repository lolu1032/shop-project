package kr.co.dong.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dong.domain.GoodsEntity;
import kr.co.dong.domain.ImgsEntity;
import kr.co.dong.goods.service.GoodsService;
@Controller
public class GoodsController {
	@Autowired
	private GoodsService service;
	
	@GetMapping(value = "main")
	public void main() {

//		List<ImgEntity> list = service.list();
////		System.out.println("Goods List: " + list); // 디버깅용 로그
//		model.put("list", list);
	}
	@GetMapping(value = "goods/{id}")
	public String goods(@PathVariable("id")String id,Model model) {
		GoodsEntity ge = service.goodsPage(id);
		model.addAttribute("list", ge);
		List<ImgsEntity> imgs = service.imgsList(id);
		model.addAttribute("imgs", imgs);
		return "goods";
	}
	@GetMapping(value = "outer")
	public ModelAndView outer() {
		List<GoodsEntity> list = service.goodsList();
//		System.out.println("Goods List: " + list); // 디버깅용 로그
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		return mv;
	}
	@GetMapping(value="join")
	public String join() {
		return "join";
	}
	
	@GetMapping(value = "cart")
	public String cart() {
		return "cart";
	}
}
