package com.skilldistillery.chowemporium.controllers;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.chowemporium.data.MealPlanDAO;
import com.skilldistillery.chowemporium.data.UserDAO;
import com.skilldistillery.chowemporium.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private MealPlanDAO mealPlanDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home() {
		
		return "home";
	}

	@RequestMapping(path = { "register.do" })
	public String registerUserFormPage(Model model) {

		return "register";
	}

//	@RequestMapping(path = { "registerUserAtDb.do" }, params = { "email", "password", "firstName",
//			"lastName" }, method = RequestMethod.POST)
//	public String registerUser(@RequestParam("email") String theEmail, @RequestParam("password") String thePassword,
//			@RequestParam("firstName") String theFirstName, @RequestParam("lastName") String theLastName, 
//			HttpSession session) {
	@RequestMapping(path = { "registerUserAtDb.do" }, method = RequestMethod.POST)
		public String registerUser(User user, HttpSession session) {
		User newCreateUser = new User();
		newCreateUser.setEnabled(true);
		newCreateUser.setUsername(user.getUsername());
		newCreateUser.setRole("client");
		newCreateUser.setPassword(user.getPassword());
		newCreateUser.setFirstName(user.getFirstName());
		newCreateUser.setLastName(user.getLastName());
		newCreateUser.setEmail(user.getEmail());
		newCreateUser.setAboutMe(user.getAboutMe());
		newCreateUser.setDateCreated(LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS));
		newCreateUser.setLastUpdated(LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS));
		newCreateUser = userDao.CreateBrandNewUser(newCreateUser);

		session.setAttribute("loggedInUser", newCreateUser);
		return "userHome";
	}

	@RequestMapping(path = { "navbar.do" }, method = RequestMethod.POST)
	public String loginUser(User user, HttpSession session) {
		System.out.println(user + "******************");
		User validateUser = userDao.authenticateUser(user.getUsername(), user.getPassword());
		if (validateUser == null) {
			return "register";

		} else {
			session.setAttribute("loggedInUser", validateUser);
			return "redirect:userHome.do";
		}
	}

	@RequestMapping(path = { "updateUserForm.do" }, method = RequestMethod.GET)
	public String updateUserForm() {
		return "updateUserForm";
	}

	@RequestMapping(path = { "userHome.do" }, method = RequestMethod.GET)
	public String userHome(HttpSession session, Model model) {
		User controllerUser = (User) session.getAttribute("loggedInUser");
		refreshSesh(session);
		if (controllerUser != null) {
			model.addAttribute("mealPlans", mealPlanDao.findAllForUser(controllerUser.getId()));
			return "userHome";
		}
		return "home";
	}

	@RequestMapping(path = { "updateUserAtDb.do" }, method = RequestMethod.POST)
	public String updateUser(User user, HttpSession session) {
		User controllerUser = (User) session.getAttribute("loggedInUser");

		user.setId(controllerUser.getId());

		user = userDao.updateUser(user);

		session.setAttribute("loggedInUser", user);

		return "results";

	}

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {

		session.removeAttribute("loggedInUser");

		return "home";
	}
	
	public void refreshSesh(HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");

		session.setAttribute("loggedInUser", userDao.findUser(user.getId()));

	}

}
