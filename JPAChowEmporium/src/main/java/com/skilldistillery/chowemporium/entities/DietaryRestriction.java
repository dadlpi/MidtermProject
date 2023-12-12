package com.skilldistillery.chowemporium.entities;

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
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "dietary_restriction")
public class DietaryRestriction {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	@Column(name = "image_url")
	private String imageUrl;
	
	@ManyToMany
	@JoinTable(name = "diet_category_has_dietary_restriction", joinColumns = @JoinColumn(name = "dietary_restriction_id"), inverseJoinColumns = @JoinColumn(name = "diet_category_id"))
	private List<DietCategory> dietCategories;
	
	@OneToMany(mappedBy = "dietaryRestriction")
	private List<UserDietRestriction> userDietRestricitons;
	
	
	public DietaryRestriction() {
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

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	public List<DietCategory> getDietCategories() {
		return dietCategories;
	}

	public void setDietCategories(List<DietCategory> dietCategories) {
		this.dietCategories = dietCategories;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DietaryRestriction other = (DietaryRestriction) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "DietaryRestriction [id=" + id + ", name=" + name + ", description=" + description + ", imageUrl="
				+ imageUrl + "]";
	}

	public List<UserDietRestriction> getUserDietRestricitons() {
		return userDietRestricitons;
	}

	public void setUserDietRestricitons(List<UserDietRestriction> userDietRestricitons) {
		this.userDietRestricitons = userDietRestricitons;
	}

}
