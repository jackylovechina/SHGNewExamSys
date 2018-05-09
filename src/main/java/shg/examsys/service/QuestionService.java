package shg.examsys.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import shg.examsys.entity.Question;



public interface QuestionService {

	public Question get(Serializable id);//
	public List<Question> find(Map map);//
	public void insert(Question question);//
	public void update(Question question);//
	public void deleteById(Serializable id);//
	public void delete(Serializable[] ids);//
	//
	public Integer importExcel(MultipartFile myFile ,long conType_id,long queType_id) throws Exception;
}
