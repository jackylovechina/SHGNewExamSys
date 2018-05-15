package shg.examsys.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import shg.examsys.dao.ExamDao;
import shg.examsys.entity.Exam;

@Repository
public class ExamDaoImpl extends BaseDaoImpl<Exam> implements ExamDao {

	public ExamDaoImpl() {
		// TODO Auto-generated constructor stub
		super.setNs("shg.examsys.mapper.ExamMapper");
	}

	@Override
	public int count(Map map) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(this.getNs() + ".count", map);
	}

}
