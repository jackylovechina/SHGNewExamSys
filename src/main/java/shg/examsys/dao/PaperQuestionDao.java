package shg.examsys.dao;

import java.util.List;
import java.util.Map;

import shg.examsys.entity.PaperQuestion;

public interface PaperQuestionDao extends BaseDao<PaperQuestion> {

	public int count(Map map);
	public void insertMulti(List list);

}
