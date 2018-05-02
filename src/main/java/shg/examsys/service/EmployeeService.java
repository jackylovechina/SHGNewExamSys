package shg.examsys.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import shg.examsys.entity.Employee;

public interface EmployeeService {
	
	public Employee get(Serializable id);//
	public List<Employee> find(Map map);//
	public void insert(Employee employee);//
	public void update(Employee employee);//
	public void deleteById(Serializable id);//
	public void delete(Serializable[] ids);//

}
