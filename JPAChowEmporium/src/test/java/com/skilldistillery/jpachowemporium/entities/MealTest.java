package com.skilldistillery.jpachowemporium.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.chowemporium.entities.Meal;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class MealTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Meal meal;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		
		emf= Persistence.createEntityManagerFactory("JPAChowEmporium");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		
		em = emf.createEntityManager();
		meal= em.find(Meal.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		
		em.close();
		meal = null;
	}
	
	

	@Test
	void test() {
		assertNotNull(meal);
		assertEquals("Breakfast", meal.getName());
		
	}
	
	@Test
	void test_planned_meal() {
		meal = em.find(Meal.class, 2);
		assertNotNull(meal);
		assertTrue(meal.getPlannedMeals().size() > 0);
		System.out.println(meal.getPlannedMeals());
		
	}

}
