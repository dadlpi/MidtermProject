package com.skilldistillery.chowemporium.entities;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;

@Entity
public class Cuisine {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@ManyToMany
	@JoinTable(name = "cuisine_has_dish", joinColumns = @JoinColumn(name = "cuisine_id"), inverseJoinColumns = @JoinColumn(name = "dish_id"))
	private List<Dish> cuisineDishes;

	public Cuisine() {
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

	public List<Dish> getCuisineDishes() {
		return cuisineDishes;
	}

	public void setCuisineDishes(List<Dish> cuisineDishes) {
		this.cuisineDishes = cuisineDishes;
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
		Cuisine other = (Cuisine) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Cuisine [id=" + id + ", name=" + name + "]";
	}
	
	
}
