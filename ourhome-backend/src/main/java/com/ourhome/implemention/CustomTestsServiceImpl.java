package com.ourhome.implemention;

import java.util.List;

import com.ourhome.service.ICustomTestsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ourhome.dao.ICustomTestsDAO;
import com.ourhome.dto.CustomTests;

@Service
public class CustomTestsServiceImpl implements ICustomTestsService {

	@Autowired
	ICustomTestsDAO iCustomTestsDAO;
	
	@Override
	public List<CustomTests> listCustomTests() {
		return iCustomTestsDAO.findAll();
	}

	@Override
	public CustomTests saveCustomTest(CustomTests customTest) {
		return iCustomTestsDAO.save(customTest);
	}

	@Override
	public CustomTests searchCustomTest(int id) {
		return iCustomTestsDAO.findById(id).get();
	}

	@Override
	public CustomTests searchCustomTestByUser(int user_id) {
		return iCustomTestsDAO.findByUser_id(user_id);
	}

	@Override
	public CustomTests updateCustomTest(CustomTests customTest) {
		return iCustomTestsDAO.save(customTest);
	}

	@Override
	public void deleteCustomTest(int id) {
		iCustomTestsDAO.deleteById(id);
	}

}