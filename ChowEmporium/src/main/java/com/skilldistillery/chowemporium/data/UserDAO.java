package com.skilldistillery.chowemporium.data;

import com.skilldistillery.chowemporium.entities.User;

public interface UserDAO {

	User authenticateUser(String username, String password);
}
