package shg.examsys.dao.impl;

import org.springframework.stereotype.Repository;

import shg.examsys.dao.TestDao;
import shg.examsys.entity.Employee;

@Repository
public class TestDaoImpl extends BaseDaoImpl<Employee> implements TestDao{
	
	public TestDaoImpl() {
		super.setNs("shg.examsys.mapper.EmployeeMapper");
	}
}
