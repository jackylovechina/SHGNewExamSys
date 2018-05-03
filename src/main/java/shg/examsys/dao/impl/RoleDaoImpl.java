package shg.examsys.dao.impl;

import org.springframework.stereotype.Repository;

import shg.examsys.dao.RoleDao;
import shg.examsys.entity.Role;

@Repository
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao{
	
	public RoleDaoImpl() {
		// TODO Auto-generated constructor stub
		//设置命名空间
		super.setNs("shg.examsys.mapper.RoleMapper");
	}

}
