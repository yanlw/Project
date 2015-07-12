package cn.edu.niit.jobrecruitment.service;

import java.util.List;

import cn.edu.niit.jobrecruitment.model.User;

public interface UserService extends BaseService<User> {

	/**
	 * 判断email是否占用
	 */
	public boolean isRegisted(String email);
	
	/**
	 * 验证登陆信息
	 */
	public User validateloginInfo(String email, String md5);
	
	/**
	 * 判断email是否占用
	 */
	public List<User> findUserList(User user);
}
