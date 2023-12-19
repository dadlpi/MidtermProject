package com.skilldistillery.chowemporium.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.chowemporium.data.CategoryDAO;
import com.skilldistillery.chowemporium.data.DishDAO;
import com.skilldistillery.chowemporium.data.UserDAO;
import com.skilldistillery.chowemporium.entities.Dish;
import com.skilldistillery.chowemporium.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class DishController {
	@Autowired
	private UserDAO userDao;

	@Autowired
	private DishDAO dishDao;

	@Autowired
	private CategoryDAO categoryDao;

	@RequestMapping(path = { "displaySingularMeal.do" })
	public String displaySingularMeal(Model model) {
		Dish dish = dishDao.getRandomDish(1, 7);
		model.addAttribute("singularDish", dish);
		
		return "displaySingularMeal";
	}

	@RequestMapping(path = { "displayListOfMeals.do" })
	public String displayListOfMeals(Model model) {
		List<Dish> dishes = dishDao.findAll();
		model.addAttribute("dishes", dishes);

		return "displayListOfMeals";
	}

	@RequestMapping(path = { "addDishForm.do" }, method = RequestMethod.GET)
	public String userAddOneDish(Dish dish, Model model) {
		model.addAttribute("cuisines", categoryDao.getCuisines());
		model.addAttribute("restrictions", categoryDao.getDietaryRestrictions());
		model.addAttribute("dietCategories", categoryDao.getDietCategory());
		return "addODish";
	}

	@RequestMapping(path = { "addDishAtDb.do" }, method = RequestMethod.POST)
	public String addOneDish(HttpSession session, Dish dish, ArrayList<String> selectedCuisines,
			ArrayList<String> selectedRestrictions, ArrayList<String> selectedCategories) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");

		Dish newlyAddedDish = dishDao.createBrandNewDish(loggedInUser.getId(), dish,
				categoryDao.getCuisines(selectedCuisines), categoryDao.getDietCategory(selectedCategories),
				categoryDao.getDietaryRestrictions(selectedRestrictions));
		refreshSesh(session);
		return "results";
	}

	@RequestMapping(path = { "updateDishForm.do" }, method = RequestMethod.GET)
	public String updateDishForm(@RequestParam("dishId") int dishId, Model model, HttpSession session) {

		model.addAttribute("dish", dishDao.findById(dishId));
		refreshSesh(session);
		return "updateDishForm";
	}

	@RequestMapping(path = { "updateDish.do" }, method = RequestMethod.POST)
	public String updateDish(Dish dish, HttpSession session) {

		dishDao.updateDish(dish);
		refreshSesh(session);

		return "results";
	}

	public void refreshSesh(HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");

		session.setAttribute("loggedInUser", userDao.findUser(user.getId()));

	}

	@RequestMapping(path = { "dishesToUpdate.do" }, method = RequestMethod.GET)
	public String dishesToBechanged(HttpSession session) {
		refreshSesh(session);  //FUNKY DEFECT - we resolved with this refresh
		return "updateDish";
	}

	@RequestMapping(path = { "deleteDishForm.do" }, method = RequestMethod.GET)
	public String deleteDishForm(@RequestParam("dishId") int dishId, Model model, HttpSession session) {
		refreshSesh(session);
		model.addAttribute("dish", dishDao.findById(dishId));

		return "deleteDishForm";
	}
	
	@RequestMapping(path = { "deleteDish.do" }, method = RequestMethod.POST)
	public String deleteDish(Dish dish, HttpSession session) {

		dishDao.deleteDish(dish);
		refreshSesh(session);

		return "results";
	}
	

	@RequestMapping(path = { "dishesToDelete.do" }, method = RequestMethod.GET)
	public String dishesToBeRemoved() {

		return "deleteDish";
	}
	
	@RequestMapping(path = { "mealCalendar.do" }, method = RequestMethod.GET)
	public String mealCalendar() {

		return "mealCalendar";
	}
	
	
	
}
