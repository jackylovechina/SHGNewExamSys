package shg.examsys.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shg.examsys.dao.PaperQuestionDao;
import shg.examsys.entity.PaperQuestion;
import shg.examsys.service.PaperQuestionService;

@Service
public class PaperQuestionServiceImpl implements PaperQuestionService {

	@Autowired
	PaperQuestionDao paperQuestionDao;

	@Override
	public PaperQuestion get(Serializable id) {
		// TODO Auto-generated method stub
		return paperQuestionDao.get(id);
	}

	@Override
	public List<PaperQuestion> find(Map map) {
		// TODO Auto-generated method stub
		return paperQuestionDao.find(map);
	}

	@Override
	public void insert(PaperQuestion paperQuestion) {
		// TODO Auto-generated method stub
		paperQuestionDao.insert(paperQuestion);
	}

	@Override
	public void update(PaperQuestion paperQuestion) {
		// TODO Auto-generated method stub
		paperQuestionDao.update(paperQuestion);
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		paperQuestionDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		paperQuestionDao.delete(ids);
	}

	@Override
	public int count(Map map) {
		// TODO Auto-generated method stub
		return paperQuestionDao.count(map);
	}

	@Override
	public void insertMulti(List list) {
		// TODO Auto-generated method stub
		paperQuestionDao.insertMulti(list);
	}

}
