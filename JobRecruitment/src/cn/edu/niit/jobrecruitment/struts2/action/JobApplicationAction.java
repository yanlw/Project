package cn.edu.niit.jobrecruitment.struts2.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.niit.jobrecruitment.model.Enterprise;
import cn.edu.niit.jobrecruitment.model.JobApplication;
import cn.edu.niit.jobrecruitment.model.Posts;
import cn.edu.niit.jobrecruitment.model.Resume;
import cn.edu.niit.jobrecruitment.model.User;
import cn.edu.niit.jobrecruitment.service.JobApplicationService;
import cn.edu.niit.jobrecruitment.service.ResumeService;
import cn.edu.niit.jobrecruitment.struts2.EnterpriseAware;
import cn.edu.niit.jobrecruitment.struts2.UserAware;
import cn.edu.niit.jobrecruitment.util.ValidateUtil;

/**
 * 申请职位action
 */
@Controller
@Scope("prototype")
public class JobApplicationAction extends BaseAction<JobApplication> implements
		EnterpriseAware, UserAware {

	private static final long serialVersionUID = 1L;
	@Resource
	private JobApplicationService jobApplicationService;
	@Resource
	private ResumeService resumeService;
	// 接收Enterprise对象
	private Enterprise enterprise;
	// 接收User对象
	private User user;
	
	private int sid;
	private int eid;
	private List<Object[]> myApplication;
	private Posts posts;
	private Resume resume;
	private Date startDate;
	private Date endDate;

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	// 注入User对象
	public void setUser(User user) {
		this.user = user;
	}

	// 注入Enterprise对象
	public void setEnterprise(Enterprise enterprise) {
		this.enterprise = enterprise;
	}
	
	public List<Object[]> getMyApplication() {
		return myApplication;
	}

	public void setMyApplication(List<Object[]> myApplication) {
		this.myApplication = myApplication;
	}

	public Posts getPosts() {
		return posts;
	}

	public void setPosts(Posts posts) {
		this.posts = posts;
	}

	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Enterprise getEnterprise() {
		return enterprise;
	}

	/**
	 * 用户申请职位
	 */
	public String application(){
		model.setUserId(user.getId());
		model.setEnterpriseId(eid);
		model.setPostsId(sid);
		model.setCreateDate(new Date());
		if (ValidateUtil.isValid(resumeService.findMyResume(user))) {
			model.setResumeId(resumeService.findMyResume(user).get(0).getId());
		}
		if (!jobApplicationService.isExistResume(user.getId(), sid)) {
			jobApplicationService.saveEntity(model);
		}
		return "previewPosts";
	}
	
	/**
	 * 用户查看简历投递记录
	 */
	public String applicationList() {
		model.setUserId(user.getId());
		model.setPostsId(sid);
		myApplication = jobApplicationService.findApplicationList(model, posts, startDate, endDate);
		return "applicationList";
	}
	
	/**
	 * 用户删除简历投递记录
	 */
	public String delApplication() {
		model = jobApplicationService.getEntity(sid);
		jobApplicationService.deleteEntity(model);
		return SUCCESS;
	}
	
	/**
	 * 企业查看投递记录
	 */
	public String myResumeList() {
		model.setEnterpriseId(enterprise.getId());
		myApplication = jobApplicationService.findMyResumeList(model, posts, resume, startDate, endDate);
		return "myResumeList";
	}
	
	/**
	 * 企业更新投递记录状态，通过或拒绝简历
	 */
	public String updateStatus() {
		jobApplicationService.updateStatus(sid, eid);;
		return "updateStatus";
	}
}
