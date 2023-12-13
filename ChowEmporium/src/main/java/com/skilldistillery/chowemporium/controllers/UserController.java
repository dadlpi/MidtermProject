package com.skilldistillery.chowemporium.controllers;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.chowemporium.data.UserDAO;
import com.skilldistillery.chowemporium.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;
	
	
	@RequestMapping(path = {"/", "home.do"})
	public String home(Model model) {
		
		model.addAttribute("SMOKETEST", userDao.authenticateUser("joeadmin", "admin"));
		
		return "home";
	}
	
	@RequestMapping(path = {"displaySingularMeal.do"})
	public String displaySingularMeal(Model model) {
		
		model.addAttribute("SMOKETEST", userDao.authenticateUser("joeadmin", "admin"));
		
		return "displaySingularMeal";
	}

	@RequestMapping(path = {"displayListOfMeals.do"})
	public String displayListOfMeals(Model model) {
		
		model.addAttribute("SMOKETEST", userDao.authenticateUser("joeadmin", "admin"));
		
		return "displayListOfMeals";
	}

	@RequestMapping(path = {"register.do"})
	public String registerUserFormPage(Model model) {
		
		model.addAttribute("SMOKETEST", userDao.authenticateUser("joeadmin", "admin"));
		
		return "register";
	}
	
	@RequestMapping(path = {"registerUserAtDb.do"}, params = {"email","password", "firstName", "lastName"}, method = RequestMethod.POST)
	public String registerUser(@RequestParam("email") String theEmail, @RequestParam("password") String thePassword, 
			@RequestParam("firstName") String theFirstName, @RequestParam("lastName") String theLastName   , Model model) {
		User newCreateUser = new User();
		newCreateUser.setEnabled(true);
		newCreateUser.setUsername(theEmail);
		newCreateUser.setRole("client");
		newCreateUser.setPassword(thePassword);
		newCreateUser.setFirstName(theFirstName);
		newCreateUser.setLastName(theLastName);
		newCreateUser.setEmail(theEmail);
		newCreateUser.setDateCreated(LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS));
		newCreateUser.setLastUpdated(LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS));
		userDao.CreateBrandNewUser(newCreateUser);
		
		return "home";
	}

	@RequestMapping(path = {"login.do"})
	public String loginUser(Model model) {
		
		model.addAttribute("SMOKETEST", userDao.authenticateUser("joeadmin", "admin"));
		
		return "login";
	}
	

}
