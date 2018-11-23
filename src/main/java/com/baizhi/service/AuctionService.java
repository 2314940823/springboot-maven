package com.baizhi.service;

import com.baizhi.entity.Auction;

import java.util.Date;
import java.util.List;


public interface AuctionService {
	
	public List<Auction> selectAll();
	
	public void add(Auction auction);
	
	public Auction selectOne(int id);
	
	public void update(Auction auction);
	
	public void delete(int id);
	
	public List<Auction> selectByCont(String aname, String desc, Date start_time, Date end_time, Double startPrice);
}
