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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_diet")
public class UserDiet {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name = "date_created")
	private LocalDateTime dateCreated;
	
	@Column(name = "last_update")
	private LocalDateTime lastUpdate;
	
	private boolean enabled;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToMany(mappedBy = "userDiet")
	private List<UserDietRestriction> userDietRestricitons;
	
//	@OneToOne
//	@JoinTable(name = "user_diet_restriction", joinColumns = @JoinColumn(name = "diet_id"), inverseJoinColumns = @JoinColumn(name = "dietary_restriction_id"))
//	private List<Dish> favoriteDishList;
	
	public UserDiet() {
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
		UserDiet other = (UserDiet) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "UserDiet [id=" + id + ", name=" + name + ", dateCreated=" + dateCreated
				+ ", lastUpdate=" + lastUpdate + ", enabled=" + enabled + "]";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<UserDietRestriction> getUserDietRestricitons() {
		return userDietRestricitons;
	}

	public void setUserDietRestricitons(List<UserDietRestriction> userDietRestricitons) {
		this.userDietRestricitons = userDietRestricitons;
	}
	
	
}
