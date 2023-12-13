package com.skilldistillery.chowemporium.data;

import java.util.List;

import com.skilldistillery.chowemporium.entities.Dish;
import com.skilldistillery.chowemporium.entities.User;

public interface UserDAO {

	User CreateBrandNewUser(User newCreateUser);
	User authenticateUser(String username, String password);
	User updateUser(User user);
	boolean deleteUser(User user);
	Dish CreateBrandNewDish(Dish newCreateDish);
	Dish updateDish(Dish dish);
	boolean deleteDish(Dish dish);
	List<Dish> findAll();
}
