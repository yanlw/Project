package cn.edu.niit.jobrecruitment.struts2.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.niit.jobrecruitment.model.Enterprise;
import cn.edu.niit.jobrecruitment.model.Posts;
import cn.edu.niit.jobrecruitment.model.User;
import cn.edu.niit.jobrecruitment.service.JobApplicationService;
import cn.edu.niit.jobrecruitment.service.PostsService;
import cn.edu.niit.jobrecruitment.struts2.EnterpriseAware;
import cn.edu.niit.jobrecruitment.struts2.UserAware;

/**
 * 职位action
 */
@Controller
@Scope("prototype")
public class PostsAction extends BaseAction<Posts> implements EnterpriseAware, UserAware{
	private static final long serialVersionUID = -2511626056325120606L;
	@Resource
	private PostsService postsService;
	@Resource
	private JobApplicationService jobApplicationService;
	// 接收enterprise对象
	private Enterprise enterprise;
	// 接收user对象
	private User user;
	private List<Posts> myPosts;
	private int sid;
	private boolean existResume = false;
	private int status;

	// 注入enterprise对象
	public void setEnterprise(Enterprise enterprise) {
		this.enterprise = enterprise;
	}
	
	// 注入user对象
	public void setUser(User user) {
		this.user = user;
	}

	public List<Posts> getMyPosts() {
		return myPosts;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public void setMyPosts(List<Posts> myPosts) {
		this.myPosts = myPosts;
	}

	public boolean isExistResume() {
		return existResume;
	}

	public void setExistResume(boolean existResume) {
		this.existResume = existResume;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	/**
	 * 发布新职位,到达职位页面
	 */
	public String toMyPostsPage() {
		return "postsPage";
	}

	/**
	 * 企业查看发布的职位
	 */
	public String myPosts() {
		this.myPosts = postsService.findMyPosts(enterprise);
		return "myPostsListPage";
	}
	
	/**
	 * 用户查询发布的职位
	 */
	public String findMyPostsList() {
		if (status == 1 || status == -1) {
			model.setApprovalStatus(status);
		}
		this.myPosts = postsService.findMyPostsList(model);
		return "postsFind";
	}

	/**
	 * 编辑职位
	 */
	public String editPosts() {
		this.model = postsService.getEntity(sid);
		return "postsPage";
	}

	/**
	 * 修改职位
	 */
	public String saveOrUpdatePosts() {
		this.sid = model.getId();
		//保持关联
		model.setEnterprise(enterprise);
		model.setLastDate(new Date());
		model.setApprovalStatus(-1);
		postsService.saveOrUpdateEntity(model);
		return SUCCESS;
	}
	
	/**
	 * 删除职位
	 */
	public String delPosts() {
		this.model = postsService.getEntity(sid);
		postsService.deleteEntity(model);
		return SUCCESS;
	}
	
	/**
	 * 职位详情
	 */
	public String previewPosts() {
		this.model = postsService.getEntity(sid);
		if (user != null && jobApplicationService.isExistResume(user.getId(), sid)) {
			existResume = true;
		}
		return "previewPosts";
	}
	
	/**
	 * 审核职位招聘
	 */
	public String checkPosts() {
		this.model = postsService.getEntity(sid);
		int sta = model.getApprovalStatus();
		model.setApprovalStatus(status);
		postsService.updateEntity(model);
		model.setApprovalStatus(sta);
		return "checkPostsAction";
	}
}
