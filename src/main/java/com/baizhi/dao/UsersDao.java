package com.baizhi.dao;



import com.baizhi.entity.Users;
import org.apache.ibatis.annotations.Param;


public interface UsersDao {
	
	public Users selectOne(@Param("name") String name, @Param("password") String password);
	
	public void reg(Users user);
}
