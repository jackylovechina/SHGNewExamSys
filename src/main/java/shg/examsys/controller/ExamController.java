package shg.examsys.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import shg.examsys.entity.Exam;
import shg.examsys.service.ExamService;

@Controller
public class ExamController extends BaseController {

	@Resource
	ExamService examService;

	@RequestMapping("/exam/examManage.action")
	public String examManage() {
		return "/exam/examManage.jsp";
	}
	
	@RequestMapping("/exam/examImport.action")
	public String examImport(Model model,Exam exam){
		
		return "/exam/examImport.jsp";
		
	}
	
	@RequestMapping("/exam/importExam.action")
	public String importExam(Model model ,Exam exam){
		examService.insert(exam);
		model.addAttribute("Info", "添加成功！");
		return examImport(model,exam);
		
	}

}
