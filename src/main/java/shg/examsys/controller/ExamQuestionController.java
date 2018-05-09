package shg.examsys.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import shg.examsys.entity.ContentType;
import shg.examsys.entity.QuestionType;
import shg.examsys.service.ContentTypeService;
import shg.examsys.service.QuestionService;
import shg.examsys.service.QuestionTypeService;

@Controller
public class ExamQuestionController extends BaseController{
	
	@Autowired
	ContentTypeService contentTypeService;
	@Autowired
	QuestionTypeService questionTypeService;
	@Autowired
	QuestionService questionService;
	
	@RequestMapping("/question/questionImport.action")
	public String questionImport(Model model){
		
		List<ContentType> conTypeList=contentTypeService.find(null);
		List<QuestionType> queTypeList=questionTypeService.find(null);
		model.addAttribute("conTypeList", conTypeList);
		model.addAttribute("queTypeList", queTypeList);
		
		return "/question/questionManage.jsp";
		
	}

}
