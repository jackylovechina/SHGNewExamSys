package shg.examsys.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import shg.examsys.dao.BaseDao;

public class BaseDaoImpl<T> extends SqlSessionDaoSupport implements BaseDao<T> {
	
	@Autowired //
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory){
		super.setSqlSessionFactory(sqlSessionFactory);
		
	}
	
	private String ns; //
	public String getNs(){
		return ns;
	}
	
	public void setNs(String ns){
		this.ns=ns;
	}

	@Override
	public T get(Serializable id) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(ns+".get",id);
	}

	@Override
	public List<T> find(Map map) {
		// TODO Auto-generated method stub
		List<T> oList=this.getSqlSession().selectList(ns+".find", map);
		return oList;
	}

	@Override
	public void insert(T entity) {
		// TODO Auto-generated method stub
		this.getSqlSession().insert(ns+".insert",entity);
	}

	@Override
	public void update(T entity) {
		// TODO Auto-generated method stub
		this.getSqlSession().update(ns+".update",entity);
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		this.getSqlSession().delete(ns+".deleteById",id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		this.getSqlSession().delete(ns+".delete",ids);
	}


}
