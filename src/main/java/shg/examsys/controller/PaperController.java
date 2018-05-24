package shg.examsys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;

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
	public String paperManage(Model model, Paper paper) {

		List<Exam> examList = examService.find(null);
		model.addAttribute("examList", examList);

		return "/paper/paperManage.jsp";
	}

	@RequestMapping("/paper/prePaperView.action")
	public String prePaperView(Model model) {

		List<Exam> examList = examService.find(null);
		model.addAttribute("examList", examList);
		return "/paper/prePaperView.jsp";

	}

	@RequestMapping("/paper/paperView.action")
	public String paperView(Model model, Paper paper, Long exam_id) {
		Map<String, Object> map = paperToMap(paper);
		map.put("exam_id", exam_id);

		List<Paper> list = paperService.find(map);
		List<Exam> examList = examService.find(null);
		model.addAttribute("old_exam_id", exam_id);
		model.addAttribute("list", list);
		model.addAttribute("examList", examList);

		model.addAttribute("currentPage", paper.getCurrentPage());
		model.addAttribute("startPage", paper.getStartPage());
		int countNumber = paperService.count(map);
		model.addAttribute("countNumber", countNumber);
		int pageSize = paper.getPageSize();
		model.addAttribute("pageSize", pageSize);
		int sumPageNumber = countNumber % pageSize == 0 ? (countNumber / pageSize) : ((countNumber / pageSize) + 1);
		model.addAttribute("sumPageNumber", sumPageNumber);
		return "/paper/paperView.jsp";

	}

	private Map<String, Object> paperToMap(Paper paper) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("exam_id", paper.getExam_id());
		map.put("name", checkStringIsEmpty(paper.getName()));
		map.put("totalScore", paper.getTotalScore());
		map.put("singleChoiceCount", paper.getSingleChoiceCount());
		map.put("singleChoiceValue", paper.getSingleChoiceValue());
		map.put("multiChoiceCount", paper.getMultiChoiceCount());
		map.put("multiChoiceValue", paper.getMultiChoiceValue());
		map.put("blankCount", paper.getBlankCount());
		map.put("blankValue", paper.getBlankValue());
		map.put("judgeCount", paper.getJudgeCount());
		map.put("judgeValue", paper.getJudgeValue());
		map.put("descriptionCount", paper.getDescriptionCount());
		map.put("descriptionValue", paper.getDescriptionValue());
		map.put("startPage", paper.getStartPage());
		map.put("pageSize", paper.getPageSize());

		return map;

	}

	private String checkStringIsEmpty(String parm) {

		return parm == null ? null : (parm.equals("") ? null : "%" + parm + "%");
	}

	@RequestMapping("/paper/addPaper.action")
	public String addPaper(Model model, Paper paper) {
		paperService.insert(paper);
		model.addAttribute("addInfo", "添加试卷成功！");

		return paperManage(model, paper);

	}

	@RequestMapping("/paper/delete.action")
	public String delete(Model model, Paper paper, @RequestBody String json) {
		long id = JSONObject.parseObject(json).getLongValue("id");
		paperService.deleteById(id);

		Paper queryPaper = new Paper();
		queryPaper.setStartPage(paper.getStartPage());
		queryPaper.setCurrentPage(paper.getCurrentPage());
		queryPaper.setPageSize(paper.getPageSize());
		return paperView(model, queryPaper, paper.getExam_id());

	}

}
