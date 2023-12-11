package com.skilldistillery.jpachowemporium.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.chowemporium.entities.Cuisine;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class CuisineTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Cuisine cuisine;

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
		cuisine= em.find(Cuisine.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		
		em.close();
		cuisine = null;
	}
	
	

	@Test
	void test() {
		assertNotNull(cuisine);
		assertEquals("Mexican", cuisine.getName());
		
	}

}
