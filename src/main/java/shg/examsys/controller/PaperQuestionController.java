package shg.examsys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import shg.examsys.entity.Paper;
import shg.examsys.entity.PaperQuestion;
import shg.examsys.service.ContentTypeService;
import shg.examsys.service.ExamService;
import shg.examsys.service.PaperQuestionService;
import shg.examsys.service.PaperService;

@Controller
public class PaperQuestionController {

	@Autowired
	PaperQuestionService paperQuestionService;
	@Autowired
	PaperService paperService;
	@Autowired
	ExamService examService;
	@Autowired
	ContentTypeService contentTypeService;

	@RequestMapping("/paperQuestion/create.action")
	public @ResponseBody Paper createNewPaperQuestion(Model model, @RequestBody String json) {
		Long id = JSONObject.parseObject(json).getLong("id");
		Paper paper = paperService.get(id);

		return paper;

	}

	@RequestMapping("/paperQuestion/getPaperDetail")
	public String getPaperDetail(Model model, Long pap_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pap_id", pap_id);
		List<PaperQuestion> paperQuestions = paperQuestionService.find(map);
		Paper paper = paperService.get(pap_id);

		if (paperQuestions.size() > 0) {
			model.addAttribute("papQuestionInfo", paper.getName());
			model.addAttribute("paperList", paperQuestions);
		} else {
			model.addAttribute("papQuestionInfo", "未生成试卷");
		}
		return "/paper/paperDetail.jsp";

	}

}
