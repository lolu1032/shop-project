package kr.co.dong;

import java.text.DateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dong.domain.GoodsDTO;
import kr.co.dong.goods.service.GoodsService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private GoodsService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		
		List<GoodsDTO> list = service.goodsList();
		Collections.shuffle(list); // 리스트를 랜덤하게 섞음
//		System.out.println("Goods List: " + list); // 디버깅용 로그
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("list", list);
		return mv;
		
	}
}
