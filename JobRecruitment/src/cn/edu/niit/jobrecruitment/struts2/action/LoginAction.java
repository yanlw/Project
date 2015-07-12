package cn.edu.niit.jobrecruitment.struts2.action;

import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.niit.jobrecruitment.model.Enterprise;
import cn.edu.niit.jobrecruitment.model.User;
import cn.edu.niit.jobrecruitment.service.EnterpriseService;
import cn.edu.niit.jobrecruitment.service.UserService;
import cn.edu.niit.jobrecruitment.util.DataUtil;
import cn.edu.niit.jobrecruitment.util.PropertiesConfig;

/**
 * 登陆action
 */
@Controller
@Scope("prototype")
public class LoginAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = -5015340340787413636L;

	@Resource
	private UserService userService;

	@Resource
	private EnterpriseService enterpriseService;

	// 接收session的Map
	private Map<String, Object> sessionMap;

	private String userName;
	private String email;
	private String password;
	private String loginType;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public EnterpriseService getEnterpriseService() {
		return enterpriseService;
	}

	public void setEnterpriseService(EnterpriseService enterpriseService) {
		this.enterpriseService = enterpriseService;
	}

	public Map<String, Object> getSessionMap() {
		return sessionMap;
	}

	public void setSessionMap(Map<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	/**
	 * 到达登录页面
	 */
	public String toLoginPage() {
		if ("1".equals(loginType)) {
			// 企业用户到达登录页面
			return "enLoginPage";
		}
		return "loginPage";
	}

	/**
	 * 进行登录处理
	 */
	public String doLogin() {
		if ("1".equals(loginType)) {
			// 进行企业登录处理
			return "enLonginSuccess";
		}else if ("2".equals(loginType)) {
			//管理员登录处理
			return "adminLogin";
		}
		return SUCCESS;
	}
	
	/**
	 * 用户注销登录
	 */
	public String doLogout() {
		if ("1".equals(loginType)) {
			sessionMap.put("enterprise", null);
		} else if ("2".equals(loginType)) {
			sessionMap.put("admin", null);
		} else {
			sessionMap.put("user", null);
		}
		return "logout";
	}

	/**
	 * 校验登录信息
	 */
	public void validateDoLogin() {
		if ("1".equals(loginType)) {
			// 进行企业登录处理
			Enterprise enterprise = enterpriseService.validateLoginInfo(userName, DataUtil.md5(password));
			if (enterprise == null) {
				addActionError("用户名或密码错误");
			} else {
				sessionMap.put("enterprise", enterprise);
			}
		} else if ("2".equals(loginType)) {
			// 进行管理员登录处理admin
			Properties props = PropertiesConfig.readFile("admincfg.properties");
			String adminName = props.getProperty("userName");
			String adminPassword = props.getProperty("password");
			if (adminName.equalsIgnoreCase(userName) && adminPassword.equals(DataUtil.md5(password))) {
				sessionMap.put("admin", adminName);
			}else {
				addActionError("用户名或密码错误");
			}
			
		} else {
			// 一般用户
			User user = userService.validateloginInfo(email,
					DataUtil.md5(password));
			if (user == null) {
				addActionError("email/password错误");
			} else {
				sessionMap.put("user", user);
			}
		}
	}

	public void setSession(Map<String, Object> arg0) {
		this.sessionMap = arg0;
	}
}
