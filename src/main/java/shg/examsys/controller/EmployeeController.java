package shg.examsys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import shg.examsys.entity.Employee;
import shg.examsys.service.EmployeeService;

@Controller
public class EmployeeController extends BaseController{
	
	@Autowired
	EmployeeService employeeService;
	
	
	@RequestMapping("/employee/toLogin.action")
	private String findOri(Employee employee,Model model){
		
		return "/login.jsp";
		
	}
	
	// 列表
		@RequestMapping("/employee/login.action")
		public String login(Employee employee, Model model, HttpServletRequest request) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("username", employee.getNumber());
			map.put("password", employee.getPassword());
			List<Employee> userList = employeeService.find(map);
			if (userList != null && userList.size() > 0) {
				// key传user不行，不知道为什么
				request.getSession().setAttribute("user", userList.get(0));
				return "/home.jsp";// 主页
			}
			model.addAttribute("errorMsg", "登陆失败！账号或密码错误！！");// 错误消息
			return "/login.jsp";// 登录界面

		}
	
}
