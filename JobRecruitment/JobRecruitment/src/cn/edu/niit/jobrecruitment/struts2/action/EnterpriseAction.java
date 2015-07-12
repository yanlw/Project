package cn.edu.niit.jobrecruitment.struts2.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.niit.jobrecruitment.model.Enterprise;
import cn.edu.niit.jobrecruitment.model.Posts;
import cn.edu.niit.jobrecruitment.service.EnterpriseService;
import cn.edu.niit.jobrecruitment.service.PostsService;
import cn.edu.niit.jobrecruitment.struts2.EnterpriseAware;
import cn.edu.niit.jobrecruitment.util.DataUtil;
import cn.edu.niit.jobrecruitment.util.FileUpload;
import cn.edu.niit.jobrecruitment.util.ValidateUtil;

@Controller
@Scope("prototype")
public class EnterpriseAction extends BaseAction<Enterprise> implements
		EnterpriseAware {

	private static final long serialVersionUID = 1L;

	@Resource
	private EnterpriseService enterpriseService;
	@Resource
	private PostsService postsService;
	// 接收Enterprise对象
	private Enterprise enterprise;

	private int eid;
	private String newPassword;
	private String confirmPassword;
	List<Enterprise> enterpriseList;
	private Posts posts;

	// 注入Enterprise对象
	public void setEnterprise(Enterprise enterprise) {
		this.enterprise = enterprise;
	}

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
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
	
	public List<Enterprise> getEnterpriseList() {
		return enterpriseList;
	}

	public void setEnterpriseList(List<Enterprise> enterpriseList) {
		this.enterpriseList = enterpriseList;
	}

	/**
	 * 到达企业用户首页
	 */
	public String toIndexPage() {
		return "toIndexPage";
	}

	/**
	 * 用户查看企业信息
	 */
	public String previewPage() {
		this.model = enterpriseService.getEntity(eid);
		return "previewPage";
	}

	/**
	 * 到达企业信息页面
	 */
	public String toEnterprisePage() {
		if (enterprise != null) {
			eid = enterprise.getId();
		}
		this.model = enterpriseService.getEntity(eid);
		return "enterprisePage";
	}

	/**
	 * 修改企业信息
	 */
	public String updateEnterprise() {
		if (enterprise != null) {
			model.setUserName(enterprise.getUserName());
			model.setPassword(enterprise.getPassword());
			String filePath = model.getLicenseImage();
			if (filePath != null && filePath.lastIndexOf(".") > 0) {
				String fileName = "licenseImage/" + enterprise.getId();
				fileName += filePath.substring(filePath.lastIndexOf("."));
				FileUpload.fileUpload(filePath, fileName.trim());
				model.setLicenseImage(fileName.trim());
			} else {
				model.setLicenseImage(enterprise.getLicenseImage());
			}
			enterpriseService.updateEntity(model);
			return SUCCESS;
		}
		enterpriseService.updateEntity(model);
		return "enterpriseAction";
	}
	
	/**
	 * 管理员删除企业用户
	 */
	public String delEnterprise() {
		model = enterpriseService.getEntity(eid);
		List<Posts> postsList = postsService.findMyPosts(model);
		for (int i = 0; i < postsList.size(); i++) {
			posts = postsList.get(i);
			postsService.deleteEntity(posts);
		}
		enterpriseService.deleteEntity(model);
		return "enterpriseAction";
	}
	
	/**
	 * 申请认证的企业用户
	 */
	public String findLicenseList() {
		enterpriseList = enterpriseService.findLicenseList(model);
		return "licenseList";
	}
	
	/**
	 *审核认证申请
	 */
	public String checkLicense() {
		model = enterpriseService.getEntity(eid);
		if (enterprise.getAuthenticate() == 1) {
			model.setAuthenticate(1);
		} else {
			model.setAuthenticate(0);
			model.setLicenseImage("");
		}
		enterpriseService.updateEntity(model);
		return "licenseAction";
	}
	
	/**
	 * 到达修改密码页面
	 */
	public String toModifyPwPage() {
		return "toModifyPwPage";
	}
	
	/**
	 * 企业用户修改密码
	 */
	public String doModifyPw() {
		model = this.enterprise;
		model.setPassword(DataUtil.md5(newPassword));
		enterpriseService.updateEntity(model);
		return "modifyPw";
	}
	
	/**
	 * 查询所有企业信息列表
	 */
	public String findEnterpriseList() {
		enterpriseList = enterpriseService.findEnterpriseList(model);
		return "enterpriseList";
	}

	/**
	 * 更新企业信息验证
	 */
	public void validateDoupdateEnterprise() {
		// 1.非空
		if (!ValidateUtil.isValid(model.getIndustry())) {
			addFieldError("industry", "主要行业是必填项。");
		}
		if (!ValidateUtil.isValid(model.getCompanyPersin())) {
			addFieldError("companyPersin", "公司评论是必填项。");
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
		if (!ValidateUtil.isValid(model.getLicenseImage())) {
			addFieldError("licenseImage", "公司认证是必填项。");
		}
	}
	
	/**
	 * 验证
	 */
	public void validateDoModifyPw() {
		//验证原密码正确性
		if (!enterprise.getPassword().equals(DataUtil.md5(model.getPassword()))) {
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
