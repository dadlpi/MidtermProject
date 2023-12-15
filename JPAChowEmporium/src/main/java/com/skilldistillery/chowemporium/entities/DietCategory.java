package com.skilldistillery.chowemporium.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Table(name = "diet_category")
@Entity
public class DietCategory {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;
	
	@ManyToMany
	@JoinTable(name = "dish_diet_category", joinColumns = @JoinColumn(name = "diet_category_id"), inverseJoinColumns = @JoinColumn(name = "dish_id"))
	private List<Dish> dishes;
	
	@ManyToMany
	@JoinTable(name = "diet_category_has_dietary_restriction", joinColumns = @JoinColumn(name = "diet_category_id"), inverseJoinColumns = @JoinColumn(name = "dietary_restriction_id"))
	private List<DietaryRestriction> dietaryRestrictions;

	public List<DietaryRestriction> getDietaryRestriction() {
		return dietaryRestrictions;
	}

	public void setDietaryRestriction(List<DietaryRestriction> dietaryRestriction) {
		this.dietaryRestrictions = dietaryRestriction;
	}

	public List<Dish> getDishes() {
		return dishes;
	}

	public void setDishes(List<Dish> dishes) {
		this.dishes = dishes;
	}

	public DietCategory() {
		super();
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

	public void addDish(Dish dish) {
		if (dishes == null ) { dishes = new ArrayList<>();}
		if (! dishes.contains(dish)) {
			dishes.add(dish);
			dish.addDietCategory(this);
		}
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
		DietCategory other = (DietCategory) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "DietCategory [id=" + id + ", name=" + name + "]";
	}

}
