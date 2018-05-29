package shg.examsys.controller;

import java.util.ArrayList;
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
import shg.examsys.entity.Question;
import shg.examsys.entity.QuestionType;
import shg.examsys.service.ContentTypeService;
import shg.examsys.service.ExamService;
import shg.examsys.service.PaperQuestionService;
import shg.examsys.service.PaperService;
import shg.examsys.service.QuestionTypeService;

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
	@Autowired
	QuestionTypeService questionTypeService;

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

		// 获取题型id
		List<QuestionType> questionTypes = questionTypeService.find(null);
		Long singleID = null;
		List<Question> singleQuestion = new ArrayList<Question>();
		Long multiID = null;
		List<Question> multiQuestion = new ArrayList<Question>();
		Long blankID = null;
		List<Question> blankQuestion = new ArrayList<Question>();
		Long judgeID = null;
		List<Question> judgeQuestion = new ArrayList<Question>();
		Long descripID = null;
		List<Question> descripQuestion = new ArrayList<Question>();
		for (QuestionType questionType : questionTypes) {
			switch (questionType.getTypeName()) {
			case "单项选择题":
				singleID = questionType.getId();
				//System.out.println(singleID+"->singID");
				break;
			case "多项选择题":
				multiID = questionType.getId();
				//System.out.println(multiID+"->multiID");
				break;
			case "填空题":
				blankID = questionType.getId();
				break;
			case "判断题":
				judgeID = questionType.getId();
				break;
			case "简答题":
				descripID = questionType.getId();
				break;

			default:
				break;
			}
		}

		// 重新存储题目
		if (paperQuestions.size() > 0) {
			model.addAttribute("papQuestionInfo", paper.getName());
			
			for (PaperQuestion paperQuestion : paperQuestions) {
				Question question= paperQuestion.getQuestion();
				
				if (question.getQueType_id().equals(singleID)) {
					singleQuestion.add(question);
				}
				if (question.getQueType_id().equals(multiID)) {
					multiQuestion.add(question);
				}
				if (question.getQueType_id().equals(blankID)) {
					blankQuestion.add(question);
				}
				if (question.getQueType_id().equals(judgeID)) {
					judgeQuestion.add(question);
				}
				if (question.getQueType_id().equals(descripID)) {
					descripQuestion.add(question);
				}
			}

			model.addAttribute("singleList", singleQuestion);
			model.addAttribute("multiList", multiQuestion);
			model.addAttribute("blankList", blankQuestion);
			model.addAttribute("judgeList", judgeQuestion);
			model.addAttribute("descripList", descripQuestion);
		} else {
			model.addAttribute("papQuestionInfo", "未生成试卷");
		}
		return "/paper/paperDetail.jsp";

	}

}
