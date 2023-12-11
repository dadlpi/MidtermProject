package com.skilldistillery.jpachowemporium.entities;

import static org.junit.jupiter.api.Assertions.assertNull;

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
		
		emf= Persistence.createEntityManagerFactory("JPAChowEmporium");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		
		em = emf.createEntityManager();
		dietCategory= em.find(DietCategory.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		
		em.close();
		dietCategory = null;
	}
	
	

	@Test
	void test() {
		assertNull(dietCategory);
		
	}

}
