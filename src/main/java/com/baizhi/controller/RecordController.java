package com.baizhi.controller;


import com.baizhi.entity.Auction;
import com.baizhi.entity.Record;
import com.baizhi.entity.Users;
import com.baizhi.service.AuctionService;
import com.baizhi.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/record")
public class RecordController {
	@Autowired
	private RecordService rs;
	@Autowired
	private AuctionService as;
	
	@RequestMapping("/recordAll")
	public String recordAll(int aid,Map map){
		Auction auction = as.selectOne(aid);
		List<Record> recList = rs.selectAll(aid);
		map.put("auction", auction);
		map.put("recList", recList);
		return "private/acution";
	}
	
	@RequestMapping("/auction")
	public String auction(Record record,HttpSession session){
		Users user = (Users) session.getAttribute("user");
		record.setUid(user.getUid());
		record.setUname(user.getUname());
		rs.add(record);
		System.out.println(record+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		return "redirect:/record/recordAll.do?aid="+record.getAid();
	}
}
