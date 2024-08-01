package kr.co.dong.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dong.domain.OrdersEntity;
import kr.co.dong.domain.UsersEntity;
import kr.co.dong.payment.service.PaymentService;
@Controller
public class PaymentController {
	@Autowired
	private PaymentService service;
	
	@PostMapping(value="paymentPay")
	@ResponseBody
	public String payment(
			@RequestParam("amount") int amount,@RequestParam("imp_uid") String imp,
			@RequestParam("merchant_uid") String merchant, @RequestParam("buyer_email") String email,
			@RequestParam("buyer_name") String name, @RequestParam("buyer_tel") String tel,
			@RequestParam("buyer_addr") String addr,@RequestParam("username") String username
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addr", addr);
		map.put("name", name);
		map.put("merchant",merchant);
		map.put("payPrice", amount);
		map.put("number",tel);
		map.put("imp", imp);
		String guest = service.selectUsersId(username);
		if(guest == null) {
			map.put("username", username);
			map.put("email", email);				
			service.insertGuest(map);
		}
		map.put("email",email);
		map.put("username", username);
		service.insertOrders(map);
		service.moveCartData(username);
		service.deleteOrdersList(username);
		return "/";
	}
	
	@PostMapping(value="checkEmail")
	@ResponseBody
	public String checkEmail(@RequestParam("email") String email) {
		String isDuplicate = service.checkEmail(email);
		if(isDuplicate == null) {
			return "success";
		}else {
			return "duplicationEmail";
		}
	}
	
	
	
	@GetMapping(value = "ordersDetail")
	public String ordersDetail(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		String username = getUserNameFromSession(session);
		List<OrdersEntity> ordersList =  service.orderDetailList(username);
		for(int i = 0; i < ordersList.size();i++) {
			OrdersEntity oe = ordersList.get(i);			
			model.addAttribute("oe", oe);
		}
		model.addAttribute("ordersList", ordersList);
		return "ordersDetail";
	}
	
	@GetMapping(value="nonMemberOrdersDetail")
	public String nonMemberOrdersDetail() {
		return "nonMemberOrdersDetail";
	}
	@PostMapping(value = "nonMemberOrdersDetail")
	public String nonMemberOrdersDetailForm(@RequestParam("email") String email,Model model) {
		String username = service.selectGuestEmail(email);
		
		if(username == null) {
			model.addAttribute("error", "이메일이 존재하지않습니다.");
			return "nonMemberOrdersDetail";
		}else {
			List<OrdersEntity> ordersList = service.orderDetailList(username);
			model.addAttribute("ordersList", ordersList);
			for(int i = 0; i < ordersList.size();i++) {
				OrdersEntity oe = ordersList.get(i);			
				model.addAttribute("oe", oe);
			}
			return "ordersDetail";
		}
	}
	private String getUserNameFromSession(HttpSession session) {
		if(session == null) {
			return "Guest-" + System.currentTimeMillis();
		}else {			
			String username = (String) session.getAttribute("login");
			return (username!= null) ? username : session.getId();
		}
	}
}
