package shg.examsys.dao;

import java.util.Map;

import shg.examsys.entity.Exam;

public interface ExamDao extends BaseDao<Exam>{
	
	public int count(Map map);

}
