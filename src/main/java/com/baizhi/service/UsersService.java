package com.baizhi.service;


import com.baizhi.entity.Users;

public interface UsersService {
	
	public Users selectOne(String name, String password);
	
	public void reg(Users user);
}
