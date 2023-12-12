package com.skilldistillery.jpachowemporium.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.chowemporium.entities.Dish;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class DishTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Dish dish;

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
		dish = em.find(Dish.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		dish = null;
	}

	@Test
	void test() {
		assertNotNull(dish);
		assertEquals("Easy Butter Chicken", dish.getName());
	}

	@Test
	void test_planned_meal_connection() {
		assertNotNull(dish);
		assertTrue(dish.getDishOPlannedMeals().size() > 0);
	}

	@Test
	void test_cuisine_connection() {
		assertNotNull(dish);
		assertTrue(dish.getListOfCuisine().size() > 0);
		assertEquals(dish.getListOfCuisine().get(1).getName(), "Italian");
	}

	@Test
	void test_MTO_dish_mealType() {
		assertNotNull(dish);
		assertEquals(dish.getMealType().getName(), "Meal");

	}

}
