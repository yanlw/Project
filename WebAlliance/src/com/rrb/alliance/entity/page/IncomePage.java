package com.rrb.alliance.entity.page;

public class IncomePage extends Page {

	private String ad_member_id;
	private String beginTime;
	private String endTime;
	private String apply_cash_no;

	public String getAd_member_id() {
		return ad_member_id;
	}
	public void setAd_member_id(String adMemberId) {
		ad_member_id = adMemberId;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getApply_cash_no() {
		return apply_cash_no;
	}
	public void setApply_cash_no(String applyCashNo) {
		apply_cash_no = applyCashNo;
	}
	
}
