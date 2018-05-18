package shg.examsys.dao;

import java.util.Map;

import shg.examsys.entity.Paper;

public interface PaperDao extends BaseDao<Paper> {

	public int count(Map map);

}
