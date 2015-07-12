package com.rrb.alliance.entity.page;

public class IncomeDetailPage extends Page {

	private String ad_member_id;
	private String timeBegin;
	private String timeEnd;
	private String apply_cash_no;

	public String getAd_member_id() {
		return ad_member_id;
	}
	public void setAd_member_id(String adMemberId) {
		ad_member_id = adMemberId;
	}
	public String getTimeBegin() {
		return timeBegin;
	}
	public void setTimeBegin(String timeBegin) {
		this.timeBegin = timeBegin;
	}
	public String getTimeEnd() {
		return timeEnd;
	}
	public void setTimeEnd(String timeEnd) {
		this.timeEnd = timeEnd;
	}
	public String getApply_cash_no() {
		return apply_cash_no;
	}
	public void setApply_cash_no(String applyCashNo) {
		apply_cash_no = applyCashNo;
	}
	
}
