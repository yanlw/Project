package cn.edu.niit.jobrecruitment.struts2.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.niit.jobrecruitment.model.Resume;
import cn.edu.niit.jobrecruitment.model.User;
import cn.edu.niit.jobrecruitment.service.ResumeService;
import cn.edu.niit.jobrecruitment.service.UserService;
import cn.edu.niit.jobrecruitment.struts2.UserAware;
import cn.edu.niit.jobrecruitment.util.DataUtil;
import cn.edu.niit.jobrecruitment.util.ValidateUtil;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> implements UserAware{

	private static final long serialVersionUID = 6387327038859750100L;
	@Resource
	private UserService userService;
	@Resource
	private ResumeService resumeService;
	private String newPassword;
	private String confirmPassword;
	private User user;
	private Resume resume;
	private List<User> userList;
	private int sid;

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

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	/**
	 * 到达修改密码页面
	 */
	public String toModifyPwPage() {
		return "toModifyPwPage";
	}
	
	/**
	 * 用户修改密码
	 */
	public String doModifyPw() {
		model = this.user;
		model.setPassword(DataUtil.md5(newPassword));
		userService.updateEntity(model);
		return SUCCESS;
	}
	
	/**
	 * 管理员查询用户列表
	 */
	public String findUserList() {
		userList = userService.findUserList(model);
		return "userList";
	}
	
	/**
	 * 到达修改用户页面
	 */
	public String editUser() {
		model = userService.getEntity(sid);
		return "editUser";
	}
	
	/**
	 * 修改用户信息
	 */
	public String updateUser() {
		userService.updateEntity(model);
		return "UserAction";
	}
	
	/**
	 * 管理员删除用户
	 */
	public String delUser() {
		model = userService.getEntity(sid);
		List<Resume> resumes = resumeService.findMyResume(model);
		for (int i = 0; i < resumes.size(); i++) {
			resume = resumes.get(i);
			resumeService.deleteEntity(resume);
		}
		userService.deleteEntity(model);
		return "UserAction";
	}

	/**
	 * 验证
	 */
	public void validateDoModifyPw() {
		//验证原密码正确性
		if (!user.getPassword().equals(DataUtil.md5(model.getPassword()))) {
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

	public void setUser(User user) {
		this.user = user;
	}

}
