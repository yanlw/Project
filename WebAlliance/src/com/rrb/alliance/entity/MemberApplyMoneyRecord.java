package com.rrb.alliance.entity;

import java.io.Serializable;
import java.sql.Timestamp;


public class MemberApplyMoneyRecord implements Serializable {

	private static final long serialVersionUID = 1L;

	private Timestamp create_time;// 创建时间
	private Timestamp update_time;// 修改时间
	private int member_apply_no;// 提现记录编号
	private double member_apply_money_amount;// 申请提现金额
	private String member_apply_is_invoice;// 是否有发票
	private double member_apply_tax_money;// 个人税额
	private double member_apply_fact_money;// 实际金额
	private Timestamp member_apply_pay_date;// 支付日期
	private String member_apply_bank_serial;// 银行流水号
	private String member_apply_is_pay;// 是否支付
	private int member_apply_cash_no;// 请款编号
	private String member_apply_invoice_no;// 发票号码
	private int member_apply_isrevice_invoice;// 是否提供发票号码
	private String ad_member_id;//用户名
	private int ad_member_no;

	public MemberApplyMoneyRecord() {
	}

	public MemberApplyMoneyRecord(Timestamp createTime, Timestamp updateTime,
			int memberApplyNo, double memberApplyMoneyAmount,
			String memberApplyIsInvoice, double memberApplyTaxMoney,
			double memberApplyFactMoney, Timestamp memberApplyPayDate,
			String memberApplyBankSerial, String memberApplyIsPay,
			int memberApplyCashNo, String memberApplyInvoiceNo,
			int memberApplyIsreviceInvoice, String adMemberId, int adMemberNo) {
		super();
		create_time = createTime;
		update_time = updateTime;
		member_apply_no = memberApplyNo;
		member_apply_money_amount = memberApplyMoneyAmount;
		member_apply_is_invoice = memberApplyIsInvoice;
		member_apply_tax_money = memberApplyTaxMoney;
		member_apply_fact_money = memberApplyFactMoney;
		member_apply_pay_date = memberApplyPayDate;
		member_apply_bank_serial = memberApplyBankSerial;
		member_apply_is_pay = memberApplyIsPay;
		member_apply_cash_no = memberApplyCashNo;
		member_apply_invoice_no = memberApplyInvoiceNo;
		member_apply_isrevice_invoice = memberApplyIsreviceInvoice;
		ad_member_id = adMemberId;
		ad_member_no = adMemberNo;
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

	public int getMember_apply_no() {
		return member_apply_no;
	}

	public void setMember_apply_no(int memberApplyNo) {
		member_apply_no = memberApplyNo;
	}

	public double getMember_apply_money_amount() {
		return member_apply_money_amount;
	}

	public void setMember_apply_money_amount(double memberApplyMoneyAmount) {
		member_apply_money_amount = memberApplyMoneyAmount;
	}

	public String getMember_apply_is_invoice() {
		return member_apply_is_invoice;
	}

	public void setMember_apply_is_invoice(String memberApplyIsInvoice) {
		member_apply_is_invoice = memberApplyIsInvoice;
	}

	public double getMember_apply_tax_money() {
		return member_apply_tax_money;
	}

	public void setMember_apply_tax_money(double memberApplyTaxMoney) {
		member_apply_tax_money = memberApplyTaxMoney;
	}

	public double getMember_apply_fact_money() {
		return member_apply_fact_money;
	}

	public void setMember_apply_fact_money(double memberApplyFactMoney) {
		member_apply_fact_money = memberApplyFactMoney;
	}

	public Timestamp getMember_apply_pay_date() {
		return member_apply_pay_date;
	}

	public void setMember_apply_pay_date(Timestamp memberApplyPayDate) {
		member_apply_pay_date = memberApplyPayDate;
	}

	public String getMember_apply_bank_serial() {
		return member_apply_bank_serial;
	}

	public void setMember_apply_bank_serial(String memberApplyBankSerial) {
		member_apply_bank_serial = memberApplyBankSerial;
	}

	public String getMember_apply_is_pay() {
		return member_apply_is_pay;
	}

	public void setMember_apply_is_pay(String memberApplyIsPay) {
		member_apply_is_pay = memberApplyIsPay;
	}

	public int getMember_apply_cash_no() {
		return member_apply_cash_no;
	}

	public void setMember_apply_cash_no(int memberApplyCashNo) {
		member_apply_cash_no = memberApplyCashNo;
	}

	public String getMember_apply_invoice_no() {
		return member_apply_invoice_no;
	}

	public void setMember_apply_invoice_no(String memberApplyInvoiceNo) {
		member_apply_invoice_no = memberApplyInvoiceNo;
	}

	public int getMember_apply_isrevice_invoice() {
		return member_apply_isrevice_invoice;
	}

	public void setMember_apply_isrevice_invoice(int memberApplyIsreviceInvoice) {
		member_apply_isrevice_invoice = memberApplyIsreviceInvoice;
	}

	public String getAd_member_id() {
		return ad_member_id;
	}

	public void setAd_member_id(String adMemberId) {
		ad_member_id = adMemberId;
	}
	public int getAd_member_no() {
		return ad_member_no;
	}

	public void setAd_member_no(int adMemberNo) {
		ad_member_no = adMemberNo;
	}

}
