package cn.edu.niit.jobrecruitment.struts2.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.niit.jobrecruitment.model.Resume;
import cn.edu.niit.jobrecruitment.model.User;
import cn.edu.niit.jobrecruitment.service.ResumeService;
import cn.edu.niit.jobrecruitment.service.UserService;
import cn.edu.niit.jobrecruitment.struts2.UserAware;
import cn.edu.niit.jobrecruitment.util.DateUtil;
import cn.edu.niit.jobrecruitment.util.FileUpload;

/**
 * 简历action
 */
@Controller
@Scope("prototype")
public class ResumeAction extends BaseAction<Resume> implements UserAware {

	private static final long serialVersionUID = 6233543837169466610L;
	@Resource
	private ResumeService resumeService;
	
	@Resource
	private UserService userService;
	// 接收user对象
	private User user;

	private List<Resume> myResumes;
	private int sid;

	public List<Resume> getMyResumes() {
		return myResumes;
	}

	public void setMyResumes(List<Resume> myResumes) {
		this.myResumes = myResumes;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	// 注入User对象
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * 新建简历,到达简历页面
	 */
	public String toResumePage() {
		this.model.setUser(user);
		return "resumePage";
	}

	/**
	 * 查看我的简历
	 */
	public String myResumes() {
		this.myResumes = resumeService.findMyResume(user);
		return "myResumeListPage";
	}

	/**
	 * 编辑简历
	 */
	public String editResumes() {
		this.model = resumeService.getEntity(sid);
		this.user = userService.getEntity(model.getUser().getId());
		model.setUser(user);
		return "resumePage";
	}

	/**
	 * 修改简历
	 */
	public String saveOrUpdateResume() {
		this.sid = model.getId();
		//保持关联关系
		model.getUser().setId(user.getId());
		model.getUser().setPassword(user.getPassword());
		String minYear = DateUtil.DateSubtract(model.getWorkEndDate(), model.getWorkStartDate());
		model.setYear(minYear);
		this.user = model.getUser();
		userService.updateEntity(user);
		model.setUser(user);
		model.setLastDate(new Date());
		String filePath = model.getMyphoto();
		if (filePath != null && filePath.lastIndexOf(".") > 0) {
			String fileName = "resume/" + user.getId();
			fileName += filePath.substring(filePath.lastIndexOf("."));
			FileUpload.fileUpload(filePath, fileName);
			model.setMyphoto(fileName);
		}else {
			if (resumeService.getEntity(sid) != null) {
				String photo = resumeService.getEntity(sid).getMyphoto();
				model.setMyphoto(photo);
			}
		}
		resumeService.saveOrUpdateEntity(model);
		return SUCCESS;
	}
	
	/**
	 * 简历预览
	 */
	public String previewResume() {
		this.model = resumeService.getEntity(sid);
		this.user = userService.getEntity(model.getUser().getId());
		model.setUser(user);
		return "previewResume";
	}
	
	/**
	 * 删除简历
	 */
	public String delResumes() {
		this.model = resumeService.getEntity(sid);
		resumeService.deleteEntity(model);
		return "myResumeListPage";
	}
	
	/**
	 * 搜索所有公开的简历
	 */
	public String findOpenResumes() {
		this.myResumes = resumeService.findOpenResume(model);
		return "openResumePage";
	}
	
	/**
	 * 更新简历时验证信息
	 */
	/*
	 * public void validateDosaveOrUpdateResume() {
	 * 
	 * }
	 */

}
