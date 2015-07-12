package com.rrb.alliance.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Advertise implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Timestamp create_time;
	private Timestamp update_time;
	private int adv_no;
	private String adv_name;
	private String adv_type;
	private int adv_width;
	private int adv_height;
	private String adv_imagepath;
	private int adv_st;
	private Timestamp adv_publish_time;
	
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
	public int getAdv_no() {
		return adv_no;
	}
	public void setAdv_no(int advNo) {
		adv_no = advNo;
	}
	public String getAdv_name() {
		return adv_name;
	}
	public void setAdv_name(String advName) {
		adv_name = advName;
	}
	public String getAdv_type() {
		return adv_type;
	}
	public void setAdv_type(String advType) {
		adv_type = advType;
	}
	public int getAdv_width() {
		return adv_width;
	}
	public void setAdv_width(int advWidth) {
		adv_width = advWidth;
	}
	public int getAdv_height() {
		return adv_height;
	}
	public void setAdv_height(int advHeight) {
		adv_height = advHeight;
	}
	public String getAdv_imagepath() {
		return adv_imagepath;
	}
	public void setAdv_imagepath(String advImagepath) {
		adv_imagepath = advImagepath;
	}
	public int getAdv_st() {
		return adv_st;
	}
	public void setAdv_st(int advSt) {
		adv_st = advSt;
	}
	public Timestamp getAdv_publish_time() {
		return adv_publish_time;
	}
	public void setAdv_publish_time(Timestamp advPublishTime) {
		adv_publish_time = advPublishTime;
	}
	
	
}
