package com.skilldistillery.jpachowemporium.entities;

import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.chowemporium.entities.UserDiet;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class UserDietTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserDiet userDiet;

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
		userDiet= em.find(UserDiet.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		
		em.close();
		userDiet = null;
	}
	
	

	@Test
	void test() {
		assertNull(userDiet);
		
	}

}
