package shg.examsys.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shg.examsys.dao.EmployeeDao;
import shg.examsys.entity.Employee;
import shg.examsys.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	EmployeeDao employeeDao;

	@Override
	public Employee get(Serializable id) {
		// TODO Auto-generated method stub
		return employeeDao.get(id);
	}

	@Override
	public List<Employee> find(Map map) {
		// TODO Auto-generated method stub
		return employeeDao.find(map);
	}

	@Override
	public void insert(Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.insert(employee);
	}

	@Override
	public void update(Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.update(employee);
		
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		employeeDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		employeeDao.delete(ids);
	}
	
	

}
