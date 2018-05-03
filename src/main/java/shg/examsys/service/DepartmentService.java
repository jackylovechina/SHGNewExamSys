package shg.examsys.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import shg.examsys.entity.Department;

public interface DepartmentService {
	
	public Department get(Serializable id);//
	public List<Department> find(Map map);//
	public void insert(Department department);//
	public void update(Department department);//
	public void deleteById(Serializable id);//
	public void delete(Serializable[] ids);//

}
