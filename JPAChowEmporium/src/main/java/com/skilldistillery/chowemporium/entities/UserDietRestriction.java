package com.skilldistillery.chowemporium.entities;

import java.util.Objects;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_diet_restriction")
public class UserDietRestriction {

	@EmbeddedId
	private UserDietRestrictionId id;
	
	@ManyToOne
	@JoinColumn(name = "diet_id") 
	@MapsId(value = "dietId")     
	private UserDiet userDiet;
	
	@ManyToOne
	@JoinColumn(name = "dietary_restriction_id") 
	@MapsId(value = "dietaryRestrictionId")    
	private DietaryRestriction dietaryRestriction;
	
	@ManyToOne
	@JoinColumn(name = "strictness_id") 
	private Strictness strictness;
	
	private String description;
	
	public UserDietRestriction() {}

	public UserDietRestrictionId getId() {
		return id;
	}

	public void setId(UserDietRestrictionId id) {
		this.id = id;
	}

	public UserDiet getUserDiet() {
		return userDiet;
	}

	public void setUserDiet(UserDiet userDiet) {
		this.userDiet = userDiet;
	}

	public DietaryRestriction getDietaryRestriction() {
		return dietaryRestriction;
	}

	public void setDietaryRestriction(DietaryRestriction dietaryRestriction) {
		this.dietaryRestriction = dietaryRestriction;
	}

	public Strictness getStrictness() {
		return strictness;
	}

	public void setStrictness(Strictness strictness) {
		this.strictness = strictness;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
		UserDietRestriction other = (UserDietRestriction) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "UserDietRestriction [id=" + id + ", userDiet=" + userDiet + ", dietaryRestriction=" + dietaryRestriction
				+ ", strictness=" + strictness + ", description=" + description + "]";
	}

}
