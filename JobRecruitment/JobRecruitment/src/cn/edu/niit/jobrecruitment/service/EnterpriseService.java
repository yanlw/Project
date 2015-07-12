package cn.edu.niit.jobrecruitment.service;

import java.util.List;

import cn.edu.niit.jobrecruitment.model.Enterprise;

public interface EnterpriseService extends BaseService<Enterprise> {
	/**
	 * 判断用户名是否占用
	 */
	public boolean isRegisted(String userName);

	/**
	 * 验证登陆信息
	 */
	public Enterprise validateLoginInfo(String userName, String md5);
	
	/**
	 * 查询所有企业用户
	 */
	public List<Enterprise> findEnterpriseList(Enterprise enterprise);
	
	/**
	 * 申请认证的企业用户
	 */
	public List<Enterprise> findLicenseList(Enterprise enterprise);
}
