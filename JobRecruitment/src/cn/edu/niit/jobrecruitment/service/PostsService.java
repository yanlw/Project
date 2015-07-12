package cn.edu.niit.jobrecruitment.service;

import java.util.List;

import cn.edu.niit.jobrecruitment.model.Enterprise;
import cn.edu.niit.jobrecruitment.model.Posts;

public interface PostsService extends BaseService<Posts> {
	
	/**
	 * 根据注册用户名查询职位的发布
	 */
	public List<Posts> findMyPosts(Enterprise enterprise);
	
	/**
	 * 用户按条件搜索职位
	 */
	public List<Posts> findMyPostsList(Posts posts);
}
