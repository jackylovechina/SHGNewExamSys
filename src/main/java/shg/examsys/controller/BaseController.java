package shg.examsys.controller;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public abstract class BaseController {
	
	@InitBinder//此方法用于日期的转换，若页面日期格式错误，将报400错误
	public void initBinder(WebDataBinder binder){
		DateFormat dataFormat=new SimpleDateFormat();
		dataFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dataFormat, true));
	}

}
