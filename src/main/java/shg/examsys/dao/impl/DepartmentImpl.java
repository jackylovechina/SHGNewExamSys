package shg.examsys.dao.impl;

import org.springframework.stereotype.Repository;

import shg.examsys.dao.DepartmentDao;
import shg.examsys.entity.Department;

@Repository
public class DepartmentImpl extends BaseDaoImpl<Department> implements DepartmentDao{
	
	public DepartmentImpl() {
		// TODO Auto-generated constructor stub
		super.setNs("shg.examsys.mapper.DepartmentMapper");
	}

}
