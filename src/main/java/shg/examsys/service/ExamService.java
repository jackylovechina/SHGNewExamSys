package shg.examsys.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import shg.examsys.entity.Exam;

public interface ExamService {

	public Exam get(Serializable id);

	public List<Exam> find(Map map);

	public void insert(Exam exam);

	public void update(Exam exam);

	public void deleteById(Serializable id);

	public void delete(Serializable[] ids);

	public int count(Map map);

}
