package shg.examsys.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import shg.examsys.entity.PaperQuestion;

public interface PaperQuestionService {

	public PaperQuestion get(Serializable id);

	public List<PaperQuestion> find(Map map);

	public void insert(PaperQuestion paperQuestion);

	public void update(PaperQuestion paperQuestion);

	public void deleteById(Serializable id);

	public void delete(Serializable[] ids);

	public int count(Map map);

	public void insertMulti(List list);

}
