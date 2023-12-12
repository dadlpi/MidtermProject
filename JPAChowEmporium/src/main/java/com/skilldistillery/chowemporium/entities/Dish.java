package com.skilldistillery.chowemporium.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Dish {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	private Integer calories;

	@Column(name = "image_url")
	private String imageUrl;

	@Column(name = "protein_grams")
	private Integer proteinGrams;

	@Column(name = "fat_grams")
	private Integer fatGrams;

	@Column(name = "carbs_grams")
	private Integer carbsGrams;

	@Column(name = "recipe_url")
	private String recipeUrl;

	@Column(name = "date_created")
	private LocalDateTime dateCreated;

	@Column(name = "last_update")
	private LocalDateTime lastUpdate;

	private boolean enabled;
	
	@OneToMany(mappedBy = "dish")
	private List<PlannedMeal> dishOPlannedMeals;
	
	@ManyToMany
	@JoinTable(name = "cuisine_has_dish", joinColumns = @JoinColumn(name = "dish_id"), inverseJoinColumns = @JoinColumn(name = "cuisine_id"))
	private List<Cuisine> listOfCuisine;
	
	@ManyToOne
	@JoinColumn(name="meal_type_id")
	private MealType mealType;
	
	
	public Dish() {
		super();
	}

	public MealType getMealType() {
		return mealType;
	}

	public void setMealType(MealType mealType) {
		this.mealType = mealType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getCalories() {
		return calories;
	}

	public void setCalories(Integer calories) {
		this.calories = calories;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Integer getProteinGrams() {
		return proteinGrams;
	}

	public void setProteinGrams(Integer proteinGrams) {
		this.proteinGrams = proteinGrams;
	}

	public Integer getFatGrams() {
		return fatGrams;
	}

	public void setFatGrams(Integer fatGrams) {
		this.fatGrams = fatGrams;
	}

	public Integer getCarbsGrams() {
		return carbsGrams;
	}

	public void setCarbsGrams(Integer carbsGrams) {
		this.carbsGrams = carbsGrams;
	}

	public String getRecipeUrl() {
		return recipeUrl;
	}

	public void setRecipeUrl(String recipeUrl) {
		this.recipeUrl = recipeUrl;
	}

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public List<PlannedMeal> getDishOPlannedMeals() {
		return dishOPlannedMeals;
	}

	public void setDishOPlannedMeals(List<PlannedMeal> dishOPlannedMeals) {
		this.dishOPlannedMeals = dishOPlannedMeals;
	}

	public List<Cuisine> getListOfCuisine() {
		return listOfCuisine;
	}

	public void setListOfCuisine(List<Cuisine> listOfCuisine) {
		this.listOfCuisine = listOfCuisine;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Dish other = (Dish) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "dish [id=" + id + ", name=" + name + ", description=" + description + ", calories=" + calories
				+ ", imageUrl=" + imageUrl + ", proteinGrams=" + proteinGrams + ", fatGrams=" + fatGrams
				+ ", carbsGrams=" + carbsGrams + ", recipeUrl=" + recipeUrl + ", dateCreated=" + dateCreated
				+ ", lastUpdate=" + lastUpdate + ", enabled=" + enabled + "]";
	}

}
