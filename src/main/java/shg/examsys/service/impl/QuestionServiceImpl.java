package shg.examsys.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shg.examsys.dao.QuestionDao;
import shg.examsys.entity.Question;
import shg.examsys.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionDao questionDao;

	@Override
	public Question get(Serializable id) {
		// TODO Auto-generated method stub
		return questionDao.get(id);
	}

	@Override
	public List<Question> find(Map map) {
		// TODO Auto-generated method stub
		return questionDao.find(map);
	}

	@Override
	public void insert(Question question) {
		// TODO Auto-generated method stub
		questionDao.insert(question);
	}

	@Override
	public void update(Question question) {
		// TODO Auto-generated method stub
		questionDao.update(question);
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		questionDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		questionDao.delete(ids);
	}

}
