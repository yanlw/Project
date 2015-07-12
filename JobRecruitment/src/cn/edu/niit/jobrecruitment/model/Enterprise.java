package cn.edu.niit.jobrecruitment.model;

import java.util.Date;

public class Enterprise {
	private int id;
	/* 账户信息 */
	private String userName;
	private String password;
	private String email;
	/* 企业信息 */
	private String compName;
	private String industry;
	private int corptype;
	private int corpsize;
	private String compAddress;
	private String companyPersin;
	private String contactor;
	private boolean sex;
	private String phone;
	private String licenseImage;
	private int authenticate = -1;
	private Date regDate = new Date();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public int getCorptype() {
		return corptype;
	}

	public void setCorptype(int corptype) {
		this.corptype = corptype;
	}

	public int getCorpsize() {
		return corpsize;
	}

	public void setCorpsize(int corpsize) {
		this.corpsize = corpsize;
	}

	public String getCompAddress() {
		return compAddress;
	}

	public void setCompAddress(String compAddress) {
		this.compAddress = compAddress;
	}

	public String getCompanyPersin() {
		return companyPersin;
	}

	public void setCompanyPersin(String companyPersin) {
		this.companyPersin = companyPersin;
	}

	public String getContactor() {
		return contactor;
	}

	public void setContactor(String contactor) {
		this.contactor = contactor;
	}

	public boolean isSex() {
		return sex;
	}

	public void setSex(boolean sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLicenseImage() {
		return licenseImage;
	}

	public void setLicenseImage(String licenseImage) {
		this.licenseImage = licenseImage;
	}

	public int getAuthenticate() {
		return authenticate;
	}

	public void setAuthenticate(int authenticate) {
		this.authenticate = authenticate;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
