package kr.co.dong.users.service;


import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.domain.UsersEntity;
import kr.co.dong.users.dao.UsersDAO;

@Service
public class UserServiceImpl implements UsersService{
	@Autowired
	private UsersDAO dao;
	
	@Override
	public int insertUsers(UsersEntity ue) {
//		가독성을 위해서 enum 알아보기
		if(!Pattern.matches("^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$", ue.getLogin())) {
			return 2;			
		}else if(!Pattern.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{5,}$", ue.getPw())) {
			return 3;
		}else if(!Pattern.matches("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)*(\\.[a-zA-Z]{2,})$", ue.getEmail()) ) {
			return 4;
		}else if(!Pattern.matches("^\\d{3}-\\d{3,4}-\\d{4}$", ue.getNumber())) {
			return 5;
		}else if(!Pattern.matches("[가-힣]*$", ue.getName())) {
			return 6;
		}
		return dao.insertUsers(ue);
	}
	// 커스텀인셉션으로 컨트롤에 있는 오류메시지를 관리 <-- 알아보기
	@Override
	public int checkId(String id) {
		return dao.checkId(id);
	}

	@Override
	public UsersEntity success(UsersEntity ue) {
		return  dao.success(ue);
	}
	
}
