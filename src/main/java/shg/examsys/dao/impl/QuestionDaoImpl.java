package shg.examsys.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import shg.examsys.dao.QuestionDao;
import shg.examsys.entity.Question;

@Repository
public class QuestionDaoImpl extends BaseDaoImpl<Question> implements QuestionDao{
	
	public QuestionDaoImpl() {
		// TODO Auto-generated constructor stub
		super.setNs("shg.examsys.mapper.QuestionMapper");
	}

	@Override
	public int count(Map map) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(this.getNs()+".count",map);
	}
	

}
