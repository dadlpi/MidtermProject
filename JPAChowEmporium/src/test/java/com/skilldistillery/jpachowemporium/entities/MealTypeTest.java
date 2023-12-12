package com.skilldistillery.jpachowemporium.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.chowemporium.entities.MealType;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class MealTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private MealType mealType;

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
		mealType = em.find(MealType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		mealType = null;
	}

	@Test
	void test() {
		assertNotNull(mealType);
		assertEquals("Meal", mealType.getName());

	}

	@Test
	void test_OTM_dishes() {
		assertNotNull(mealType);
		assertTrue(mealType.getListODishes().toString().contains("Easy"));
		assertTrue(mealType.getListODishes().size() > 0);

	}

}
