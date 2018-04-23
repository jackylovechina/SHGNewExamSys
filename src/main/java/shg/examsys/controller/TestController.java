package shg.examsys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import shg.examsys.entity.Employee;
import shg.examsys.service.TestService;

@Controller
public class TestController {
	
	@Autowired
	TestService testService;
	
	@RequestMapping("/employee/findEmployee.action")
	private String findEmployee(Employee employee,Model model){
		Map<String,String> map=new HashMap<String, String>();
		map.put("name", employee.getName());
		map.put("number", employee.getNumber());
		map.put("password", employee.getPassword());
		map.put("sex", employee.getSex());
		map.put("salt", employee.getSalt());
		map.put("dep_id", employee.getDep_id()+"");
		map.put("role_id",employee.getRole_id()+"");
		List<Employee> employeeList=testService.find(map);
		model.addAttribute("employeeList",employeeList);
		
		return "/test/test.jsp";
		
	}
	
	@RequestMapping("/employee/ori.action")
	private String findOri(Employee employee,Model model){
		
		return "/test/test.jsp";
		
	}


}
