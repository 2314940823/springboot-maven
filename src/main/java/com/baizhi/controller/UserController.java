package com.baizhi.controller;


import com.baizhi.entity.Users;
import com.baizhi.service.UsersService;
import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
public class UserController {
	@Autowired
	private UsersService us;
	@Autowired
	private Producer producer;
	
	@RequestMapping("/login")
	public String login(String aname,String password,String code,HttpSession session){
		System.out.println("++++++++++++++++++++++++++++");
		String kaptcha = (String) session.getAttribute("kaptcha");
		if(kaptcha.equalsIgnoreCase(code)){
			Users user = us.selectOne(aname, password);
			if(user!=null){
				session.setAttribute("user",user);
				return "redirect:/auction/selectByCont";
			}
		}
		return "login";
	}
	
	@RequestMapping("/reg")
	public String reg(Users user){
		us.reg(user);
		return "login";
	}
	
	//  ������֤��
	@RequestMapping("/code")
	public void kaptcha(HttpSession session,HttpServletResponse response) throws IOException{

		System.out.println("===========================");
		String text = producer.createText();
		System.out.println(text);
		session.setAttribute("kaptcha",text);
		
		BufferedImage image = producer.createImage(text);
		
		ImageIO.write(image, "jpg", response.getOutputStream());
	}
}
