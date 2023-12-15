package com.skilldistillery.chowemporium.data;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.chowemporium.entities.Cuisine;
import com.skilldistillery.chowemporium.entities.DietCategory;
import com.skilldistillery.chowemporium.entities.DietaryRestriction;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Cuisine> getCuisines() {
		String query = "SELECT c FROM Cuisine c";
		return em.createQuery(query, Cuisine.class).getResultList();

	}

	@Override
	public List<DietaryRestriction> getDietaryRestrictions() {
		String query = "SELECT d FROM DietaryRestriction d";
		return em.createQuery(query, DietaryRestriction.class).getResultList();

	}

	@Override
	public List<DietCategory> getDietCategory() {
		String query = "SELECT d FROM DietCategory d";
		return em.createQuery(query, DietCategory.class).getResultList();
	}

	@Override
	public List<Cuisine> getCuisines(List<String> cuisineIds) {
		List<Cuisine> cuisines = new ArrayList<>();
		for (String id : cuisineIds) {
			cuisines.add(em.find(Cuisine.class, Integer.parseInt(id)));
		}
		return cuisines;
	}

	@Override
	public List<DietaryRestriction> getDietaryRestrictions(List<String> restricitionIds) {
		List<DietaryRestriction> restrictions = new ArrayList<>();
		for (String id : restricitionIds) {
			restrictions.add(em.find(DietaryRestriction.class, Integer.parseInt(id)));
		}
		return restrictions;
	}

	@Override
	public List<DietCategory> getDietCategory(List<String> dietCategoryIds) {
		List<DietCategory> dietCategories = new ArrayList<>();
		for (String id : dietCategoryIds) {
			dietCategories.add(em.find(DietCategory.class, Integer.parseInt(id)));
		}
		return dietCategories;
	}

}
