package com.skilldistillery.chowemporium.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.chowemporium.data.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;
	

}
