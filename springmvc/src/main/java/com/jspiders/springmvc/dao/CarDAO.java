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
import com.mysql.cj.x.protobuf.MysqlxCursor.Open;

@Component
public class CarDAO {
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

	public CarDTO addCar(CarDTO carDTO) {

		openConnection();
		entityTransaction.begin();
		entityManager.persist(carDTO);
		entityTransaction.commit();
		closeConnection();
		return carDTO;
	}

	public List<CarDTO> findAllCars() {

		openConnection();
		Query query = entityManager.createQuery("Select car from CarDTO car");
		@SuppressWarnings("unchecked")
		List<CarDTO> cars = query.getResultList();
		closeConnection();
		return cars;
	}

	public List<CarDTO> findCarsByUser(int id) {

		openConnection();
		UserDTO user = entityManager.find(UserDTO.class, id);
		List<CarDTO> cars = user.getCars();
		closeConnection();
		return cars;
	}
	
	//TO DELETE A CAR WE NEED TO BREAK THE MAPPING BETWEEN CAR AND USER
	public void deleteCar(int userId, int carId) {
		openConnection();
		UserDTO user = entityManager.find(UserDTO.class, userId);
		List<CarDTO> cars = user.getCars();
		CarDTO carToBeDeleted = null;
		for (CarDTO car : cars) {
			if (car.getId() == carId) {
				carToBeDeleted = car;
				break;
			}
		}
		cars.remove(carToBeDeleted);
		user.setCars(cars);

		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();

		CarDTO car = entityManager.find(CarDTO.class, carId);
		entityTransaction.begin();
		entityManager.remove(car);
		entityTransaction.commit();

		closeConnection();
	}

	public CarDTO findCarById(int id) {

		openConnection();
		CarDTO car = entityManager.find(CarDTO.class, id);
		closeConnection();
		return car;
	}
	
	//TO UPDATE A CAR WE DONT NEED TO BREAK ANY MAPPING, WE CAN SIMPLY UPDATE THE CAR AND PERSIST IT.
	public void updateCar(CarDTO car) {

		openConnection();
		CarDTO carToBeUpdated = entityManager.find(CarDTO.class, car.getId());
		carToBeUpdated.setName(car.getName());
		carToBeUpdated.setBrand(car.getBrand());
		carToBeUpdated.setFuel(car.getFuel());
		carToBeUpdated.setPrice(car.getPrice());
		entityTransaction.begin();
		entityManager.persist(carToBeUpdated);
		entityTransaction.commit();
		closeConnection();
	}
}
