package cn.edu.niit.jobrecruitment.model;

import java.util.Date;

public class Posts {
	private int id;
	private String title;// 职位名称
	private String schJobTypeMask;// 职位类别
	private String jobdesc;// 职位描述
	private String cacheLocationF;// 工作地点
	private int minYears;// 工作经验
	private int degree;// 学历要求
	private int employmenttype;// 工作类型
	private int jobnum;// 招聘人数
	private int desiredSalaryScope;// 月薪
	private int approvalStatus;// 审核状态：-1,审核中 0,未通过 1,通过
	private Date lastDate;
	private Enterprise enterprise;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSchJobTypeMask() {
		return schJobTypeMask;
	}

	public void setSchJobTypeMask(String schJobTypeMask) {
		this.schJobTypeMask = schJobTypeMask;
	}

	public String getJobdesc() {
		return jobdesc;
	}

	public void setJobdesc(String jobdesc) {
		this.jobdesc = jobdesc;
	}

	public String getCacheLocationF() {
		return cacheLocationF;
	}

	public void setCacheLocationF(String cacheLocationF) {
		this.cacheLocationF = cacheLocationF;
	}

	public int getMinYears() {
		return minYears;
	}

	public void setMinYears(int minYears) {
		this.minYears = minYears;
	}

	public int getDegree() {
		return degree;
	}

	public void setDegree(int degree) {
		this.degree = degree;
	}

	public int getEmploymenttype() {
		return employmenttype;
	}

	public void setEmploymenttype(int employmenttype) {
		this.employmenttype = employmenttype;
	}

	public int getJobnum() {
		return jobnum;
	}

	public void setJobnum(int jobnum) {
		this.jobnum = jobnum;
	}

	public int getDesiredSalaryScope() {
		return desiredSalaryScope;
	}

	public void setDesiredSalaryScope(int desiredSalaryScope) {
		this.desiredSalaryScope = desiredSalaryScope;
	}

	public int getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(int approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

	public Enterprise getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(Enterprise enterprise) {
		this.enterprise = enterprise;
	}
}
