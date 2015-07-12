package cn.edu.niit.jobrecruitment.service.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.edu.niit.jobrecruitment.dao.BaseDao;
import cn.edu.niit.jobrecruitment.model.Enterprise;
import cn.edu.niit.jobrecruitment.model.Posts;
import cn.edu.niit.jobrecruitment.service.PostsService;
import cn.edu.niit.jobrecruitment.util.DateUtil;

@Service("postsService")
public class PostsServiceImpl extends BaseServiceImpl<Posts> implements
		PostsService {
	@Resource(name = "postsDao")
	public void setDao(BaseDao<Posts> dao) {
		super.setDao(dao);
	}
	
	/**
	 * 企业用户获取所有自己发布的职位
	 */
	public List<Posts> findMyPosts(Enterprise enterprise) {
		String hql = "from Posts p where p.enterprise.userName=? ";
		return this.findEntity(hql, enterprise.getUserName());
	}
	
	/**
	 * 用户按条件搜索职位
	 */
	public List<Posts> findMyPostsList(Posts posts) {
		String hql = "select p.id,p.title,p.cacheLocationF,p.jobnum,p.lastDate,enterprise.compName,enterprise.id,p.approvalStatus from Posts p,Enterprise enterprise where enterprise.id=p.enterprise.id and p.approvalStatus=? ";
		if (posts != null) {
			if (posts.getTitle() != null && !"".equals(posts.getTitle().trim())) {
				hql += " and p.title like '%" + posts.getTitle().trim() + "%'";
			}
			if (posts.getSchJobTypeMask() != null && !"".equals(posts.getSchJobTypeMask())) {
				hql += " and (p.schJobTypeMask like '%" + posts.getSchJobTypeMask() + "%'";
			}
			if (posts.getCacheLocationF() != null && !"".equals(posts.getCacheLocationF())) {
				hql += " and (p.cacheLocationF like '%" + posts.getCacheLocationF() + "%'";
			}
			if (posts.getLastDate() != null && !!"".equals(posts.getLastDate())) {
				hql += " and p.lastDate='" +DateUtil.dateToString(posts.getLastDate()) + "'";
			}
		}
		hql += " order by p.lastDate desc";
		List postss = this.findEntity(hql, posts.getApprovalStatus());
		List<Posts> postsList = new ArrayList<Posts>();
		for (int i = 0; i < postss.size(); i++) {
			Object[] object = (Object[])postss.get(i);
			posts = new Posts();
			posts.setId((int)object[0]);
			posts.setTitle((String)object[1]);
			posts.setCacheLocationF((String)object[2]);
			posts.setJobnum((int)object[3]);
			posts.setLastDate((Date)object[4]);
			Enterprise enterprise = new Enterprise();
			enterprise.setCompName((String)object[5]);
			enterprise.setId((int)object[6]);
			posts.setApprovalStatus((int)object[7]);
			posts.setEnterprise(enterprise);
			postsList.add(posts);
		}
		return postsList;
	}
}
