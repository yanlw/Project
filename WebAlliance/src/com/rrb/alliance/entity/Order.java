package com.rrb.alliance.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class Order implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Timestamp create_time;
	private Timestamp update_time;
	private Integer ad_order_no;
	private Integer chexian51_order_no;
	private String recommend_no;
	private String ad_income_flag;
	private String payments_no;
	private Timestamp payments_time;
	private String ad_order_status;
	private Integer apply_cash_no;
	private Date chexian51_order_datetime;
	private Timestamp succeedate;
	private double handlprice;
	private String ad_member_id;
	
	private Integer total;
	private double price;
	
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp createTime) {
		create_time = createTime;
	}
	public Timestamp getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Timestamp updateTime) {
		update_time = updateTime;
	}
	public Integer getAd_order_no() {
		return ad_order_no;
	}
	public void setAd_order_no(Integer adOrderNo) {
		ad_order_no = adOrderNo;
	}
	public Integer getChexian51_order_no() {
		return chexian51_order_no;
	}
	public void setChexian51_order_no(Integer chexian51OrderNo) {
		chexian51_order_no = chexian51OrderNo;
	}
	public String getRecommend_no() {
		return recommend_no;
	}
	public void setRecommend_no(String recommendNo) {
		recommend_no = recommendNo;
	}
	public String getAd_income_flag() {
		return ad_income_flag;
	}
	public void setAd_income_flag(String adIncomeFlag) {
		ad_income_flag = adIncomeFlag;
	}
	public String getPayments_no() {
		return payments_no;
	}
	public void setPayments_no(String paymentsNo) {
		payments_no = paymentsNo;
	}
	public Timestamp getPayments_time() {
		return payments_time;
	}
	public void setPayments_time(Timestamp paymentsTime) {
		payments_time = paymentsTime;
	}
	public String getAd_order_status() {
		return ad_order_status;
	}
	public void setAd_order_status(String adOrderStatus) {
		ad_order_status = adOrderStatus;
	}
	public Integer getApply_cash_no() {
		return apply_cash_no;
	}
	public void setApply_cash_no(Integer applyCashNo) {
		apply_cash_no = applyCashNo;
	}
	public Date getChexian51_order_datetime() {
		return chexian51_order_datetime;
	}
	public void setChexian51_order_datetime(Date chexian51OrderDatetime) {
		chexian51_order_datetime = chexian51OrderDatetime;
	}
	public Timestamp getSucceedate() {
		return succeedate;
	}
	public void setSucceedate(Timestamp succeedate) {
		this.succeedate = succeedate;
	}
	public double getHandlprice() {
		return handlprice;
	}
	public void setHandlprice(double handlprice) {
		this.handlprice = handlprice;
	}
	public String getAd_member_id() {
		return ad_member_id;
	}
	public void setAd_member_id(String adMemberId) {
		ad_member_id = adMemberId;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
