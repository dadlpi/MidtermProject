package com.skilldistillery.chowemporium.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.chowemporium.data.DishDAO;
import com.skilldistillery.chowemporium.data.MealPlanDAO;
import com.skilldistillery.chowemporium.data.UserDAO;
import com.skilldistillery.chowemporium.entities.MealPlan;
import com.skilldistillery.chowemporium.entities.PlannedMeal;
import com.skilldistillery.chowemporium.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class MealPlanController {

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private MealPlanDAO mealPlanDao;
	
	@Autowired
	private DishDAO dishDao;
	
	@RequestMapping(path="addMealPlan.do", method=RequestMethod.POST)
		public String createNewMealPlan(HttpSession session, Model model, MealPlan mealPlan) {
		User user = (User) session.getAttribute("loggedInUser");
		if(user != null) {
			mealPlan = mealPlanDao.createMealPlan(mealPlan, user);
		}
		return "redirect:userHome.do";
	}
	
	@RequestMapping(path="showPlan.do", method=RequestMethod.GET)
	public String showNewMealPlan(HttpSession session, Model model, @RequestParam("planId") Integer planId) {
		User user = (User) session.getAttribute("loggedInUser");
		MealPlan plan = mealPlanDao.findByID(planId);
		if(plan != null) {
			model.addAttribute("mealPlan", plan);
			model.addAttribute("meals", mealPlanDao.findAllMeals());
			model.addAttribute("dishes", dishDao.findAll());
			return "mealPlan";
		}
		return "redirect:userHome.do";
	}
	
	@RequestMapping(path="addMeal.do", method=RequestMethod.POST)
	public String addNewMeal(HttpSession session, Model model, @RequestParam("planId") Integer planId, PlannedMeal plannedMeal) {
		User user = (User) session.getAttribute("loggedInUser");
		MealPlan plan = mealPlanDao.findByID(planId);
		if(plan != null) {
			mealPlanDao.createPlannedMeal(planId, plannedMeal);
			model.addAttribute("mealPlan", plan);
			model.addAttribute("meals", mealPlanDao.findAllMeals());
			return "redirect:showPlan.do?planId=" + planId;
		}
		return "redirect:userHome.do";
	}
	
	
}
