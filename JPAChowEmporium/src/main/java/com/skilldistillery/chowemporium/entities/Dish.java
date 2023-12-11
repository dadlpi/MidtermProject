package com.skilldistillery.chowemporium.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

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

	public Dish() {
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
