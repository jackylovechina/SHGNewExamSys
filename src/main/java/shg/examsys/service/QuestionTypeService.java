package shg.examsys.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import shg.examsys.entity.QuestionType;



public interface QuestionTypeService {
	
	public QuestionType get(Serializable id);//
	public List<QuestionType> find(Map map);//
	public void insert(QuestionType questionType);//
	public void update(QuestionType questionType);//
	public void deleteById(Serializable id);//
	public void delete(Serializable[] ids);//

}
