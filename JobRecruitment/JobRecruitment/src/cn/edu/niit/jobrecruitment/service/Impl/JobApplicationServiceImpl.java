package cn.edu.niit.jobrecruitment.service.Impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.edu.niit.jobrecruitment.dao.BaseDao;
import cn.edu.niit.jobrecruitment.model.JobApplication;
import cn.edu.niit.jobrecruitment.model.Posts;
import cn.edu.niit.jobrecruitment.model.Resume;
import cn.edu.niit.jobrecruitment.service.JobApplicationService;
import cn.edu.niit.jobrecruitment.util.DateUtil;
import cn.edu.niit.jobrecruitment.util.ValidateUtil;

@Service("jobApplicationService")
public class JobApplicationServiceImpl extends BaseServiceImpl<JobApplication>
		implements JobApplicationService {
	@Resource(name = "jobApplicationDao")
	public void setDao(BaseDao<JobApplication> dao) {
		super.setDao(dao);
	}

	/**
	 * 判断该职位是否已提交简历
	 */
	public boolean isExistResume(int userId, int postsId) {
		String hql = "from JobApplication j where j.userId=? and j.postsId=?";
		if (ValidateUtil.isValid(this.findEntity(hql, userId, postsId))) {
			return true;
		}
		return false;
	}

	/**
	 * 用户查看投递申请
	 */
	public List<Object[]> findApplicationList(JobApplication jobApplication,
			Posts posts, Date startDate, Date endDate) {
		String hql = "select j.id,j.postsId,p.title,e.compName,p.cacheLocationF,j.createDate,j.status from JobApplication j,Posts p,Enterprise e where j.postsId=p.id and j.enterpriseId=e.id and j.status=? and j.userId=? ";
		if (posts != null) {
			if (posts.getTitle() != null && !"".equals(posts.getTitle().trim())) {
				hql += " and p.title like '%" + posts.getTitle().trim() + "%'";
			}
			if (posts.getEnterprise().getCompName() != null
					&& !"".equals(posts.getEnterprise().getCompName().trim())) {
				hql += " and e.compName like '%"
						+ posts.getEnterprise().getCompName().trim() + "%'";
			}
		}

		if (startDate != null && endDate != null) {
			hql += " and ('" + DateUtil.dateToString(startDate)
					+ "'<=j.createDate and j.createDate <= '"
					+ DateUtil.dateToString(endDate) + "')";
		}
		hql += " order by j.createDate,j.postsId desc";
		List list = this.findEntity(hql, jobApplication.getStatus(), jobApplication.getUserId());
		return list;
	}
	
	/**
	 * 企业查看投递申请
	 */
	public List<Object[]> findMyResumeList(JobApplication jobApplication,
			Posts posts, Resume resume, Date startDate, Date endDate) {
		String hql = "select j.id,j.postsId,j.resumeId,p.title,r.jobtypeF,r.cacheLocationF,r.degree,r.year,j.createDate,j.status "
				+ "from JobApplication j,Posts p,Resume r where j.postsId=p.id and j.resumeId=r.id and j.enterpriseId=? ";
		if (posts != null && posts.getTitle() != null && !"".equals(posts.getTitle().trim())) {
			hql += " and p.title like '%" + posts.getTitle().trim() + "%'";
		}
		if (jobApplication.getStatus() != -2) {
			hql += " and j.status=" + jobApplication.getStatus();
		}
		if (resume != null) {
			if (resume.getJobtypeF() != null && !"".equals(resume.getJobtypeF().trim())) {
				hql += " and (r.jobtypeF like '%" + resume.getJobtypeF()
						+ "%' or r.cacheLocationF like '%" + resume.getJobtypeF()
						+ "%')";
			}
			if (resume.getDegree() != -1) {
				hql += " and r.degree=" + resume.getDegree();
			}
		}

		if (startDate != null && endDate != null) {
			hql += " and ('" + DateUtil.dateToString(startDate)
					+ "'<=j.createDate and j.createDate <= '"
					+ DateUtil.dateToString(endDate) + "')";
		}
		hql += "order by j.createDate,j.postsId desc";
		List list = this.findEntity(hql, jobApplication.getEnterpriseId());
		return list;
	}
	
	/**
	 * 企业更新投递记录状态，通过或拒绝简历
	 */
	public void updateStatus(int id, int status) {
		String hql = "update JobApplication j set j.status=? where j.id=?";
		this.batchEntityByHQL(hql, status, id);
	}
}
