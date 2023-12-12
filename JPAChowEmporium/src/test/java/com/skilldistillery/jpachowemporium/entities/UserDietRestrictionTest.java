package com.skilldistillery.jpachowemporium.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.chowemporium.entities.UserDietRestriction;
import com.skilldistillery.chowemporium.entities.UserDietRestrictionId;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class UserDietRestrictionTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserDietRestriction userDietRestriction;

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

		UserDietRestrictionId uDRID = new UserDietRestrictionId(1, 1);
		userDietRestriction = em.find(UserDietRestriction.class, uDRID);
	}

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		userDietRestriction = null;
	}

	@Test
	void test() {
		assertNotNull(userDietRestriction);
		assertEquals("Preference", userDietRestriction.getStrictness().getStrictnessLevel());
		assertEquals("Body Building", userDietRestriction.getUserDiet().getName());

	}

}
