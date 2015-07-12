package cn.edu.niit.jobrecruitment.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.edu.niit.jobrecruitment.dao.BaseDao;
import cn.edu.niit.jobrecruitment.model.User;
import cn.edu.niit.jobrecruitment.service.UserService;
import cn.edu.niit.jobrecruitment.util.ValidateUtil;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements
		UserService {

	@Resource(name = "userDao")
	public void setDao(BaseDao<User> dao) {
		super.setDao(dao);
	}

	/**
	 * 判断email是否被占用
	 */
	public boolean isRegisted(String email) {
		String hql = "from User u where u.email = ?";
		List<User> list = this.findEntity(hql, email);
		return ValidateUtil.isValid(list);
	}

	/**
	 * 验证登陆信息
	 */
	public User validateloginInfo(String email, String md5) {
		String hql = "from User u where u.email=? and u.password=?";
		List<User> list = this.findEntity(hql, email, md5);
		return ValidateUtil.isValid(list) ? list.get(0) : null;
	}

	/**
	 * 查询用户列表
	 */
	public List<User> findUserList(User user) {
		String hql = "from User u where 1=1";
		if (user != null && user.getName() != null && !"".equals(user.getName().trim())) {
			hql += " and u.name like '%" + user.getName().trim() + "%' ";
		}
		hql += " order by u.id asc";
		return this.findEntity(hql);
	}
}
