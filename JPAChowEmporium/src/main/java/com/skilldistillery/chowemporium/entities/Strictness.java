package com.skilldistillery.chowemporium.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Strictness {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "strictness_level")
	private String strictnessLevel;

	private String description;
	
	

	public Strictness() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStrictnessLevel() {
		return strictnessLevel;
	}

	public void setStrictnessLevel(String strictnessLevel) {
		this.strictnessLevel = strictnessLevel;
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
		Strictness other = (Strictness) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Strictness [id=" + id + ", strictnessLevel=" + strictnessLevel + ", description=" + description + "]";
	}

}
