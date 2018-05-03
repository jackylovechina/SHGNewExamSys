package shg.examsys.controller;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
import shg.examsys.service.EmployeeService;

@Controller
public class EmployeeController extends BaseController {

	@Autowired
	EmployeeService employeeService;

	@RequestMapping("/employee/toLogin.action")
	private String findOri(Employee employee, Model model) {

		return "/login.jsp";

	}

	// 列表
	@RequestMapping("/employee/login.action")
	public String login(Employee employee, Model model, HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", employee.getNumber());
		// map.put("password", getMD5PW(employee.getPassword()));
		List<Employee> userList = employeeService.find(map);
		if (userList != null && userList.size() > 0) {
			String realPassword = userList.get(0).getPassword();
			String salt = userList.get(0).getSalt();
			String password = employee.getPassword() + salt;
			String MD5password = getMD5PW(password);
			if (MD5password == realPassword || MD5password.equals(realPassword)) {
				request.getSession().setAttribute("user", userList.get(0));
				return "/home.jsp";// 主页
			}
		}
		model.addAttribute("errorMsg", "登陆失败！账号或密码错误！！");// 错误消息
		return "/login.jsp";// 登录界面

		/*
		 * if (userList != null && userList.size() > 0) { //
		 * key传user不行，不知道为什么,${sessionScope.user.name }取值方式可行
		 * request.getSession().setAttribute("user", userList.get(0)); return
		 * "/home.jsp";// 主页 } model.addAttribute("errorMsg",
		 * "登陆失败！账号或密码错误！！");// 错误消息 return "/login.jsp";// 登录界面
		 */

	}

	private String getMD5PW(String pw) {
		try {
			// 获取 MessageDigest 对象，参数为 MD5 字符串，表示这是一个 MD5 算法（其他还有 SHA1 算法等）：
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			// update(byte[])方法，输入原数据
			// 类似StringBuilder对象的append()方法，追加模式，属于一个累计更改的过程
			md5.update(pw.getBytes("UTF-8"));
			// digest()被调用后,MessageDigest对象就被重置，即不能连续再次调用该方法计算原数据的MD5值。可以手动调用reset()方法重置输入源。
			// digest()返回值16位长度的哈希值，由byte[]承接
			byte[] md5Array = md5.digest();
			// byte[]通常我们会转化为十六进制的32位长度的字符串来使用,本文会介绍三种常用的转换方法
			return bytesToHex1(md5Array);
		} catch (NoSuchAlgorithmException e) {
			return "";
		} catch (UnsupportedEncodingException e) {
			return "";
		}

	}

	private static String bytesToHex1(byte[] md5Array) {
		StringBuilder strBuilder = new StringBuilder();
		for (int i = 0; i < md5Array.length; i++) {
			int temp = 0xff & md5Array[i];// TODO:此处为什么添加 0xff & ？
			String hexString = Integer.toHexString(temp);
			if (hexString.length() == 1) {// 如果是十六进制的0f，默认只显示f，此时要补上0
				strBuilder.append("0").append(hexString);
			} else {
				strBuilder.append(hexString);
			}
		}
		return strBuilder.toString();
	}

	// 跳转注册界面
	@RequestMapping("/employee/registerPage.action")
	public String toRegister() {
		return "/register.jsp";

	}

	// 注册逻辑
	@RequestMapping("/user/register.action")
	public String register(Employee user, Model model, HttpServletRequest request, HttpServletResponse response) {
		// 查找账号是否已被注册
		Map<String, String> map = new HashMap<String, String>();
		map.put("usernumber", user.getNumber());
		List<Employee> userList = employeeService.find(map);
		if (userList != null && userList.size() > 0) {
			// 已注册，提示用户，回到注册界面
			model.addAttribute("errorMsg", "注册失败，用户名已被占用！");
			return "/register.jsp";
		}

		
		employeeService.insert(user);
		model.addAttribute("noticeMsg", "注册成功，请输入账号密码登录");// 注册成功
		return "/login.jsp";// 登录界面

	}
}
