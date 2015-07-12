package cn.edu.niit.jobrecruitment.struts2.action;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.niit.jobrecruitment.model.Enterprise;
import cn.edu.niit.jobrecruitment.model.User;
import cn.edu.niit.jobrecruitment.service.EnterpriseService;
import cn.edu.niit.jobrecruitment.service.UserService;
import cn.edu.niit.jobrecruitment.util.DataUtil;
import cn.edu.niit.jobrecruitment.util.ValidateUtil;

/**
 * 注册action
 */
@Controller
@Scope("prototype")
public class RegAction extends BaseAction<Enterprise> {
	private static final long serialVersionUID = 1L;

	// 注入userService
	@Resource
	private UserService userService;
	
	@Resource
	private EnterpriseService enterpriseService;
	
	private String regType;
	private String confirmPassword;

	public String getRegType() {
		return regType;
	}

	public void setRegType(String regType) {
		this.regType = regType;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	/**
	 * 到达注册页面
	 */
	@SkipValidation
	public String toRegPage() {
		if ("1".equals(regType)) {
			return "enRegPage";
		}
		return "regPage";
	}

	/**
	 * 进行注册
	 */
	public String doReg() {
		if ("1".equals(regType)) {
			model.setPassword(DataUtil.md5(model.getPassword()));
			enterpriseService.saveEntity(model);
			return SUCCESS;
		}
		User user = new User();
		user.setEmail(model.getEmail());
		user.setPassword(DataUtil.md5(model.getPassword()));
		user.setRegDate(new Date());
		userService.saveEntity(user);
		return SUCCESS;
	}

	/**
	 * 验证
	 */
	public void validate() {
		if ("1".equals(regType)) {
			// 1.非空
			if (!ValidateUtil.isValid(model.getUserName())) {
				addFieldError("userName", "用户名是必填项。");
			}
			if (!ValidateUtil.isValid(model.getPassword())) {
				addFieldError("password", "password是必填项。");
			}
			if (!ValidateUtil.isValid(model.getEmail())) {
				addFieldError("email", "email是必填项。");
			}
			if (!ValidateUtil.isValid(model.getCompName())) {
				addFieldError("compName", "企业名称是必填项。");
			}
			if (!ValidateUtil.isValid(model.getCompAddress())) {
				addFieldError("compAddress", "企业地址是必填项。");
			}
			if (!ValidateUtil.isValid(model.getContactor())) {
				addFieldError("contactor", "联系人是必填项。");
			}
			if (!ValidateUtil.isValid(model.getPhone())) {
				addFieldError("phone", "联系方式是必填项。");
			}
			if (hasErrors()) {
				return;
			}

			// 2.密码一致性
			if (!model.getPassword().equals(confirmPassword)) {
				addFieldError("password", "密码不一致。");
				return;
			}

			// 3.email占用
			if (enterpriseService.isRegisted(model.getUserName())) {
				addFieldError("userName", "用户名已占用。");
				return;
			}
		} else {
			// 1.非空
			if (!ValidateUtil.isValid(model.getEmail())) {
				addFieldError("email", "email是必填项。");
			}
			if (!ValidateUtil.isValid(model.getPassword())) {
				addFieldError("password", "password是必填项。");
			}
			if (hasErrors()) {
				return;
			}

			// 2.密码一致性
			if (!model.getPassword().equals(confirmPassword)) {
				addFieldError("password", "密码不一致。");
				return;
			}

			// 3.email占用
			if (userService.isRegisted(model.getEmail())) {
				addFieldError("email", "email已占用。");
				return;
			}
		}
	}

}
