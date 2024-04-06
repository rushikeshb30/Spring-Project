package com.jspiders.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jspiders.springmvc.dao.UserDAO;
import com.jspiders.springmvc.dto.CarDTO;
import com.jspiders.springmvc.dto.UserDTO;

@Component
public class UserService {

	@Autowired
	private UserDAO userDAO;

	public UserDTO addUser(String name, String email, String password) {

		boolean flag = true;
		UserDTO addedUser = null;
		List<UserDTO> users = userDAO.findAllUsers();
		for (UserDTO user : users) {
			if (user.getEmail().equals(email)) {
				flag = false;
				break;
			}
		}
		if (flag) {
			UserDTO userDTO = new UserDTO();
			userDTO.setName(name);
			userDTO.setEmail(email);
			userDTO.setPassword(password);
			addedUser = userDAO.addUser(userDTO);
		}
		return addedUser;
	}

	public UserDTO checkUser(String email, String password) {

		List<UserDTO> users = userDAO.findAllUsers();

		UserDTO signedInUser = null;

		for (UserDTO user : users) {
			if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
				signedInUser = user;
				break;
			}
		}
		return signedInUser;
	}

	public void updateUser(UserDTO signedInUser, CarDTO addedCar) {

		userDAO.updateUser(signedInUser.getId(), addedCar);
	}

	public void deleteUser(UserDTO signedInUser) {

		userDAO.deleteUser(signedInUser.getId());
	}

}
