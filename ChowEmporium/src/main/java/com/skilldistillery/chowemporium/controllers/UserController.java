package com.skilldistillery.chowemporium.controllers;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.chowemporium.data.UserDAO;
import com.skilldistillery.chowemporium.entities.Dish;
import com.skilldistillery.chowemporium.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;
	
	
	@RequestMapping(path = {"/", "home.do"})
	public String home() {
		return"home";
	}
	
	@RequestMapping(path = {"displaySingularMeal.do"})
	public String displaySingularMeal(Model model) {
		
		
		return "displaySingularMeal";
	}

	@RequestMapping(path = {"displayListOfMeals.do"})
	public String displayListOfMeals(Model model) {
		List<Dish > dishes = userDao.findAll();
		model.addAttribute("dishes", dishes);
		
		return "displayListOfMeals";
	}

	@RequestMapping(path = {"register.do"})
	public String registerUserFormPage(Model model) {
		
		
		return "register";
	}
	
	@RequestMapping(path = {"registerUserAtDb.do"}, params = {"email","password", "firstName", "lastName"}, method = RequestMethod.POST)
	public String registerUser(@RequestParam("email") String theEmail, @RequestParam("password") String thePassword, 
			@RequestParam("firstName") String theFirstName, @RequestParam("lastName") String theLastName   , HttpSession session) {
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
		newCreateUser = userDao.CreateBrandNewUser(newCreateUser);
		
		session.setAttribute("loggedInUser", newCreateUser);
		return "userHome";
	}

	@RequestMapping(path = {"navbar.do"}, method = RequestMethod.POST)
	public String loginUser(User user, HttpSession session ) {
		
		System.out.println(user+"******************");
		User validateUser = userDao.authenticateUser(user.getUsername(), user.getPassword());
		if (validateUser == null) {
			return "register";
			
		} else {
			session.setAttribute("loggedInUser", validateUser);
			return "userHome";
		}
		
	}
	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {

		session.removeAttribute("loggedInUser");

		return "home";
	}
	

}
