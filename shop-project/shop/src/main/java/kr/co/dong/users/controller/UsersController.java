package kr.co.dong.users.controller;

import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.cj.Session;

import kr.co.dong.domain.UsersDTO;
import kr.co.dong.users.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService service;

	@GetMapping(value = "join")
	public String join() {
		return "join";
	}

	@PostMapping(value = "join")
	public String insertJoin(@RequestParam("id") String id, @RequestParam("password") String password,
			@RequestParam("confirm_password") String confirm_password, @RequestParam("name") String name,
			@RequestParam("phone") String phone, @RequestParam("email") String email, Model model) {

		model.addAttribute("id", id);
		model.addAttribute("password", password);
		model.addAttribute("confirm_password", confirm_password);
		model.addAttribute("name", name);
		model.addAttribute("phone", phone);
		model.addAttribute("email", email);
		
		UsersDTO usersEntity = new UsersDTO();

		if (!Pattern.matches("^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$", id)) {
			model.addAttribute("loginError", "¾ÆÀÌµð´Â 5ÀÚ ÀÌ»ó 12ÀÚ ÀÌÇÏ, ¿µ¹®ÀÚ·Î ½ÃÀÛÇØ¾ß ÇÏ¸ç ¿µ¹®ÀÚ, ¼ýÀÚ, ¹ØÁÙ(_)¸¸ »ç¿ëÇÒ ¼ö ÀÖ½À´Ï´Ù.");
			return "join";
		}
		if (!Pattern.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{5,}$", password)) {
			model.addAttribute("pwError", "ºñ¹Ð¹øÈ£´Â ÃÖ¼Ò 5ÀÚ ÀÌ»ó, ¼ýÀÚ, ´ë¹®ÀÚ, ¼Ò¹®ÀÚ°¡ Æ÷ÇÔµÇ¾î¾ß ÇÕ´Ï´Ù.");
			return "join";
		}
		if (!Pattern.matches("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)*(\\.[a-zA-Z]{2,})$", email)) {
			model.addAttribute("emailError", "¿Ã¹Ù¸¥ ÀÌ¸ÞÀÏ Çü½ÄÀÌ ¾Æ´Õ´Ï´Ù.");
			return "join";
		}
		if (!Pattern.matches("^\\d{3}-\\d{3,4}-\\d{4}$", phone)) {
			model.addAttribute("numberError", "ÀüÈ­¹øÈ£´Â 010-1234-5678 Çü½ÄÀ¸·Î ÀÔ·ÂÇØÁÖ¼¼¿ä.(-Æ÷ÇÔ)");
			return "join";
		}
		if (!Pattern.matches("[°¡-ÆR]*$", name)) {
			model.addAttribute("nameError", "ÀÌ¸§Àº ÇÑ±Û¸¸ ÀÔ·Â °¡´ÉÇÕ´Ï´Ù.");
			return "join";
		}
		String checkEmail = service.checkEmail(email);
		usersEntity.setLogin(id);
		usersEntity.setPw(password);
		usersEntity.setName(name);
		usersEntity.setNumber(phone);
		if (checkEmail != null) {
			model.addAttribute("checkEmail", "Áßº¹µÈ ÀÌ¸ÞÀÏÀÌ ÀÖ½À´Ï´Ù.");
			return "join";
		}
		usersEntity.setEmail(email);

		int result = service.insertUsers(usersEntity);

		return "login";
	}

	// GetMappingÀ» ÇÏÁö¾ÊÀ¸¸é 405¿À·ù °É¸²
	@GetMapping(value = "login")
	public String login() {
		return "login";
	}

	// ·Î±×ÀÎ ¼¼¼Ç
	@PostMapping(value = "login")
	public String loginForm(@RequestParam(value = "id") String id, @RequestParam(value = "pw") String pw, Model model,
			HttpServletRequest request) {
		if (id == null || pw == null) {
			return "login";
		}
		UsersDTO ue = new UsersDTO();
		ue.setLogin(id);
		ue.setPw(pw);

		UsersDTO sucess = service.success(ue);
		if (sucess == null) {
			model.addAttribute("error", "¾ÆÀÌµð ¶Ç´Â ºñ¹Ð¹øÈ£°¡ Æ²·È½À´Ï´Ù.");
			return "login";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("user", sucess);
			session.setAttribute("username", sucess.getName());
			session.setAttribute("login", sucess.getLogin());
			return "redirect:/";
		}
	}

	@PostMapping(value = "joinForm")
	@ResponseBody
	public String check(@RequestParam("id") String id,Model model) {
		int checked = service.checkId(id);
		if (!Pattern.matches("^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$", id)) {
			return "reguxError";
		}else if(checked == 1) {
			return "duplicateError";
		}
		return "sucess";
	}

	@RequestMapping(value = { "logout", "goods/logout" })
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		String referer = request.getHeader("Referer"); // ÀÌÀü url·Î µ¹¾Æ°¡±âÀ§ÇØ»ç¿ë
		return "redirect:" + referer;
	}
}