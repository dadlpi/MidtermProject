package com.skilldistillery.chowemporium.data;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.chowemporium.entities.Meal;
import com.skilldistillery.chowemporium.entities.MealPlan;
import com.skilldistillery.chowemporium.entities.PlannedMeal;
import com.skilldistillery.chowemporium.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class MealPlanDaoImpl implements MealPlanDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<MealPlan> findAllForUser(int userId) {
		String jpql = "SELECT p FROM MealPlan p WHERE p.user.id = :id";
		
	return	em.createQuery(jpql, MealPlan.class).setParameter("id", userId).getResultList();
		
		
	}
		

	@Override
	public MealPlan findByID(int mealPlanId) {
		return em.find(MealPlan.class, mealPlanId);
	}

	@Override
	public MealPlan createMealPlan(MealPlan mealPlan, User user) {
		mealPlan.setEnabled(true);
		mealPlan.setUser(user);
		em.persist(mealPlan);
		return mealPlan;
	}

	@Override
	public List<Meal> findAllMeals() {
		String jpql = "SELECT m FROM Meal m";
		return em.createQuery(jpql, Meal.class).getResultList();
	}

	@Override
	public PlannedMeal createPlannedMeal(int mealPlanId, PlannedMeal plannedMeal) {
		MealPlan mealPlan = em.find(MealPlan.class, mealPlanId);
		if (mealPlan != null) {
			plannedMeal.setMealPlan(mealPlan);
			em.persist(plannedMeal);
			return plannedMeal;
		}
		return null;
	}

}
