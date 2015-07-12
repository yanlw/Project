package cn.edu.niit.jobrecruitment.struts2.action;

import java.lang.reflect.ParameterizedType;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * 抽象Action，专门用于继承
 */
public abstract class BaseAction<T> extends ActionSupport implements
		Preparable, ModelDriven<T> {

	private static final long serialVersionUID = -5178771338927359643L;

	public T model;

	public BaseAction() {
		try {
			ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
			Class clazz = (Class) type.getActualTypeArguments()[0];
			model = (T) clazz.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public T getModel() {
		return model;
	}

	public void prepare() throws Exception {

	}

}
