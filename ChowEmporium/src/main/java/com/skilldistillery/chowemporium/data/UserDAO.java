package com.skilldistillery.chowemporium.data;

import com.skilldistillery.chowemporium.entities.User;

public interface UserDAO {

	User CreateBrandNewUser(User newCreateUser);
	User authenticateUser(String username, String password);
	User updateUser(User user);
	boolean deleteUser(User user);
	
}
