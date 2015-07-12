package cn.edu.niit.jobrecruitment.model;

import java.util.Date;

import cn.edu.niit.jobrecruitment.util.DateUtil;

public class Resume {
	private int id;
	/* 自我评价 */
	private String commentTitle;
	private String commentContent;
	/* 求职意向 */
	private int employmenttype;
	private String cacheLocationF;
	private String jobtypeF;
	private int desiredSalaryScope;
	private int currentCareerStatus;
	/* 工作经验 */
	private String cmpanyName;
	private String customSubJobtype;
	private Date workStartDate;
	private Date workEndDate;
	private String year = DateUtil.DateSubtract(workEndDate, workStartDate);
	private String jobDescription;
	private int companytype;
	private int companySize;
	/* 教育背景 */
	private Date startDate;
	private String schoolName;
	private String mainMajorF;
	private int degree;
	/* 语言能力 */
	private String languages;
	private String literacy;
	private String spoken;
	/* 证书 */
	private String certification;
	private Date getDate;
	/* 照片 */
	private String myphoto;

	private boolean open = true;
	private Date lastDate;
	private User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCommentTitle() {
		return commentTitle;
	}

	public void setCommentTitle(String commentTitle) {
		this.commentTitle = commentTitle;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getEmploymenttype() {
		return employmenttype;
	}

	public void setEmploymenttype(int employmenttype) {
		this.employmenttype = employmenttype;
	}

	public String getJobtypeF() {
		return jobtypeF;
	}

	public void setJobtypeF(String jobtypeF) {
		this.jobtypeF = jobtypeF;
	}

	public String getCacheLocationF() {
		return cacheLocationF;
	}

	public void setCacheLocationF(String cacheLocationF) {
		this.cacheLocationF = cacheLocationF;
	}

	public int getDesiredSalaryScope() {
		return desiredSalaryScope;
	}

	public void setDesiredSalaryScope(int desiredSalaryScope) {
		this.desiredSalaryScope = desiredSalaryScope;
	}

	public int getCurrentCareerStatus() {
		return currentCareerStatus;
	}

	public void setCurrentCareerStatus(int currentCareerStatus) {
		this.currentCareerStatus = currentCareerStatus;
	}

	public String getCmpanyName() {
		return cmpanyName;
	}

	public void setCmpanyName(String cmpanyName) {
		this.cmpanyName = cmpanyName;
	}

	public String getCustomSubJobtype() {
		return customSubJobtype;
	}

	public void setCustomSubJobtype(String customSubJobtype) {
		this.customSubJobtype = customSubJobtype;
	}

	public Date getWorkStartDate() {
		return workStartDate;
	}

	public void setWorkStartDate(Date workStartDate) {
		this.workStartDate = workStartDate;
	}

	public Date getWorkEndDate() {
		return workEndDate;
	}

	public void setWorkEndDate(Date workEndDate) {
		this.workEndDate = workEndDate;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public int getCompanytype() {
		return companytype;
	}

	public void setCompanytype(int companytype) {
		this.companytype = companytype;
	}

	public int getCompanySize() {
		return companySize;
	}

	public void setCompanySize(int companySize) {
		this.companySize = companySize;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getMainMajorF() {
		return mainMajorF;
	}

	public void setMainMajorF(String mainMajorF) {
		this.mainMajorF = mainMajorF;
	}

	public int getDegree() {
		return degree;
	}

	public void setDegree(int degree) {
		this.degree = degree;
	}

	public String getLanguages() {
		return languages;
	}

	public void setLanguages(String languages) {
		this.languages = languages;
	}

	public String getLiteracy() {
		return literacy;
	}

	public void setLiteracy(String literacy) {
		this.literacy = literacy;
	}

	public String getSpoken() {
		return spoken;
	}

	public void setSpoken(String spoken) {
		this.spoken = spoken;
	}

	public String getCertification() {
		return certification;
	}

	public void setCertification(String certification) {
		this.certification = certification;
	}

	public Date getGetDate() {
		return getDate;
	}

	public void setGetDate(Date getDate) {
		this.getDate = getDate;
	}

	public String getMyphoto() {
		return myphoto;
	}

	public void setMyphoto(String myphoto) {
		this.myphoto = myphoto;
	}

	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
