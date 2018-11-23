package com.baizhi.entity;

public class Users {
	private int uid;
	private String uname;
	private String password;
	private String card;
	private String tel;
	private String address;
	private String postNumber;
	private int admin;
	private String question;
	private String answer;
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Users(int uid, String uname, String password, String card,
                 String tel, String address, String postNumber, int admin,
                 String question, String answer) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.password = password;
		this.card = card;
		this.tel = tel;
		this.address = address;
		this.postNumber = postNumber;
		this.admin = admin;
		this.question = question;
		this.answer = answer;
	}
	public Users(String uname, String password, String card, String tel,
                 String address, String postNumber, int admin, String question,
                 String answer) {
		super();
		this.uname = uname;
		this.password = password;
		this.card = card;
		this.tel = tel;
		this.address = address;
		this.postNumber = postNumber;
		this.admin = admin;
		this.question = question;
		this.answer = answer;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostNumber() {
		return postNumber;
	}
	public void setPostNumber(String postNumber) {
		this.postNumber = postNumber;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "Users [uid=" + uid + ", uname=" + uname + ", password="
				+ password + ", card=" + card + ", tel=" + tel + ", address="
				+ address + ", postNumber=" + postNumber + ", admin=" + admin
				+ ", question=" + question + ", answer=" + answer + "]";
	}
	
}
