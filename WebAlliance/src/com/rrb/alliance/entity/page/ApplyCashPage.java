package com.rrb.alliance.entity.page;

/**
 * 测试
 * @author 俞凯
 */

public class ApplyCashPage extends Page {

	private String ad_member_id;
	private String starttime;
	private String endtime;
	
	public String getAd_member_id() {
		return ad_member_id;
	}
	public void setAd_member_id(String adMemberId) {
		ad_member_id = adMemberId;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
}
