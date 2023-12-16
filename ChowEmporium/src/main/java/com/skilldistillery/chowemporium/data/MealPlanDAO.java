package com.skilldistillery.chowemporium.data;

import java.util.List;

import com.skilldistillery.chowemporium.entities.Meal;
import com.skilldistillery.chowemporium.entities.MealPlan;
import com.skilldistillery.chowemporium.entities.PlannedMeal;
import com.skilldistillery.chowemporium.entities.User;

public interface MealPlanDAO {

	public List<MealPlan> findAllForUser(int userId);
	public MealPlan findByID(int mealPlanId);
	public MealPlan createMealPlan(MealPlan mealPlan, User user);
	public List<Meal> findAllMeals();
	public PlannedMeal createPlannedMeal(int mealPlanId, PlannedMeal plannedMeal);
	
}
