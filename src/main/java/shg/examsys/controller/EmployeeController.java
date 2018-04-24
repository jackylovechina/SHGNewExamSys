package shg.examsys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import shg.examsys.entity.Employee;

@Controller
public class EmployeeController extends BaseController{
	
	
	
	
	@RequestMapping("/employee/toLogin.action")
	private String findOri(Employee employee,Model model){
		
		return "/login.jsp";
		
	}
	
	
}
