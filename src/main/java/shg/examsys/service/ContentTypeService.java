package shg.examsys.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import shg.examsys.entity.ContentType;

public interface ContentTypeService {
	
	public ContentType get(Serializable id);//
	public List<ContentType> find(Map map);//
	public void insert(ContentType contentType);//
	public void update(ContentType contentType);//
	public void deleteById(Serializable id);//
	public void delete(Serializable[] ids);//

}
