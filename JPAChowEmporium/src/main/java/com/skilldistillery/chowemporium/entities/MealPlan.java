package com.skilldistillery.chowemporium.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Table(name = "meal_plan")
@Entity
public class MealPlan {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	@CreationTimestamp
	@Column(name = "date_created")
	private LocalDateTime dateCreated;
	
	@UpdateTimestamp
	@Column(name = "last_update")
	private LocalDateTime lastUpdate;
	
	private boolean enabled;
	
	private boolean shared;
	
	private String description;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToMany(mappedBy = "mealPlan")
	private List<PlannedMeal> plannedMeals;
	
	
	public MealPlan() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public boolean isShared() {
		return shared;
	}

	public void setShared(boolean shared) {
		this.shared = shared;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<PlannedMeal> getPlannedMeals() {
		return plannedMeals;
	}

	public void setPlannedMeals(List<PlannedMeal> plannedMeals) {
		this.plannedMeals = plannedMeals;
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
		MealPlan other = (MealPlan) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "MealPlan [id=" + id + ", title=" + title + ", dateCreated=" + dateCreated + ", lastUpdate=" + lastUpdate
				+ ", enabled=" + enabled + ", shared=" + shared + ", description=" + description + "]";
	}
	
	
	
}
