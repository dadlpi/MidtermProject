package com.skilldistillery.jpachowemporium.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.chowemporium.entities.Strictness;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class StrictnessTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Strictness strictness;

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
		strictness= em.find(Strictness.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		
		em.close();
		strictness = null;
	}
	
	

	@Test
	void test() {
		assertNotNull(strictness);
		assertEquals("Preference", strictness.getStrictnessLevel());
		
	}

}
