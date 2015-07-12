package cn.edu.niit.jobrecruitment.dao;

import java.util.List;

/**
 * BaseDao接口
 */
public interface BaseDao<T> {
	// 写操作
	public void saveEntity(T t);

	public void saveOrUpdateEntity(T t);

	public void deleteEntity(T t);

	public void updateEntity(T t);

	public void batchEntity(String hql, Object... objects);

	// 读操作
	public T getEntity(Integer id);

	public T loadEntity(Integer id);
	
	public List<T> findEntity(String hql, Object... objects);
}
