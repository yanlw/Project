package cn.edu.niit.jobrecruitment.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import cn.edu.niit.jobrecruitment.dao.BaseDao;
import cn.edu.niit.jobrecruitment.service.BaseService;

/**
 * 抽象BaseService类，专门用于继承。单体
 */
public abstract class BaseServiceImpl<T> implements BaseService<T> {

	private BaseDao<T> dao;

	// 注入dao
	@Resource
	public void setDao(BaseDao<T> dao) {
		this.dao = dao;
	}

	public void saveEntity(T t) {
		dao.saveEntity(t);
	}

	public void saveOrUpdateEntity(T t) {
		dao.saveOrUpdateEntity(t);
	}

	public void deleteEntity(T t) {
		dao.deleteEntity(t);
	}

	public void updateEntity(T t) {
		dao.updateEntity(t);
	}

	public void batchEntityByHQL(String hql, Object... objects) {
		dao.batchEntity(hql, objects);
	}

	public T getEntity(Integer id) {
		return dao.getEntity(id);
	}

	public T loadEntity(Integer id) {
		return dao.loadEntity(id);
	}

	public List<T> findEntity(String hql, Object... objects) {
		return dao.findEntity(hql, objects);
	}
}
