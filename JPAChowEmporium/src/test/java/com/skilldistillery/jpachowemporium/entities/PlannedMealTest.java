package com.skilldistillery.jpachowemporium.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.chowemporium.entities.PlannedMeal;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class PlannedMealTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private PlannedMeal plannedMeal;

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
		plannedMeal= em.find(PlannedMeal.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		
		em.close();
		plannedMeal = null;
	}
	
	

	@Test
	void test() {
		assertNotNull(plannedMeal);
		assertEquals(plannedMeal.getDayOfWeek(), 1);
		
	}

}
