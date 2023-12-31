package com.skilldistillery.jpachowemporium.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.chowemporium.entities.DietaryRestriction;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class DietaryRestrictionTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private DietaryRestriction dietaryRestriction;

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
		dietaryRestriction= em.find(DietaryRestriction.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		
		em.close();
		dietaryRestriction = null;
	}
	
	

	@Test
	void test() {
		assertNotNull(dietaryRestriction);
		assertEquals(dietaryRestriction.getName(), "Nuts");
		
	}

	@Test
	void test_MTM_DCategory_DRestriction() {
		assertNotNull(dietaryRestriction);
//		assertTrue(dietaryRestriction.getDietCategories().toString().contains("Keto") );
		assertFalse(dietaryRestriction.getDietCategories().size() > 0);
		System.out.println(dietaryRestriction.getDietCategories().toString());

	}

}
