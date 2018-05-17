package shg.examsys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

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
	public String examImport(Model model, Exam exam) {
		return "/exam/examImport.jsp";

	}

	@RequestMapping("/exam/importExam.action")
	public String importExam(Model model, Exam exam) {
		examService.insert(exam);
		model.addAttribute("Info", "添加成功！");
		return examImport(model, exam);

	}

	@RequestMapping("/exam/examView.action")
	public String examView(Model model, Exam exam) {

		Map<String, Object> map = examToMap(exam);
		List<Exam> examList = examService.find(map);
		model.addAttribute("list", examList);
		model.addAttribute("currentPage", exam.getCurrentPage());
		model.addAttribute("startPage", exam.getStartPage());
		int countNumber = examService.count(map);
		model.addAttribute("countNumber", countNumber);
		int pageSize = exam.getPageSize();
		model.addAttribute("pageSize", pageSize);
		int sumPageNumber = countNumber % pageSize == 0 ? (countNumber / pageSize) : ((countNumber / pageSize) + 1);
		model.addAttribute("sumPageNumber", sumPageNumber);
		return "/exam/examView.jsp";

	}

	private Map<String, Object> examToMap(Exam exam) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("examName", checkStringIsEmpty(exam.getExamName()));
		map.put("startTime", exam.getStartTime());
		map.put("endTime", exam.getEndTime());

		return map;
	}

	private String checkStringIsEmpty(String parm) {

		return parm == null ? null : (parm.equals("") ? null : "%" + parm + "%");
	}

	@RequestMapping("/exam/editExam.action")
	public @ResponseBody Exam editExam(@RequestBody String json) {
		long id = JSONObject.parseObject(json).getLongValue("id");
		Exam exam = examService.get(id);
		return exam;

	}

	@RequestMapping("/exam/edit.action")
	public String edit(Model model, Exam exam) {
		examService.update(exam);
		
		Exam queryExam=new Exam();
		queryExam.setStartPage(exam.getStartPage());
		queryExam.setCurrentPage(exam.getCurrentPage());
		queryExam.setPageSize(exam.getPageSize());
		return examView(model, queryExam);

	}

}
