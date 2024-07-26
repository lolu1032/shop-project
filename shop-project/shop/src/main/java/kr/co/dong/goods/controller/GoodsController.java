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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
////		System.out.println("Goods List: " + list); // ������ �α�
//		model.put("list", list);
	}

	@GetMapping(value = "goods/{id}")
	public String goods(@PathVariable("id") String id, Model model) {
		GoodsEntity ge = service.goodsPage(id);
		model.addAttribute("list", ge);
		List<ImgsEntity> imgs = service.imgsList(id);
		model.addAttribute("imgs", imgs);
		return "goods";
	}

	@GetMapping(value = "outer")
	public ModelAndView outer() {
		List<GoodsEntity> list = service.goodsList();
//		System.out.println("Goods List: " + list); // ������ �α�
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping(value = "join")
	public String join() {
		return "join";
	}

	@GetMapping(value = "cart")
	public List<GoodsEntity> cart(HttpServletRequest request,Model model) {
	    HttpSession session = request.getSession(false);
	    Map<String, Object> carts = new HashMap<String,Object>();
	    
	    String username;
	    if (session == null) {
	        username = session.getId();
	    } else {
	        username = (String) session.getAttribute("login");
	        if (username == null) {
	            username = session.getId();
	        }
	    }
		List<GoodsEntity> cartList =  service.cartsList(username);
		 model.addAttribute("cart",cartList);
        return cartList;
	}

	@PostMapping(value = "cart")
	public String insertCart(@RequestParam("goodsId") String goodsId, HttpServletRequest request,Model model) {
	    // ���� �α׿� goodsId Ȯ��
//	    System.out.println("goodsId: " + goodsId);
	    
	    HttpSession session = request.getSession(false);
	    Map<String, Object> carts = new HashMap<String,Object>();
	    
	    String username;
	    if (session == null) {
	        username = session.getId();
	    } else {
	        username = (String) session.getAttribute("login");
	        if (username == null) {
	            username = session.getId();
	        }
	    }

	    carts.put("goods_id", goodsId);
	    carts.put("username", username);
//	    System.out.println("username : " + username);

	    // ���� ȣ��
	    service.insertCart(carts);
	    List<GoodsEntity> cartList =  service.cartsList(username);
	    model.addAttribute("cart",cartList);
	    return "cart";
	}
}
