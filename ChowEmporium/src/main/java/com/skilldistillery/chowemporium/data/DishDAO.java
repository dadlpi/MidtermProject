package com.skilldistillery.chowemporium.data;

import java.util.List;

import com.skilldistillery.chowemporium.entities.Cuisine;
import com.skilldistillery.chowemporium.entities.DietCategory;
import com.skilldistillery.chowemporium.entities.DietaryRestriction;
import com.skilldistillery.chowemporium.entities.Dish;

public interface DishDAO {
	Dish createBrandNewDish(int userId, Dish newDish, List<Cuisine> cuisines, List<DietCategory> dietCategories, List<DietaryRestriction> dietRestrictions);
	Dish updateDish(Dish dish);
	boolean deleteDish(Dish dish);
	List<Dish> findAll();
	Dish findById(int dishId);
}
