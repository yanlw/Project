package com.rrb.alliance.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.rrb.alliance.entity.Member;

/*
 * 登录拦截器 没有登录有的页面去不了
 */
public class AllianceInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object obj) throws Exception {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			response.sendRedirect(request.getContextPath()
					+ "/alliance/index.do");
			return false;
		}
		return true;
	}

}
