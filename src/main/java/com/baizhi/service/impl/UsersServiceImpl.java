package com.baizhi.service.impl;


import com.baizhi.dao.UsersDao;
import com.baizhi.entity.Users;
import com.baizhi.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDao userDao;


	public Users selectOne(String name, String password) {
		return userDao.selectOne(name,password);
	}

	public void reg(Users user) {
		userDao.reg(user);
	}
}
