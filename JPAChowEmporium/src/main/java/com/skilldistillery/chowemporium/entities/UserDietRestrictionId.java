package com.skilldistillery.chowemporium.entities;

import java.io.Serializable;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class UserDietRestrictionId implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Column(name = "diet_id")
	private int dietId;
	
	@Column(name = "dietary_restriction_id")
	private int dietaryRestrictionId;
	
	public UserDietRestrictionId() {}
	
	

	public UserDietRestrictionId(int dietId, int dietaryRestrictionId) {
		super();
		this.dietId = dietId;
		this.dietaryRestrictionId = dietaryRestrictionId;
	}


	@Override
	public int hashCode() {
		return Objects.hash(dietId, dietaryRestrictionId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserDietRestrictionId other = (UserDietRestrictionId) obj;
		return dietId == other.dietId && dietaryRestrictionId == other.dietaryRestrictionId;
	}

	public int getDietId() {
		return dietId;
	}

	public void setDietId(int dietId) {
		this.dietId = dietId;
	}

	public int getDietaryRestrictionId() {
		return dietaryRestrictionId;
	}

	public void setDietaryRestrictionId(int dietaryRestrictionId) {
		this.dietaryRestrictionId = dietaryRestrictionId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "UserDietRestrictionId [dietId=" + dietId + ", dietaryRestrictionId=" + dietaryRestrictionId + "]";
	}
}
