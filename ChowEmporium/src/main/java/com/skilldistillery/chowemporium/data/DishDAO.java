package com.skilldistillery.chowemporium.data;

import java.util.List;

import com.skilldistillery.chowemporium.entities.Dish;

public interface DishDAO {
	Dish CreateBrandNewDish(Dish newCreateDish);
	Dish updateDish(Dish dish);
	boolean deleteDish(Dish dish);
	List<Dish> findAll();
}
