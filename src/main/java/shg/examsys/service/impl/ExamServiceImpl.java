package shg.examsys.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shg.examsys.dao.ExamDao;
import shg.examsys.entity.Exam;
import shg.examsys.service.ExamService;

@Service
public class ExamServiceImpl implements ExamService{
	
	@Autowired
	ExamDao examDao;

	@Override
	public Exam get(Serializable id) {
		// TODO Auto-generated method stub
		return examDao.get(id);
	}

	@Override
	public List<Exam> find(Map map) {
		// TODO Auto-generated method stub
		return examDao.find(map);
	}

	@Override
	public void insert(Exam exam) {
		// TODO Auto-generated method stub
		examDao.insert(exam);
	}

	@Override
	public void update(Exam exam) {
		// TODO Auto-generated method stub
		examDao.update(exam);
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		examDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		examDao.delete(ids);
	}

	@Override
	public int count(Map map) {
		// TODO Auto-generated method stub
		return examDao.count(map);
	}

}
