package shg.examsys.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import shg.examsys.dao.PaperDao;
import shg.examsys.entity.Paper;

@Repository
public class PaperDaoImpl extends BaseDaoImpl<Paper> implements PaperDao{
	
	public PaperDaoImpl() {
		// TODO Auto-generated constructor stub
		super.setNs("shg.examsys.mapper.PaperMapper");
	}

	@Override
	public int count(Map map) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(this.getNs()+".count", map);
	}

}
