package shg.examsys.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
//		String uri=request.getRequestURI();
//		//判断当前请求地址是否登录/注册地址
//		if(!(uri.contains("Login")||uri.contains("login")||uri.contains("register"))){
//			//非登录地�?
//			if(request.getSession().getAttribute("user")!=null){
//				return true;//如果已经登陆过，放行
//			}else{
//				if(uri.contains("css")||uri.contains("js")||uri.contains("images")){
//					return true;//如果是静态资源请求，放行
//				}else{
//					//没有登录，跳转到登录界面
//					response.sendRedirect(request.getContextPath()+"/employee/ori.action");
//					
//				}
//				
//			}
//		}else{
//			//登录请求，直接放�?
//			return true;
//		}
		
		
//		return false;
		return true;
	}

}
