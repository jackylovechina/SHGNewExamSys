package shg.examsys.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import shg.examsys.dao.ContentTypeDao;
import shg.examsys.entity.ContentType;
import shg.examsys.service.ContentTypeService;

public class ContentTypeServiceImpl implements ContentTypeService{
	
	@Autowired
	ContentTypeDao contentTypeDao;

	@Override
	public ContentType get(Serializable id) {
		// TODO Auto-generated method stub
		return contentTypeDao.get(id);
	}

	@Override
	public List<ContentType> find(Map map) {
		// TODO Auto-generated method stub
		return contentTypeDao.find(map);
	}

	@Override
	public void insert(ContentType contentType) {
		// TODO Auto-generated method stub
		contentTypeDao.insert(contentType);
	}

	@Override
	public void update(ContentType contentType) {
		// TODO Auto-generated method stub
		contentTypeDao.update(contentType);
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		contentTypeDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		contentTypeDao.delete(ids);
	}

}
