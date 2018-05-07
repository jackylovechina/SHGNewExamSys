package shg.examsys.dao.impl;

import org.springframework.stereotype.Repository;

import shg.examsys.dao.QuestionTypeDao;
import shg.examsys.entity.QuestionType;

@Repository
public class QuestionTypeDaoImpl extends BaseDaoImpl<QuestionType> implements QuestionTypeDao{
	
	public QuestionTypeDaoImpl() {
		// TODO Auto-generated constructor stub
		super.setNs("shg.examsys.mapper.QuestionTypeMapper");
	}

}
