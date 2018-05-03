package shg.examsys.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shg.examsys.dao.RoleDao;
import shg.examsys.entity.Role;
import shg.examsys.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	RoleDao roleDao;

	@Override
	public Role get(Serializable id) {
		// TODO Auto-generated method stub
		return roleDao.get(id);
	}

	@Override
	public List<Role> find(Map map) {
		// TODO Auto-generated method stub
		return roleDao.find(map);
	}

	@Override
	public void insert(Role role) {
		// TODO Auto-generated method stub
		roleDao.insert(role);
	}

	@Override
	public void update(Role role) {
		// TODO Auto-generated method stub
		roleDao.update(role);
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		roleDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		roleDao.delete(ids);
	}

}
