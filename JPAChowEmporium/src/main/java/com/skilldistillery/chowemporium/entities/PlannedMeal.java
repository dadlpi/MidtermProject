package com.skilldistillery.chowemporium.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Table(name = "planned_meal")
@Entity
public class PlannedMeal {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name= "day_of_week")
	private String dayOfWeek;
	
	private String description;
	
	@ManyToOne
	@JoinColumn(name = "meal_plan_id")
	private MealPlan mealPlan;
	
	@ManyToOne
	@JoinColumn(name = "meal_id")
	private Meal meal;
	
	@ManyToOne
	@JoinColumn(name = "dish_id")
	private Dish dish;
	
	

	public PlannedMeal() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public MealPlan getMealPlan() {
		return mealPlan;
	}

	public void setMealPlan(MealPlan mealPlan) {
		this.mealPlan = mealPlan;
	}

	public Meal getMeal() {
		return meal;
	}

	public void setMeal(Meal meal) {
		this.meal = meal;
	}

	public Dish getDish() {
		return dish;
	}

	public void setDish(Dish dish) {
		this.dish = dish;
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
		PlannedMeal other = (PlannedMeal) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "PlannedMeal [id=" + id + ", dayOfWeek=" + dayOfWeek + ", description=" + description + "]";
	}
	
	
	
}
