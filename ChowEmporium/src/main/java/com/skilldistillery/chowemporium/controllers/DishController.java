package com.skilldistillery.chowemporium.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.chowemporium.data.CategoryDAO;
import com.skilldistillery.chowemporium.data.DishDAO;
import com.skilldistillery.chowemporium.entities.Dish;
import com.skilldistillery.chowemporium.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class DishController {
	
	
	@Autowired
	private DishDAO dishDao;

	@Autowired
	private CategoryDAO categoryDao;
	
	@RequestMapping(path = {"displaySingularMeal.do"})
	public String displaySingularMeal(Model model) {
		
		
		return "displaySingularMeal";
	}

	@RequestMapping(path = {"displayListOfMeals.do"})
	public String displayListOfMeals(Model model) {
		List<Dish > dishes = dishDao.findAll();
		model.addAttribute("dishes", dishes);
		
		return "displayListOfMeals";
	}
	
	
	@RequestMapping(path = {"addDishForm.do"},  method = RequestMethod.GET)
	public String userAddOneDish(Dish dish, Model model) {
		model.addAttribute("cuisines", categoryDao.getCuisines());
		model.addAttribute("restrictions", categoryDao.getDietaryRestrictions());
		model.addAttribute("dietCategories", categoryDao.getDietCategory());
		return "addODish";
	}

	@RequestMapping(path = {"addDishAtDb.do"},  method = RequestMethod.POST)
	public String addOneDish(HttpSession session, Dish dish, ArrayList<String> selectedCuisines, ArrayList<String> selectedRestrictions, ArrayList<String> selectedCategories) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		
		Dish newlyAddedDish = dishDao.createBrandNewDish(loggedInUser.getId(), dish, categoryDao.getCuisines(selectedCuisines), categoryDao.getDietCategory(selectedCategories), categoryDao.getDietaryRestrictions(selectedRestrictions));
	
		return "results";
	}
	


	

}
