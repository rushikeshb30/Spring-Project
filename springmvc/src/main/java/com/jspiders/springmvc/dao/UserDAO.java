package com.jspiders.springmvc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.jspiders.springmvc.dto.CarDTO;
import com.jspiders.springmvc.dto.UserDTO;

@Component
public class UserDAO {
	
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private EntityTransaction entityTransaction;
	
	public void openConnection() {
		entityManagerFactory = Persistence.createEntityManagerFactory("car");
		entityManager = entityManagerFactory.createEntityManager();
		entityTransaction = entityManager.getTransaction();

	}

	public void closeConnection() {
		if (entityManagerFactory != null) {
			entityManagerFactory.close();
		}
		if (entityManager != null) {
			entityManager.close();
		}
		if (entityTransaction != null) {
			if (entityTransaction.isActive()) {
				entityTransaction.rollback();
			}
		}
	}

	public UserDTO addUser(UserDTO userDTO) {

		openConnection();
		entityTransaction.begin();
		entityManager.persist(userDTO);
		entityTransaction.commit();
		closeConnection();
		return userDTO;
	}

	public List<UserDTO> findAllUsers() {
		
		openConnection();
		Query query = entityManager.createQuery("Select user from UserDTO user");
		@SuppressWarnings("unchecked")
		List<UserDTO> users = query.getResultList();
		closeConnection();
		return users;
	}

	public void updateUser(int id, CarDTO addedCar) {

		openConnection();
		UserDTO user = entityManager.find(UserDTO.class, id);
		List<CarDTO> cars = user.getCars();
		cars.add(addedCar);
		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();
		closeConnection();
	}
	
	public void deleteUser(int id) {
		openConnection();
		UserDTO userToBeDeleted = entityManager.find(UserDTO.class, id);
		entityTransaction.begin();
		entityManager.remove(userToBeDeleted);
		entityTransaction.commit();
		closeConnection();
	}

}
