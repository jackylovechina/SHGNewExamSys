package shg.examsys.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shg.examsys.dao.QuestionTypeDao;
import shg.examsys.entity.QuestionType;
import shg.examsys.service.QuestionTypeService;
@Service
public class QuestionTypeServiceImpl implements QuestionTypeService{
	
	@Autowired
	QuestionTypeDao questionTypeDao;

	@Override
	public QuestionType get(Serializable id) {
		// TODO Auto-generated method stub
		return questionTypeDao.get(id);
	}

	@Override
	public List<QuestionType> find(Map map) {
		// TODO Auto-generated method stub
		return questionTypeDao.find(map);
	}

	@Override
	public void insert(QuestionType questionType) {
		// TODO Auto-generated method stub
		questionTypeDao.insert(questionType);
	}

	@Override
	public void update(QuestionType questionType) {
		// TODO Auto-generated method stub
		questionTypeDao.update(questionType);
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		questionTypeDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		questionTypeDao.delete(ids);
	}

}
