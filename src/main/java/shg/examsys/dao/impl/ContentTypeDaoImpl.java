package shg.examsys.dao.impl;

import org.springframework.stereotype.Repository;

import shg.examsys.dao.ContentTypeDao;
import shg.examsys.entity.ContentType;

@Repository
public class ContentTypeDaoImpl extends BaseDaoImpl<ContentType> implements ContentTypeDao {

	public ContentTypeDaoImpl() {
		// TODO Auto-generated constructor stub
		// 设置命名空间
		super.setNs("shg.examsys.mapper.ContentTypeMapper");
	}

}
