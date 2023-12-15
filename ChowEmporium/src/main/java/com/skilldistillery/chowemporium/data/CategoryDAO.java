package com.skilldistillery.chowemporium.data;

import java.util.List;

import com.skilldistillery.chowemporium.entities.Cuisine;
import com.skilldistillery.chowemporium.entities.DietCategory;
import com.skilldistillery.chowemporium.entities.DietaryRestriction;

public interface CategoryDAO {
	List<Cuisine> getCuisines();
	List<DietaryRestriction> getDietaryRestrictions();
	List<DietCategory> getDietCategory();
	List<Cuisine> getCuisines(List<String> cuisineIds);
	List<DietaryRestriction> getDietaryRestrictions(List<String> restricitionIds);
	List<DietCategory> getDietCategory(List<String> dietCategoryIds);

}
