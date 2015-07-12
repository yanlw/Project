package cn.edu.niit.jobrecruitment.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.edu.niit.jobrecruitment.dao.BaseDao;
import cn.edu.niit.jobrecruitment.model.Enterprise;
import cn.edu.niit.jobrecruitment.service.EnterpriseService;
import cn.edu.niit.jobrecruitment.util.ValidateUtil;

@Service("enterpriseService")
public class EnterpriseServiceImpl extends BaseServiceImpl<Enterprise>
		implements EnterpriseService {

	@Resource(name = "enterpriseDao")
	public void setDao(BaseDao<Enterprise> dao) {
		super.setDao(dao);
	}

	/**
	 * 判断用户名是否被占用
	 */
	public boolean isRegisted(String userName) {
		String hql = "from Enterprise e where e.userName = ?";
		List<Enterprise> list = this.findEntity(hql, userName);
		return ValidateUtil.isValid(list);
	}

	/**
	 * 验证用户登录信息
	 */
	public Enterprise validateLoginInfo(String userName, String md5) {
		String hql = "from Enterprise e where e.userName=? and e.password=?";
		List<Enterprise> list = this.findEntity(hql, userName, md5);
		return ValidateUtil.isValid(list) ? list.get(0) : null;
	}
	
	/**
	 * 查询所有企业用户
	 */
	public List<Enterprise> findEnterpriseList(Enterprise enterprise) {
		String hql = "from Enterprise e where 1=1 ";
		if (enterprise != null) {
			if (enterprise.getCompName() != null && !"".equals(enterprise.getCompName().trim())) {
				hql += " and e.compName like '%" + enterprise.getCompName().trim() + "%' ";
			}
			if (enterprise.getAuthenticate() != -1) {
				hql += " and e.authenticate =" + enterprise.getAuthenticate();
			}
			hql += " order by e.id asc";
		}
		return this.findEntity(hql);
	}
	
	/**
	 * 申请认证的企业用户
	 */
	public List<Enterprise> findLicenseList(Enterprise enterprise) {
		String hql = "from Enterprise e where e.authenticate = 0 and e.licenseImage is NOT NULL and e.licenseImage !='' ";
		if (enterprise != null) {
			if (enterprise.getCompName() != null && !"".equals(enterprise.getCompName().trim())) {
				hql += " and e.compName like '%" + enterprise.getCompName().trim() + "%' ";
			}
			hql += " order by e.id asc";
		}
		return this.findEntity(hql);
	}
}
