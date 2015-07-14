package com.rrb.alliance.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class Member implements Serializable {

	private static final long serialVersionUID = 1L;

	private Timestamp create_time;// 创建时间
	private Timestamp update_time;// 修改时间
	private int ad_member_no;// 主键
	private String recommend_no;// 推荐人编号
	private String ad_member_id;// 用户帐号
	private String ad_member_pw;// 密码
	private int ad_member_status;// 用户状态
	private String ad_member_name;// 用户姓名
	private String ad_member_phone;// 手机号
	private String ad_member_fax;// 传真
	private String ad_member_tel;// 电话
	private String ad_member_email;// Email
	private String ad_member_bank;// 开户银行
	private String ad_member_bank_account;// 银行户名
	private String ad_member_bank_number;// 银行卡号
	private String ad_member_type;//用户类型
	private int ad_member_level;// 用户的等级
	private String ad_member_info;// 用户的信息显示
	private String ad_member_sub_bank;// 开户支行的名字
	private String ad_member_tel_area;// 电话所属分区
	private String ad_member_tel_ext;// 电话登记信息
	private String ad_member_prove1;// 证件正面
	private String ad_member_prove2;// 证件反面
	private double ad_member_total_cash;// 可提现金额
	private double ad_member_pause_cash;// 冻结金额
	private String ad_member_identity_id;// 身份证号码
	private String ad_member_check_st;//是否审核
	private int ad_member_check_info;// 用户验证信息
	private String im;// 通讯方式
	private Date ad_member_cash_date;// 提现的日期
	private double ad_member_total;//总共的金额
	private String ad_member_new_pw;//新密码
	private String ad_member_info_flag;

	public Member() {
	}

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

	public int getad_member_no() {
		return ad_member_no;
	}

	public void setad_member_no(int adMenberNo) {
		ad_member_no = adMenberNo;
	}

	public String getRecommend_no() {
		return recommend_no;
	}

	public void setRecommend_no(String recommendNo) {
		recommend_no = recommendNo;
	}

	public String getad_member_id() {
		return ad_member_id;
	}

	public void setad_member_id(String adMenberId) {
		ad_member_id = adMenberId;
	}

	public String getad_member_pw() {
		return ad_member_pw;
	}

	public void setad_member_pw(String adMenberPw) {
		ad_member_pw = adMenberPw;
	}

	public int getad_member_status() {
		return ad_member_status;
	}

	public void setad_member_status(int adMenberStatus) {
		ad_member_status = adMenberStatus;
	}

	public String getad_member_name() {
		return ad_member_name;
	}

	public void setad_member_name(String adMenberName) {
		ad_member_name = adMenberName;
	}

	public String getad_member_phone() {
		return ad_member_phone;
	}

	public void setad_member_phone(String adMenberPhone) {
		ad_member_phone = adMenberPhone;
	}

	public String getad_member_fax() {
		return ad_member_fax;
	}

	public void setad_member_fax(String adMenberFax) {
		ad_member_fax = adMenberFax;
	}

	public String getad_member_tel() {
		return ad_member_tel;
	}

	public void setad_member_tel(String adMenberTel) {
		ad_member_tel = adMenberTel;
	}

	public String getad_member_email() {
		return ad_member_email;
	}

	public void setad_member_email(String adMenberEmail) {
		ad_member_email = adMenberEmail;
	}

	public String getad_member_bank() {
		return ad_member_bank;
	}

	public void setad_member_bank(String adMenberBank) {
		ad_member_bank = adMenberBank;
	}

	public String getad_member_bank_account() {
		return ad_member_bank_account;
	}

	public void setad_member_bank_account(String adMenberBankAccount) {
		ad_member_bank_account = adMenberBankAccount;
	}

	public String getad_member_bank_number() {
		return ad_member_bank_number;
	}

	public void setad_member_bank_number(String adMenberBankNumber) {
		ad_member_bank_number = adMenberBankNumber;
	}

	public int getad_member_level() {
		return ad_member_level;
	}

	public void setad_member_level(int adMenberLevel) {
		ad_member_level = adMenberLevel;
	}

	public String getad_member_info() {
		return ad_member_info;
	}

	public void setad_member_info(String adMenberInfo) {
		ad_member_info = adMenberInfo;
	}

	public String getad_member_sub_bank() {
		return ad_member_sub_bank;
	}

	public void setad_member_sub_bank(String adMenberSubBank) {
		ad_member_sub_bank = adMenberSubBank;
	}

	public String getad_member_tel_area() {
		return ad_member_tel_area;
	}

	public void setad_member_tel_area(String adMenberTelArea) {
		ad_member_tel_area = adMenberTelArea;
	}

	public String getad_member_tel_ext() {
		return ad_member_tel_ext;
	}

	public void setad_member_tel_ext(String adMenberTelExt) {
		ad_member_tel_ext = adMenberTelExt;
	}

	public String getad_member_prove1() {
		return ad_member_prove1;
	}

	public void setad_member_prove1(String adMenberProve1) {
		ad_member_prove1 = adMenberProve1;
	}

	public String getad_member_prove2() {
		return ad_member_prove2;
	}

	public void setad_member_prove2(String adMenberProve2) {
		ad_member_prove2 = adMenberProve2;
	}

	public double getad_member_total_cash() {
		return ad_member_total_cash;
	}

	public void setad_member_total_cash(Double adMenberTotalCash) {
		ad_member_total_cash = adMenberTotalCash;
	}

	public double getad_member_pause_cash() {
		return ad_member_pause_cash;
	}

	public void setad_member_pause_cash(Double adMenberPauseCash) {
		ad_member_pause_cash = adMenberPauseCash;
	}

	public String getad_member_identity_id() {
		return ad_member_identity_id;
	}

	public void setad_member_identity_id(String adMenberIdentityId) {
		ad_member_identity_id = adMenberIdentityId;
	}

	public int getad_member_check_info() {
		return ad_member_check_info;
	}

	public void setad_member_check_info(int adMenberCheckInfo) {
		ad_member_check_info = adMenberCheckInfo;
	}

	public String getIm() {
		return im;
	}

	public void setIm(String im) {
		this.im = im;
	}

	public Date getad_member_cash_date() {
		return ad_member_cash_date;
	}

	public void setad_member_cash_date(Date adMenberCashDate) {
		ad_member_cash_date = adMenberCashDate;
	}

	public void setAd_member_total(double ad_member_total) {
		this.ad_member_total = ad_member_total;
	}

	public double getAd_member_total() {
		return (ad_member_total_cash + ad_member_pause_cash);
	}

	public void setAd_member_new_pw(String ad_member_new_pw) {
		this.ad_member_new_pw = ad_member_new_pw;
	}

	public String getAd_member_new_pw() {
		return ad_member_new_pw;
	}

	public void setAd_member_info_flag(String ad_member_info_flag) {
		this.ad_member_info_flag = ad_member_info_flag;
	}

	public String getAd_member_info_flag() {
		return ad_member_info_flag;
	}

	public void setAd_member_check_st(String ad_member_check_st) {
		this.ad_member_check_st = ad_member_check_st;
	}

	public String getAd_member_check_st() {
		return ad_member_check_st;
	}

	public void setAd_member_type(String ad_member_type) {
		this.ad_member_type = ad_member_type;
	}

	public String getAd_member_type() {
		return ad_member_type;
	}

}
