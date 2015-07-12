package cn.edu.niit.jobrecruitment.dao.Impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import cn.edu.niit.jobrecruitment.dao.BaseDao;

/**
 * 抽象的Dao实现，专门用于继承
 */
@SuppressWarnings("unchecked")
public abstract class BaseDaoImpl<T> implements BaseDao<T> {

	@Resource
	private SessionFactory sf;
	private Class<T> clazz;

	public BaseDaoImpl() {
		// 得到泛型化超类
		ParameterizedType type = (ParameterizedType) this.getClass()
				.getGenericSuperclass();
		clazz = (Class<T>) type.getActualTypeArguments()[0];
	}

	public void saveEntity(T t) {
		sf.getCurrentSession().save(t);
	}

	public void saveOrUpdateEntity(T t) {
		sf.getCurrentSession().saveOrUpdate(t);
	}

	public void deleteEntity(T t) {
		sf.getCurrentSession().delete(t);
	}

	public void updateEntity(T t) {
		sf.getCurrentSession().update(t);
	}

	/**
	 * 按照Hql语句进行批量更新
	 */
	public void batchEntity(String hql, Object... objects) {
		Query query = sf.getCurrentSession().createQuery(hql);
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
		query.executeUpdate();
	}

	/**
	 * 不产生代理，查询数据无返回结果时返回null。
	 */
	public T getEntity(Integer id) {
		return (T) sf.getCurrentSession().get(clazz, id);
	}

	/**
	 * 产生代理，查询数据无返回结果时抛异常。
	 */
	public T loadEntity(Integer id) {
		return (T) sf.getCurrentSession().load(clazz, id);
	}
	
	public List<T> findEntity(String hql, Object... objects) {
		Query query = sf.getCurrentSession().createQuery(hql);
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
		return query.list();
	}

}
