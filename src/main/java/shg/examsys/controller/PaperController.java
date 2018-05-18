package shg.examsys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import shg.examsys.service.PaperService;

@Controller
public class PaperController {
	
	@Autowired
	PaperService paperService;
	
	@RequestMapping("/paper/paperManage.action")
	public String paperManage(){
		
		return "/paper/paperManage.jsp";
	}

}
