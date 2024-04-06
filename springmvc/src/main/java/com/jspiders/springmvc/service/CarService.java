package com.jspiders.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jspiders.springmvc.dao.CarDAO;
import com.jspiders.springmvc.dto.CarDTO;
import com.jspiders.springmvc.dto.UserDTO;

@Component
public class CarService {

	@Autowired
	private CarDAO carDAO;

	public CarDTO addCar(String name, String brand, String fuel, double price) {

		CarDTO carDTO = new CarDTO();
		carDTO.setName(name);
		carDTO.setBrand(brand);
		carDTO.setFuel(fuel);
		carDTO.setPrice(price);
		return carDAO.addCar(carDTO);
	}

	public List<CarDTO> findAllCars() {

		List<CarDTO> cars = carDAO.findAllCars();
		if (cars != null && cars.size() > 0) {
			return cars;
		} else {
			return null;
		}
	}
	
	public List<CarDTO> findCarsByUser(UserDTO signedInUser) {
		
		List<CarDTO> cars = carDAO.findCarsByUser(signedInUser.getId());
		if (cars != null && cars.size()>0) {
			return cars;
		} else {
			return null;
		}
	}
	
	public void deleteCar(UserDTO signedInUser,int carId) {
		
		carDAO.deleteCar(signedInUser.getId(), carId);
	}

	public CarDTO findcarById(int id) {

		CarDTO car = carDAO.findCarById(id);
		return car;
	}

	public void updateCar(int id, String name, String brand, String fuel, double price) {

		CarDTO car = new CarDTO();
		car.setId(id);
		car.setName(name);
		car.setBrand(brand);
		car.setFuel(fuel);
		car.setPrice(price);
		carDAO.updateCar(car);
	}
}
