package com.crm.controller;

import com.crm.model.User;
import com.crm.service.UserService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;



@Controller
@Scope(value="prototype")
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userService;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(User user,Model model) throws Exception {
		user=userService.checkLogin(user.getName(), user.getPassword());
		if(user!=null){
			//model.addAttribute("retCode", 0);
			model.addAttribute(user);
			return "friends";
		}
		//model.addAttribute("retCode", 1);
		return "fail";
	}
}
