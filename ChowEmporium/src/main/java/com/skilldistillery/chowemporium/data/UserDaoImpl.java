package com.skilldistillery.chowemporium.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.chowemporium.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User authenticateUser(String username, String password) {
		String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw AND u.enabled = true";
		User user = null;
		try {
			user = em.createQuery(jpql, User.class).setParameter("un", username).setParameter("pw", password)
					.getSingleResult();

		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("Invalid user:" + username);
		}

		return user;
	}

	@Override
	public User CreateBrandNewUser(User newCreateUser) {

		em.persist(newCreateUser);

		return newCreateUser;

	}

	@Override
	public User updateUser(User user) {
		User userChanged = em.find(User.class, user.getId());
		userChanged.setFirstName(user.getFirstName());
		userChanged.setLastName(user.getLastName());
		userChanged.setEmail(user.getEmail());
		userChanged.setAboutMe(user.getAboutMe());
		userChanged.setPassword(user.getPassword());

		em.flush();

		return userChanged;
	}

	@Override
	public boolean deleteUser(User user) {

		User deletedUser = em.find(User.class, user.getId());
		boolean userIsActive = false;
		if (deletedUser != null) {
			em.remove(deletedUser);

			userIsActive = !em.contains(deletedUser);
			
			System.out.println("************* Deleted User *************** "+ deletedUser);
			return userIsActive;
		}

		return userIsActive;
	}

}
