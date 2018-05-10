package shg.examsys.dao;

import java.util.Map;

import shg.examsys.entity.Question;

public interface QuestionDao extends BaseDao<Question>{

	public int count(Map map);
}
