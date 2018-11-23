package com.baizhi.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
public class Auction {
	private int aid;
	private String aname;
	private Double startPrice;
	private double upset;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Date start_time;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Date end_time;
	private String img;
	private String desc;
	public Auction() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Auction(int aid, String aname, Double startPrice, double upset,
                   Date start_time, Date end_time, String img, String desc) {
		super();
		this.aid = aid;
		this.aname = aname;
		this.startPrice = startPrice;
		this.upset = upset;
		this.start_time = start_time;
		this.end_time = end_time;
		this.img = img;
		this.desc = desc;
	}
	public Auction(String aname, Double startPrice, double upset,
                   Date start_time, Date end_time, String img, String desc) {
		super();
		this.aname = aname;
		this.startPrice = startPrice;
		this.upset = upset;
		this.start_time = start_time;
		this.end_time = end_time;
		this.img = img;
		this.desc = desc;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public Double getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(Double startPrice) {
		this.startPrice = startPrice;
	}
	public double getUpset() {
		return upset;
	}
	public void setUpset(double upset) {
		this.upset = upset;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	@Override
	public String toString() {
		return "Auction [aid=" + aid + ", aname=" + aname + ", startPrice="
				+ startPrice + ", upset=" + upset + ", start_time="
				+ start_time + ", end_time=" + end_time + ", img=" + img
				+ ", desc=" + desc + "]";
	}
	
	
	
}
