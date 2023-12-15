package com.skilldistillery.chowemporium.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.chowemporium.entities.Cuisine;
import com.skilldistillery.chowemporium.entities.DietCategory;
import com.skilldistillery.chowemporium.entities.DietaryRestriction;
import com.skilldistillery.chowemporium.entities.Dish;
import com.skilldistillery.chowemporium.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class DishDaoImpl implements DishDAO {

	@PersistenceContext
	private EntityManager em;
	

	
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

		@Override
		public Dish createBrandNewDish(int userId, Dish newDish, List<Cuisine> cuisines, List<DietCategory> dietCategories,
				List<DietaryRestriction> dietRestrictions) {
				for (Cuisine cuisine : cuisines) {
					newDish.addCuisine(cuisine);
			
				}
				for (DietCategory dietCategory : dietCategories) {
					newDish.addDietCategory(dietCategory);
					
				}
				
				for (DietaryRestriction dietaryRestriction : dietRestrictions) {
					newDish.addDietaryRestriction(dietaryRestriction);
				}
		
				//TODO foreach loop for diet restrictions (after adding relationship, unit testing, add dish method.
				User managedUser = em.find(User.class, userId);
//				
				
//				TODO before persist 
				newDish.setCreator(managedUser); 
				em.persist(newDish);
				
				
			return newDish;
		}

}

		
		
		
		
		
		
		
		
		
		
		
		
		

