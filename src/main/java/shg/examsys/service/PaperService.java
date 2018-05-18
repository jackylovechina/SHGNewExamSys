package shg.examsys.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import shg.examsys.entity.Paper;



public interface PaperService {
	
	public Paper get(Serializable id);
	public List<Paper> find(Map map);
	public void insert(Paper paper);
	public void update(Paper paper);
	public void deleteById(Serializable id);
	public void delete(Serializable[] ids);
	public int count(Map map);

}
