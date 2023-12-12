package com.skilldistillery.jpachowemporium.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.chowemporium.entities.DietCategory;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class DietCategoryTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private DietCategory dietCategory;

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
		dietCategory = em.find(DietCategory.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		dietCategory = null;
	}

	@Test
	void test() {
		assertNotNull(dietCategory);
		assertEquals("Keto", dietCategory.getName());

	}

	@Test
	void test_MTM_dietcategory_to_dish() {
		dietCategory = em.find(DietCategory.class, 10);

		assertNotNull(dietCategory);
		assertTrue(dietCategory.getDishes().size() > 0);
		assertTrue(dietCategory.getDishes().toString().contains("Butter"));
		System.out.println(dietCategory.getDishes().toString());

	}

	@Test
	void test_MTM_DCategory_DRestriction() {
		assertNotNull(dietCategory);
//		assertTrue(dietaryRestriction.getDietCategories().toString().contains("Keto") );
		assertFalse(dietCategory.getDietaryRestriction().size() > 0);
		System.out.println(dietCategory.getDietaryRestriction().toString());

	}

}
