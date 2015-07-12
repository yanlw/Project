package cn.edu.niit.jobrecruitment.service;

import java.util.Date;
import java.util.List;

import cn.edu.niit.jobrecruitment.model.JobApplication;
import cn.edu.niit.jobrecruitment.model.Posts;
import cn.edu.niit.jobrecruitment.model.Resume;

public interface JobApplicationService extends BaseService<JobApplication> {
	/**
	 * 判断该职位是否已提交简历
	 */
	public boolean isExistResume(int userId, int postsId);

	/**
	 * 用户查看投递申请
	 */
	public List<Object[]> findApplicationList(JobApplication jobApplication, Posts posts,
			Date startDate, Date endDate);
	
	/**
	 * 企业查看投递申请
	 */
	public List<Object[]> findMyResumeList(JobApplication jobApplication, Posts posts,
			Resume resume, Date startDate, Date endDate);
	
	/**
	 * 企业更新投递记录状态，通过或拒绝简历
	 */
	public void updateStatus(int id, int status);
}
