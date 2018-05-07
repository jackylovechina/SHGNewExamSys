package shg.examsys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import shg.examsys.service.ContentTypeService;
import shg.examsys.service.QuestionTypeService;

@Controller
public class ExamQuestionController extends BaseController{
	
	@Autowired
	ContentTypeService contentTypeService;
	@Autowired
	QuestionTypeService questionTypeService;

}
