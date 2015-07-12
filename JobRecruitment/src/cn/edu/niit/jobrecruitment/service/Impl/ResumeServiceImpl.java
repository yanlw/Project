package cn.edu.niit.jobrecruitment.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.edu.niit.jobrecruitment.dao.BaseDao;
import cn.edu.niit.jobrecruitment.model.Resume;
import cn.edu.niit.jobrecruitment.model.User;
import cn.edu.niit.jobrecruitment.service.ResumeService;
import cn.edu.niit.jobrecruitment.util.DateUtil;

@Service("resumeService")
public class ResumeServiceImpl extends BaseServiceImpl<Resume> implements
		ResumeService {

	@Resource(name = "resumeDao")
	public void setDao(BaseDao<Resume> dao) {
		super.setDao(dao);
	}

	/**
	 * 根据注册email查询用户简历
	 */
	public List<Resume> findMyResume(User user) {
		String hql = "from Resume r where r.user.email=? order by r.lastDate desc";
		return this.findEntity(hql, user.getEmail());
	}

	/**
	 * 搜索所有公开的简历
	 */
	public List<Resume> findOpenResume(Resume resume) {
		String hql = "from Resume r where r.open=1";
		if (resume.getJobtypeF() != null && !"".equals(resume.getJobtypeF().trim())) {
			hql += " and (r.jobtypeF like '%" + resume.getJobtypeF()
					+ "%' or r.cacheLocationF like '%" + resume.getJobtypeF()
					+ "%')";
		}
		if (resume.getCustomSubJobtype() != null && !"".equals(resume.getCustomSubJobtype())) {
			hql += " and r.customSubJobtype like '%"
					+ resume.getCustomSubJobtype() + "%'";
		}
		if (resume.getCacheLocationF() != null && !"".equals(resume.getCacheLocationF())) {
			hql += " and r.cacheLocationF like '%"
					+ resume.getCacheLocationF() + "%'";
		}
		if (resume.getDegree() != 0) {
			hql += " and r.degree=" + resume.getDegree();
		}
		if (resume.getLastDate() != null && !"".equals(resume.getLastDate())) {
			hql += " and r.lastDate='"+ DateUtil.dateToString(resume.getLastDate()) + "'";
		}
		return this.findEntity(hql);
	}
}
