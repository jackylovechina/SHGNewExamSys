package shg.examsys.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;

import shg.examsys.entity.ContentType;
import shg.examsys.entity.Exam;
import shg.examsys.entity.Paper;
import shg.examsys.entity.PaperQuestion;
import shg.examsys.entity.Question;
import shg.examsys.entity.QuestionType;
import shg.examsys.service.ContentTypeService;
import shg.examsys.service.ExamService;
import shg.examsys.service.PaperQuestionService;
import shg.examsys.service.PaperService;
import shg.examsys.service.QuestionService;
import shg.examsys.service.QuestionTypeService;

@Controller
public class PaperController {

	@Autowired
	PaperService paperService;
	@Autowired
	ExamService examService;
	@Autowired
	QuestionService questionService;
	@Autowired
	ContentTypeService contentTypeService;
	@Autowired
	PaperQuestionService paperQuestionService;
	@Autowired
	QuestionTypeService questionTypeService;

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

		List<ContentType> conTypeList = contentTypeService.find(null);
		model.addAttribute("conTypeList", conTypeList);

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

	@RequestMapping("/paper/createPaper.action")
	public String createPaper(Model model, Paper paper, Long conType_id, Long pap_id) {
		Map<String, Object> paperQuestionMap = new HashMap<String, Object>();
		paperQuestionMap.put("pap_id", pap_id);

		List<PaperQuestion> paperQuestionList = paperQuestionService.find(paperQuestionMap);
		Paper paperInfo = paperService.get(pap_id);
		Integer singleCount = paperInfo.getSingleChoiceCount();
		Double singleValue = paperInfo.getSingleChoiceValue();
		Integer multiCount = paperInfo.getMultiChoiceCount();
		Double multiValue = paperInfo.getMultiChoiceValue();
		Integer blankCount = paperInfo.getBlankCount();
		Double blankValue = paperInfo.getBlankValue();
		Integer judgeCount = paperInfo.getJudgeCount();
		Double judgeValue = paperInfo.getJudgeValue();
		Integer descriptionCount = paperInfo.getDescriptionCount();
		Double descriptionValue = paperInfo.getDescriptionValue();

		if (paperQuestionList.size() != 0 && paperQuestionList != null) {

			model.addAttribute("createInfo", "试卷已经生成，不要重复生成！");
		} else {
			if (singleCount != 0) {
				addPQList(paperQuestionList, pap_id, conType_id, singleCount, singleValue, "单项选择题");
			}
			if (multiCount != 0) {
				addPQList(paperQuestionList, pap_id, conType_id, multiCount, multiValue, "多项选择题");
			}
			if (blankCount != 0) {
				addPQList(paperQuestionList, pap_id, conType_id, blankCount, blankValue, "填空题");
			}
			if (judgeCount != 0) {
				addPQList(paperQuestionList, pap_id, conType_id, judgeCount, judgeValue, "判断题");
			}
			if (descriptionCount != 0) {
				addPQList(paperQuestionList, pap_id, conType_id, descriptionCount, descriptionValue, "简答题");
			}
			paperQuestionService.insertMulti(paperQuestionList);
			model.addAttribute("createInfo", "试卷自动生成成功！");
		}
		return paperView(model, paper, null);
   
		
	}

	private List<Question> getRandomList(List<Question> paramList, int count) {
		if (paramList.size() < count) {
			return paramList;
		}
		Random random = new Random();
		List<Integer> tempList = new ArrayList<Integer>();
		List<Question> newList = new ArrayList<Question>();
		int temp = 0;
		for (int i = 0; i < count; i++) {
			temp = random.nextInt(paramList.size());// 将产生的随机数作为被抽list的索引
			if (!tempList.contains(temp)) {
				tempList.add(temp);
				newList.add(paramList.get(temp));
			} else {
				i--;
			}
		}
		return newList;
	}

	private List<PaperQuestion> addPQList(List<PaperQuestion> arrayList, Long pap_id, Long conType_id, Integer count,
			Double value, String que_typeName) {
		// 根据题型名找queType_id
		Map<String, Object> queTypeMap = new HashMap<String, Object>();
		queTypeMap.put("typeName", que_typeName);
		List<QuestionType> questionTypeList = questionTypeService.find(queTypeMap);
		Long queType_id = questionTypeList.get(0).getId();
		// 跟据题型和题目种类找questionList
		Map<String, Object> questionMap = new HashMap<String, Object>();
		questionMap.put("queType_id", queType_id);
		questionMap.put("conType_id", conType_id);
		//System.out.println("666777888"+conType_id);
		List<Question> QueList = questionService.find(questionMap);
		// 生成随机新的试题list
		List<Question> newQueList = getRandomList(QueList, count);
		// 为paper_question添加数据
		for (Question question : newQueList) {
			PaperQuestion paperQuestion = new PaperQuestion();
			paperQuestion.setPap_id(pap_id);
			paperQuestion.setQue_id(question.getId());
			paperQuestion.setValue(value);
			arrayList.add(paperQuestion);
		}

		return arrayList;

	}

}
