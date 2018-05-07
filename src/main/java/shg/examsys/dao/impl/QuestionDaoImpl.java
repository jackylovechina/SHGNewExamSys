package shg.examsys.dao.impl;

import org.springframework.stereotype.Repository;

import shg.examsys.dao.QuestionDao;
import shg.examsys.entity.Question;

@Repository
public class QuestionDaoImpl extends BaseDaoImpl<Question> implements QuestionDao{
	
	public QuestionDaoImpl() {
		// TODO Auto-generated constructor stub
		super.setNs("shg.examsys.mapper.QuestionMapper");
	}

}
