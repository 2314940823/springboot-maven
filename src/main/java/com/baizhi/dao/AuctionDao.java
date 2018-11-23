package com.baizhi.dao;

import com.baizhi.entity.Auction;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;


public interface AuctionDao {
	
	public List<Auction> selectAll();
	
	public void insert(Auction auction);
	
	public Auction selectOne(int id);
	
	public void update(Auction auction);
	
	public void delete(int id);
	
	public List<Auction> selectByCont(@Param("aname") String aname, @Param("desc") String desc, @Param("start") Date start, @Param("end") Date end, @Param("startPrice") Double startPrice);

}
