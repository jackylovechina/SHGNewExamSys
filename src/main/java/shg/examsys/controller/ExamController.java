package shg.examsys.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import shg.examsys.service.ExamService;

@Controller
public class ExamController extends BaseController {

	@Resource
	ExamService examService;

	@RequestMapping("/exam/examManage.action")
	public String examManage() {
		return "/exam/examManage.jsp";
	}

}
