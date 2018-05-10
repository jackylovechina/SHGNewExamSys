package shg.examsys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

import shg.examsys.entity.ContentType;
import shg.examsys.entity.Question;
import shg.examsys.entity.QuestionType;
import shg.examsys.service.ContentTypeService;
import shg.examsys.service.QuestionService;
import shg.examsys.service.QuestionTypeService;

@Controller
public class ExamQuestionController extends BaseController {

	@Autowired
	ContentTypeService contentTypeService;
	@Autowired
	QuestionTypeService questionTypeService;
	@Autowired
	QuestionService questionService;

	@RequestMapping("/question/questionManage.action")
	public String questionManage(Model model) {

		List<ContentType> conTypeList = contentTypeService.find(null);
		List<QuestionType> queTypeList = questionTypeService.find(null);
		model.addAttribute("conTypeList", conTypeList);
		model.addAttribute("queTypeList", queTypeList);

		return "/question/questionManage.jsp";

	}

	@RequestMapping(value = "/question/fileImport.action", method = RequestMethod.POST)
	public String questionImport(HttpServletRequest httpServletRequest, @RequestParam("excelFile") MultipartFile file,
			Model model) {
		long conType_id = Long.parseLong(httpServletRequest.getParameter("conType_id"));
		long queType_id = Long.parseLong(httpServletRequest.getParameter("queType_id"));
		Integer num = null;
		try {
			num = questionService.importExcel(file, conType_id, queType_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			model.addAttribute("importMsg", e.getMessage());
		}
		model.addAttribute("importMsg", "数据导入成功!导入：" + num + "条");

		return "/question/questionManage.jsp";

	}

	@RequestMapping("/question/questionView.action")
	public String questionView(Model model, Question question) {
		Map<String, Object> map =this.questionToMap(question);
		
		List<ContentType> conTypeList = contentTypeService.find(null);
		List<QuestionType> queTypeList = questionTypeService.find(null);
		model.addAttribute("conTypeList", conTypeList);
		model.addAttribute("queTypeList", queTypeList);
		List<Question> questionList = questionService.find(map);
		
		model.addAttribute("list", questionList);
		
		model.addAttribute("conTypeId", question.getConType_id());
		model.addAttribute("queTypeId", question.getQueType_id());
		model.addAttribute("currentPage", question.getCurrentPage());
		model.addAttribute("startPage", question.getStartPage());
		int countNumber=questionService.count(map);
		model.addAttribute("countNumber", countNumber);
		int pageSize=question.getPageSize();
		model.addAttribute("pageSize", pageSize);
		int sumPageNumber = countNumber % pageSize == 0 ? (countNumber / pageSize) : ((countNumber / pageSize) + 1);
		model.addAttribute("sumPageNumber", sumPageNumber);
		
		return "/question/questionView.jsp";

	}

	private Map<String, Object> questionToMap(Question question) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("questionContent", checkStringIsEmpty(question.getQuestionContent()));
		map.put("conType_id", question.getConType_id());
		map.put("queType_id", question.getQueType_id());
		map.put("choiceA", checkStringIsEmpty(question.getChoiceA()));
		map.put("choiceB", checkStringIsEmpty(question.getChoiceB()));
		map.put("choiceC", checkStringIsEmpty(question.getChoiceC()));
		map.put("choiceD", checkStringIsEmpty(question.getChoiceD()));
		map.put("standardAnswer", checkStringIsEmpty(question.getStandardAnswer()));
		map.put("startPage", question.getStartPage());
		map.put("pageSize", question.getPageSize());

		return map;
	}
	
	private String checkStringIsEmpty(String parm) {

		return parm == null ? null : (parm.equals("") ? null : "%" + parm + "%");
	}
	
	@RequestMapping("/question/editQuestion.action")
	public @ResponseBody Question editQuestion(@RequestBody String json){
		long id=JSONObject.parseObject(json).getLongValue("id");
		return questionService.get(id);
		
	}
	
	@RequestMapping("/question/edit.action")
	public String edit(Model model ,Question question ){
		questionService.update(question);
		
		Question queryQuestion=new Question();
		queryQuestion.setStartPage(question.getStartPage());
		queryQuestion.setCurrentPage(question.getCurrentPage());
		queryQuestion.setPageSize(question.getPageSize());
		return questionView(model, queryQuestion);
		
	}

}
