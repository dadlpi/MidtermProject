package com.skilldistillery.jpachowemporium.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.chowemporium.entities.MealPlan;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class MealPlanTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private MealPlan mealPlan;

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
		mealPlan= em.find(MealPlan.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		
		em.close();
		mealPlan = null;
	}
	
	

	@Test
	void test() {
		assertNotNull(mealPlan);
		assertEquals("Champ's Meal", mealPlan.getTitle());
		
	}
	
}
