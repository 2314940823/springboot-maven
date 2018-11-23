package com.baizhi.entity;

import java.util.Date;

public class Record {
	private int rid;
	private int uid;
	private int aid;
	private Date aucTime;
	private double aucPrice;
	private String uname;
	public Record() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Record(int rid, int uid, int aid, Date aucTime, double aucPrice,
                  String uname) {
		super();
		this.rid = rid;
		this.uid = uid;
		this.aid = aid;
		this.aucTime = aucTime;
		this.aucPrice = aucPrice;
		this.uname = uname;
	}
	
	public Record(int uid, int aid, Date aucTime, double aucPrice, String uname) {
		super();
		this.uid = uid;
		this.aid = aid;
		this.aucTime = aucTime;
		this.aucPrice = aucPrice;
		this.uname = uname;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public Date getAucTime() {
		return aucTime;
	}
	public void setAucTime(Date aucTime) {
		this.aucTime = aucTime;
	}
	public double getAucPrice() {
		return aucPrice;
	}
	public void setAucPrice(double aucPrice) {
		this.aucPrice = aucPrice;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
}
