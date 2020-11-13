package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.UserVO;
import com.example.mapper.MessageMapper;
import com.example.mapper.UserMapper;

@Controller
public class UserController {
	@Autowired
	UserMapper mapper;
	
	@Autowired
	MessageMapper mMapper;
	
	@RequestMapping("list")
	public void list(Model model){
		model.addAttribute("list", mapper.list());
		
	}
	@RequestMapping("send") //보낸메시지
    public void send(Model model, String uid){
    	model.addAttribute("vo",mapper.read(uid));
    	model.addAttribute("list",mapper.list());
    }
	
	@ResponseBody
	@RequestMapping("read")
	public UserVO read(String uid){
		return mapper.read(uid);
	}
	@RequestMapping("receive") //받은메시지
    public void receive(Model model, String uid){
    	model.addAttribute("vo",mapper.read(uid));
    }
}
