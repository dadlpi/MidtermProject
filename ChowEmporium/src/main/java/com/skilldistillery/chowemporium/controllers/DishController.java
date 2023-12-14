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

import com.skilldistillery.chowemporium.data.DishDAO;
import com.skilldistillery.chowemporium.entities.Dish;
import com.skilldistillery.chowemporium.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class DishController {
	
	
	@Autowired
	private DishDAO dishDao;
	
	
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

	@RequestMapping(path = {"addODish.do"},  method = RequestMethod.GET)
	public String addOneDish(Dish dish, HttpSession session) {
		
		return "results";
	}


	

}
