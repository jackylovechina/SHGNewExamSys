package shg.examsys.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import shg.examsys.entity.Role;

public interface RoleService {
	
	public Role get(Serializable id);//
	public List<Role> find(Map map);//
	public void insert(Role role);//
	public void update(Role role);//
	public void deleteById(Serializable id);//
	public void delete(Serializable[] ids);//

}
