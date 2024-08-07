package kr.co.dong.goods.controller;

import java.util.Collections;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dong.domain.CartsDTO;
import kr.co.dong.domain.GoodsDTO;
import kr.co.dong.domain.ImgsDTO;
import kr.co.dong.goods.service.GoodsService;

@Controller
public class GoodsController {
	@Autowired
	private GoodsService service;

	@GetMapping(value = "goods/{id}")
	public String goods(@PathVariable("id") String id, Model model) {
		GoodsDTO ge = service.goodsPage(id);
		model.addAttribute("list", ge);
		List<ImgsDTO> imgs = service.imgsList(id);
		model.addAttribute("imgs", imgs);
		return "goods";
	}

	@GetMapping(value = {"outer","top","pants"})
	public ModelAndView outer() {
		List<GoodsDTO> list = service.goodsList();
		Collections.shuffle(list); // 리스트를 랜덤하게 섞음
//		System.out.println("Goods List: " + list); // 디버깅용 로그
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping(value = { "cart", "payment" })
	public List<GoodsDTO> cart(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		
		Map<String, Object> carts = new HashMap<String, Object>();
		Map<String, Object> log = new HashMap<String, Object>();
		
		String username = getUsersFromSession(session);
		String oldUsername;
		if(session == null) {
			oldUsername = "Guest-" + System.currentTimeMillis();
		}else {
			oldUsername = session.getId();			
		}
		log.put("oldUsername", oldUsername);			
		log.put("username", username);
		service.updateCartsUsername(log);
		List<GoodsDTO> cartList = service.cartsList(username);
		model.addAttribute("usernames", username);
		model.addAttribute("cart", cartList);
		return cartList;
	}

	@PostMapping(value = { "cart", "payment" })
	public String insertCart(@RequestParam("goodsId") String goodsId, HttpServletRequest request, Model model) {
		// 서버 로그에 goodsId 확인
//	    System.out.println("goodsId: " + goodsId);

		HttpSession session = request.getSession(false);
		Map<String, Object> carts = new HashMap<String, Object>();

		String username = getUsersFromSession(session);

		carts.put("goodsid", goodsId);
		carts.put("username", username);
		
		// 서비스 호출
		service.insertCart(carts);
		List<GoodsDTO> cartList = service.cartsList(username);
		model.addAttribute("usernames", username);
		model.addAttribute("cart", cartList);
		model.addAttribute("goodsId", goodsId);

		// value가 두개여서 만약 requestUTI가 payment면 payment를 리턴하고 아니면 cart리턴!
		String requestURI = request.getRequestURI();
		if (requestURI.contains("payment")) {
			return "payment";
		} else {
			return "cart";
		}
	}

	@GetMapping(value = "delete")
	public String deleteCartsList(@RequestParam("cartsId") String cartsId) {
		service.deleteCartsList(cartsId);
		return "redirect:/cart";
	}
	private String getUsersFromSession(HttpSession session) {
		if(session == null) {
			return "Guest-" + System.currentTimeMillis();
		}else {			
			String username = (String) session.getAttribute("login");
			return (username!= null) ? username : session.getId();
		}
	}

}
