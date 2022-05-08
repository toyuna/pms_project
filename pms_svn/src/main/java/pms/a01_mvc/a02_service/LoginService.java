package pms.a01_mvc.a02_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a01_mvc.a03_dao.LoginDao;
import pms.a02_vo.PmsMember;

@Service
public class LoginService {
	
	@Autowired
	private LoginDao dao;
	
	public PmsMember login(PmsMember login) {
		return dao.login(login);
	}
}
