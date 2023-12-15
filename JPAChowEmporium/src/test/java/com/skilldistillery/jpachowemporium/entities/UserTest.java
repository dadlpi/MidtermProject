package com.skilldistillery.jpachowemporium.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.chowemporium.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {

		emf = Persistence.createEntityManagerFactory("JPAChowEmporium");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {

		em = emf.createEntityManager();
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		user = null;
	}

	@Test
	void test() {
		assertNotNull(user);
		assertEquals("joeadmin", user.getUsername());
	}

	@Test
	void test_favorite_dish_connection() {
		assertNotNull(user);
		assertTrue(user.getFavoriteDishList().toString().contains("Butter"));
		assertTrue(user.getFavoriteDishList().size() > 0);

	}

	@Test
	void test_dish_rating_connection() {
		assertNotNull(user);
		assertTrue(user.getRatedDishes().toString().contains("Butter"));
		assertTrue(user.getRatedDishes().size() > 0);

	}

	@Test
	void test_userDiet_connection() {
		assertNotNull(user);
		assertTrue(user.getUserDiets().toString().contains("Body Building"));
		assertTrue(user.getUserDiets().size() > 0);

	}

	@Test
	void test_mealPlan_connection() {
		assertNotNull(user);
		assertTrue(user.getMealPlans().toString().contains("Champ's"));
		assertTrue(user.getMealPlans().size() > 0);

	}
	@Test
	void test_dish_connection() {
//		user = em.find(User.class, 1);
		assertNotNull(user);
		assertTrue(user.getUserCreatedDishes().size() >0 );
		assertTrue(user.getUserCreatedDishes().toString().contains("Veggie"));
		System.out.println(user.getUserCreatedDishes());
		
	}

}
