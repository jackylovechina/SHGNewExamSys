package shg.examsys.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shg.examsys.dao.PaperDao;
import shg.examsys.entity.Paper;
import shg.examsys.service.PaperService;

@Service
public class PaperServiceImpl implements PaperService {
	
	@Autowired
	PaperDao paperDao;

	@Override
	public Paper get(Serializable id) {
		// TODO Auto-generated method stub
		return paperDao.get(id);
	}

	@Override
	public List<Paper> find(Map map) {
		// TODO Auto-generated method stub
		return paperDao.find(map);
	}

	@Override
	public void insert(Paper paper) {
		// TODO Auto-generated method stub
		paperDao.insert(paper);
	}

	@Override
	public void update(Paper paper) {
		// TODO Auto-generated method stub
		paperDao.update(paper);
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		paperDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		paperDao.delete(ids);
	}

	@Override
	public int count(Map map) {
		// TODO Auto-generated method stub
		return paperDao.count(map);
	}

}
