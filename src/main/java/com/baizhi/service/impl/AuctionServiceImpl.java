package com.baizhi.service.impl;

import com.baizhi.dao.AuctionDao;
import com.baizhi.entity.Auction;
import com.baizhi.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;


@Service
@Transactional
public class AuctionServiceImpl implements AuctionService {
	
	@Autowired
	private AuctionDao auctionDao;


	public List<Auction> selectAll() {
		return auctionDao.selectAll();
	}

	public void add(Auction auction) {
		auctionDao.insert(auction);
	}

	public Auction selectOne(int id) {
		return auctionDao.selectOne(id);
	}

	public void update(Auction auction) {
		auctionDao.update(auction);
	}

	public void delete(int id) {
		auctionDao.delete(id);
	}

	public List<Auction> selectByCont(String aname, String desc, Date start_time, Date end_time, Double startPrice) {
		return auctionDao.selectByCont(aname,desc,start_time,end_time,startPrice);
	}
}
