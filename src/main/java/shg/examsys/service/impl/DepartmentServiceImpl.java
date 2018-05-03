package shg.examsys.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shg.examsys.dao.DepartmentDao;
import shg.examsys.entity.Department;
import shg.examsys.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService{
	
	@Autowired
	DepartmentDao departmentDao;

	@Override
	public Department get(Serializable id) {
		// TODO Auto-generated method stub
		return departmentDao.get(id);
	}

	@Override
	public List<Department> find(Map map) {
		// TODO Auto-generated method stub
		return departmentDao.find(map);
	}

	@Override
	public void insert(Department department) {
		// TODO Auto-generated method stub
		departmentDao.insert(department);
	}

	@Override
	public void update(Department department) {
		// TODO Auto-generated method stub
		departmentDao.update(department);
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		departmentDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		departmentDao.delete(ids);
	}

}
