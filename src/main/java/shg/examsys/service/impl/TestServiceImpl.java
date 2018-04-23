package shg.examsys.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shg.examsys.dao.TestDao;
import shg.examsys.entity.Employee;
import shg.examsys.service.TestService;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	TestDao testDao;

	@Override
	public Employee get(Serializable id) {
		// TODO Auto-generated method stub
		return testDao.get(id);
	}

	@Override
	public List<Employee> find(Map map) {
		// TODO Auto-generated method stub
		return testDao.find(map);
	}

	@Override
	public void insert(Employee employee) {
		// TODO Auto-generated method stub
		testDao.insert(employee);
	}

	@Override
	public void update(Employee employee) {
		// TODO Auto-generated method stub
		testDao.update(employee);
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		testDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		testDao.delete(ids);
	}
	
	
}
