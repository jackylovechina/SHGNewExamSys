package shg.examsys.dao.impl;

import org.springframework.stereotype.Repository;

import shg.examsys.dao.EmployeeDao;
import shg.examsys.entity.Employee;

@Repository
public class EmployeeDaoImpl extends BaseDaoImpl<Employee> implements EmployeeDao{

	public EmployeeDaoImpl() {
		// TODO Auto-generated constructor stub
		super.setNs("shg.examsys.mapper.EmployeeMapper");
	}
}
