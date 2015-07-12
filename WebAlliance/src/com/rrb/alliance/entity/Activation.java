package com.rrb.alliance.entity;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

public class Activation implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private String email;// 邮箱地址
	private Integer status;// 状态，0-未激活；1-已激活
	private String validateCode;// 激活码
	private Date registerTime;// 注册时间

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public Date getLastActivateTime() {
		Calendar cl = Calendar.getInstance();
		cl.setTime(registerTime);
		cl.add(Calendar.DATE, 2);
		return cl.getTime();
	}
}
