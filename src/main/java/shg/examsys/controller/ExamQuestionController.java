package shg.examsys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	
	
	@RequestMapping("/question/questionManage.action")
	public String questionManage(Model model){
		
		List<ContentType> conTypeList=contentTypeService.find(null);
		List<QuestionType> queTypeList=questionTypeService.find(null);
		model.addAttribute("conTypeList", conTypeList);
		model.addAttribute("queTypeList", queTypeList);
		
		return "/question/questionManage.jsp";
		
	}
	
	@RequestMapping(value="/question/fileImport.action",method=RequestMethod.POST)
	public String questionImport(HttpServletRequest httpServletRequest,@RequestParam("excelFile") MultipartFile file,Model model){
		long conType_id=Long.parseLong(httpServletRequest.getParameter("conType_id"));
		long queType_id=Long.parseLong(httpServletRequest.getParameter("queType_id"));
		Integer num = null;
		try {
			num=questionService.importExcel(file, conType_id, queType_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			model.addAttribute("importMsg", e.getMessage());
		}
		model.addAttribute("importMsg", "数据导入成功!导入："+ num +"条");
		
		return "/question/questionManage.jsp";
		
	}
	
	@RequestMapping("/question/questionView.action")
	public String questionView(){
		return "/question/questionView.jsp";
		
	}

}
