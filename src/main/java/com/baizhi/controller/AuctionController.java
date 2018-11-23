package com.baizhi.controller;

import com.baizhi.entity.Auction;
import com.baizhi.service.AuctionService;
import com.baizhi.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/auction")
public class AuctionController {
	@Autowired
	private AuctionService as;
	
	@Autowired
	private RecordService rs;
	
	@RequestMapping("/selectAll")
	public String selectAll(HttpServletRequest request){
		List<Auction> aucList = as.selectAll();
		request.setAttribute("aucList", aucList);
		return "private/main";
	}
	
	@RequestMapping("/selectByCont")
	public String selectByCont(String aname,String desc,Date start_time,Date end_time,Double startPrice,HttpServletRequest request){
        System.out.println("·····进入条件查询集合方法（）（）（）······");
	    System.out.println(aname+"*********************");
		System.out.println(desc+"*********************");
		System.out.println(start_time+"*********************");
		System.out.println(end_time+"*********************");
		System.out.println(startPrice+"*********************");
		
		aname = "%"+aname+"%";
		System.out.println(aname+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		desc = "%"+desc+"%";
		List<Auction> aucList = as.selectByCont(aname,desc,start_time,end_time,startPrice);
		for (Auction auction : aucList) {
			System.out.println(auction);
		}
		request.setAttribute("aucList", aucList);
		return "private/main";
	}
	
	@RequestMapping("/delete")
	public String delete(int id){
		System.out.println(id+"】】】】】  进入删除方法   【【【【【【【");
		//rs.delete(id);
		as.delete(id);
		return "redirect:/auction/selectByCont";
	}
	
	@RequestMapping("/add")
	public String add(Auction auction,MultipartFile auction_img) throws IOException{
        System.out.println("========进入添加方法（）（）===============");
	    String fileName = auction_img.getOriginalFilename();
		fileName = new Date().getTime()+"_"+fileName;
		auction_img.transferTo(new File("E:\\project_final\\springboot-maven\\src\\main\\webapp\\images\\"+fileName));
		auction.setImg(fileName);
		as.add(auction);
		return "redirect:/auction/selectByCont";
	}
	
	@RequestMapping("/selectOne")
	public String selectOne(int id,Map map){
		Auction auction = as.selectOne(id);
		map.put("auction", auction);
		return "private/update";
	}
	
	@RequestMapping("/update")
	public String update(Auction auction,MultipartFile auction_img) throws IOException{
        System.out.println("--------进入更新方法（）（）-----------");
		String fileName = auction_img.getOriginalFilename();
		fileName = new Date().getTime()+"_"+fileName;
		System.out.println(fileName+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		auction_img.transferTo(new File("E:\\project_final\\springboot-maven\\src\\main\\webapp\\images\\"+fileName));
		auction.setImg(fileName);
		System.out.println(auction+"������������������������������������");
		as.update(auction);
		return "redirect:/auction/selectByCont";
	}
}
