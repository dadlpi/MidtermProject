package com.skilldistillery.chowemporium.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.chowemporium.entities.Dish;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class DishDaoImpl implements DishDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Dish CreateBrandNewDish(Dish newCreateDish) {
		
		em.persist(newCreateDish);

		return newCreateDish;
	}

	@Override
	public Dish updateDish(Dish dish) {
		Dish dishChanged = em.find(Dish.class, dish.getId());
		dishChanged.setName(dish.getName());
		dishChanged.setDescription(dish.getDescription());
		dishChanged.setImageUrl(dish.getImageUrl());
		dishChanged.setCalories(dish.getCarbsGrams()); // dropdown tab
		dishChanged.setCarbsGrams(dish.getCarbsGrams()); // dropdown tab
		dishChanged.setFatGrams(dish.getFatGrams());// dropdown tab
		dishChanged.setMealType(dish.getMealType());// dropdown tab
		dishChanged.setListOfCuisine(dish.getListOfCuisine());// dropdown tab

		em.flush();

		return dishChanged;
		
	}

	@Override
	public boolean deleteDish(Dish dish) {
		Dish deletedDish = em.find(Dish.class, dish.getId());
		boolean userIsActive = false;
		if (deletedDish != null) {
			em.remove(deletedDish);

			userIsActive = !em.contains(deletedDish);
			
			System.out.println("************* Deleted Dish *************** "+ deletedDish);
			return userIsActive;
		}

		return userIsActive;
	}
		
		@Override
		public List<Dish> findAll() {
			String  jpql = "SELECT d FROM Dish d";
			
			return em.createQuery(jpql, Dish.class).getResultList();
		}



}
