package shg.examsys.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import shg.examsys.entity.Exam;
import shg.examsys.entity.Paper;
import shg.examsys.service.ExamService;
import shg.examsys.service.PaperService;

@Controller
public class PaperController {
	
	@Autowired
	PaperService paperService;
	@Autowired
	ExamService examService;
	
	@RequestMapping("/paper/paperManage.action")
	public String paperManage(Model model,Paper paper){
		List<Exam> examList=examService.find(null);
		model.addAttribute("examList", examList);
		
		return "/paper/paperManage.jsp";
	}

}
