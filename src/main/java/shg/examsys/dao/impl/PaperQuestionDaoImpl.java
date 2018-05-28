package shg.examsys.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import shg.examsys.dao.PaperQuestionDao;
import shg.examsys.entity.PaperQuestion;

@Repository
public class PaperQuestionDaoImpl extends BaseDaoImpl<PaperQuestion> implements PaperQuestionDao {

	public PaperQuestionDaoImpl() {
		// TODO Auto-generated constructor stub
		super.setNs("shg.examsys.mapper.PaperQuestionMapper");
	}

	@Override
	public int count(Map map) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(this.getNs() + ".count", map);
	}

	@Override
	public void insertMulti(List list) {
		// TODO Auto-generated method stub
		this.getSqlSession().insert(this.getNs() + ".insertMulti", list);
	}

}
