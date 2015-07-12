package cn.edu.niit.jobrecruitment.struts2.action;

import java.util.Properties;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.niit.jobrecruitment.util.DataUtil;
import cn.edu.niit.jobrecruitment.util.PropertiesConfig;
import cn.edu.niit.jobrecruitment.util.ValidateUtil;

import com.opensymphony.xwork2.ActionSupport;
@Controller
@Scope("prototype")
public class AdminAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private String password;
	private String newPassword;
	private String confirmPassword;
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	/**
	 * 到达主页面
	 */
	public String toIndex() {
		return "toIndex";
	}
	
	/**
	 * 到达修改密码页面
	 */
	public String toModifyPwPage() {
		return "toModifyPwPage";
	}
	
	/**
	 * admin修改密码
	 */
	public String doModifyPw() {
		PropertiesConfig.writeFile("admincfg.properties", "password", DataUtil.md5(newPassword));
		return "modifyPw";
	}
	
	/**
	 * 验证
	 */
	public void validateDoModifyPw() {
		//验证原密码正确性
		Properties props = PropertiesConfig.readFile("admincfg.properties");
		String adminPassword = props.getProperty("password");
		if (!adminPassword.equals(DataUtil.md5(password))) {
			addActionError("原密码错误");
		}
		
		if (!ValidateUtil.isValid(newPassword)) {
			addFieldError("newPassword", "新密码是必填项。");
		}
		if (hasErrors()) {
			return;
		}
		// 密码一致性
		if (!newPassword.equals(confirmPassword)) {
			addFieldError("newPassword", "密码不一致。");
			return;
		}
	}


}
