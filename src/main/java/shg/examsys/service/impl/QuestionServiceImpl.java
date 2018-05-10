package shg.examsys.service.impl;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import shg.examsys.dao.QuestionDao;
import shg.examsys.entity.Question;
import shg.examsys.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionDao questionDao;

	@Override
	public Question get(Serializable id) {
		// TODO Auto-generated method stub
		return questionDao.get(id);
	}

	@Override
	public List<Question> find(Map map) {
		// TODO Auto-generated method stub
		return questionDao.find(map);
	}

	@Override
	public void insert(Question question) {
		// TODO Auto-generated method stub
		questionDao.insert(question);
	}

	@Override
	public void update(Question question) {
		// TODO Auto-generated method stub
		questionDao.update(question);
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		questionDao.deleteById(id);
	}

	@Override
	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		questionDao.delete(ids);
	}

	@SuppressWarnings("resource")
	@Override
	public Integer importExcel(MultipartFile myFile ,long conType_id,long queType_id) throws Exception {
		Workbook workbook = null;
		String fileName = myFile.getOriginalFilename();
		if (fileName.endsWith("xls")) {
			workbook = new HSSFWorkbook(myFile.getInputStream());
		} else if (fileName.endsWith("xlsx")) {
			workbook = new XSSFWorkbook(myFile.getInputStream());
		} else {
			throw new Exception("文件不是Excel文件！");
		}

		Sheet sheet = workbook.getSheet("Sheet1");
		int rows = sheet.getLastRowNum();
		if (rows == 0) {
			throw new Exception("请填写数据！");
		}

		for (int i = 1; i < rows + 1; i++) {
			Row row = sheet.getRow(i);
			if (row != null) {
				Question question = new Question();
				question.setConType_id(conType_id);
				question.setQueType_id(queType_id);
				//
				String questionContent =getCellValue(row.getCell(0));
				question.setQuestionContent(questionContent);
				//
				String choiceA=getCellValue(row.getCell(1));
				question.setChoiceA(choiceA);
				//
				String choiceB=getCellValue(row.getCell(2));
				question.setChoiceB(choiceB);
				//
				String choiceC=getCellValue(row.getCell(3));
				question.setChoiceC(choiceC);
				//
				String choiceD=getCellValue(row.getCell(4));
				question.setChoiceD(choiceD);
				//
				String standardAnswer=getCellValue(row.getCell(5));
				question.setStandardAnswer(standardAnswer);
				//
				boolean orderly=Boolean.getBoolean(getCellValue(row.getCell(6))) ;
				question.setOrderly(orderly);
				
				questionDao.insert(question);
			}

			
		}

		return rows;
	}

	private String getCellValue(Cell cell) {
		String value = "";
		if (cell != null) {
			switch (cell.getCellType()) {
			case HSSFCell.CELL_TYPE_NUMERIC:
				value = cell.getNumericCellValue() + "";
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					Date date = cell.getDateCellValue();
					if (date != null) {
						value = new SimpleDateFormat("yyyy-MM-dd").format(date);
					} else {
						value = "";
					}
				} else {
					value = new DecimalFormat("0").format(cell.getNumericCellValue());
				}
				break;
			case HSSFCell.CELL_TYPE_STRING:
				value=cell.getStringCellValue();
				break;
				
			case HSSFCell.CELL_TYPE_BOOLEAN:
				value=cell.getBooleanCellValue()+"";
				break;
			case HSSFCell.CELL_TYPE_FORMULA:
				value=cell.getCellFormula()+"";
				break;
			case HSSFCell.CELL_TYPE_BLANK:
				value="";
				break;
			case HSSFCell.CELL_TYPE_ERROR:
				value="非法字符";
				break;
			default:
				value="位置类型";
				break;
			}
		}

		return value.trim();

	}

	@Override
	public int count(Map map) {
		// TODO Auto-generated method stub
		return questionDao.count(map);
	}

}
