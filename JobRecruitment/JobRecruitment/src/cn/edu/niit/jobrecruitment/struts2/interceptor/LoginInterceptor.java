package cn.edu.niit.jobrecruitment.struts2.interceptor;

import cn.edu.niit.jobrecruitment.model.Enterprise;
import cn.edu.niit.jobrecruitment.model.User;
import cn.edu.niit.jobrecruitment.struts2.EnterpriseAware;
import cn.edu.niit.jobrecruitment.struts2.UserAware;
import cn.edu.niit.jobrecruitment.struts2.action.LoginAction;
import cn.edu.niit.jobrecruitment.struts2.action.PostsAction;
import cn.edu.niit.jobrecruitment.struts2.action.RegAction;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * 登陆拦截器
 */
public class LoginInterceptor implements Interceptor {

	private static final long serialVersionUID = 8617175226131665598L;

	public void destroy() {

	}

	public void init() {

	}

	public String intercept(ActionInvocation arg0) throws Exception {
		ActionSupport action = (ActionSupport) arg0.getAction();
		if (action instanceof LoginAction || action instanceof RegAction) {
			return arg0.invoke();
		} else {
			User user = (User) arg0.getInvocationContext().getSession().get("user");
			Enterprise enterprise = (Enterprise) arg0.getInvocationContext().getSession().get("enterprise");
			String admin = (String) arg0.getInvocationContext().getSession().get("admin");
			if (user == null && enterprise == null && admin == null) {
				return "login";
			} else {
				if (action instanceof UserAware) {
					//注入user给action
					((UserAware)action).setUser(user);
				}
				if (action instanceof EnterpriseAware) {
					//注入enterprise给action
					((EnterpriseAware)action).setEnterprise(enterprise);
				}
				return arg0.invoke();
			}
		}
	}

}
