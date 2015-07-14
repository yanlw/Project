package com.rrb.alliance.service.Impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rrb.alliance.dao.AllianceDao;
import com.rrb.alliance.entity.Activation;
import com.rrb.alliance.entity.Advertise;
import com.rrb.alliance.entity.Member;
import com.rrb.alliance.entity.MemberApplyMoneyRecord;
import com.rrb.alliance.entity.Order;
import com.rrb.alliance.entity.page.ApplyCashPage;
import com.rrb.alliance.entity.page.IncomeDetailPage;
import com.rrb.alliance.entity.page.IncomePage;
import com.rrb.alliance.entity.page.Page;
import com.rrb.alliance.exception.ServiceException;
import com.rrb.alliance.service.AllianceService;
import com.rrb.alliance.util.MD5Util;
import com.rrb.alliance.util.MailUtil;

@Service(value = "allianceService")
public class AllianceServiceImpl implements AllianceService {

	// allianceDao注入
	@Resource
	private AllianceDao allianceDao;

	public Member findMemberByUsername(String username) {
		return allianceDao.findMemberByUsername(username);
	}

	public Member findMemberById(Integer id) {
		return allianceDao.findMemberById(id);
	}

	public List<Member> findMemberByNewestTime(Page page) {
		return allianceDao.findMemberByNewestTime(page);
	}

	public void addMember(Member member) {
		allianceDao.addMember(member);
	}

	public void modiMember(Member member) {
		allianceDao.modiMember(member);
	}

	public void modiBank(Member member) {
		allianceDao.modiBank(member);
	}

	public Member deleteMember(Integer ad_member_no) {
		return allianceDao.deleteMember(ad_member_no);
	}

	public void applyCash(MemberApplyMoneyRecord mamr) {
		allianceDao.applyCash(mamr);
	}

	public void addMemberApplyMoneyRecord(MemberApplyMoneyRecord mamr) {
		allianceDao.addMemberApplyMoneyRecord(mamr);
	}

	public Member findMemberByEmail(String email) {
		return allianceDao.findMemberByEmail(email);
	}

	public Member findMemberByPhone(String phone) {
		return allianceDao.findMemberByPhone(phone);
	}

	public List<MemberApplyMoneyRecord> findApplyCashByPage(ApplyCashPage page) {
		return allianceDao.findApplyCashByPage(page);
	}

	public int findApplyCashRows(ApplyCashPage page) {
		return allianceDao.findApplyCashRows(page);
	}

	public List<Order> viewIncome(IncomePage page) {
		return allianceDao.viewIncome(page);
	}

	public int findIncomeRows(IncomePage page) {
		return allianceDao.findIncomeRows(page);
	}

	public List<Order> incomeDetail(IncomeDetailPage page) {
		return allianceDao.incomeDetail(page);
	}

	public int findIncomeDetailRows(IncomeDetailPage page) {
		return allianceDao.findIncomeDetailRows(page);
	}

	public void findPassword(Member member) {
		allianceDao.findPassword(member);
	}

	public List<Advertise> findAdvertise() {
		return allianceDao.findAdvertise();
	}

	public void deleteUser(String email) {
		allianceDao.deleteUser(email);
	}

	public void saveUser(Activation activation) {
		allianceDao.saveUser(activation);
	}

	public Activation findByEmail(String email) {
		return allianceDao.findByEmail(email);
	}

	public void updateUserStatus(int id, int status) {
		allianceDao.updateUserStatus(id, status);
	}

	public void processRegister(String email) {
		Activation activation = new Activation();
		activation.setEmail(email);
		activation.setRegisterTime(new Date());
		activation.setStatus(0);
		//这里可以将激活码设计的更复杂
		activation.setValidateCode(MD5Util.encode2hex(email));
		allianceDao.saveUser(activation);
		//发送邮件
		StringBuffer sb = new StringBuffer("点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
	      sb.append("<a href=\"http://localhost:8080/alliance/alliance/toAccountType.do?action=activate&email=")
			.append(email)
			.append("&validateCode=")
			.append(activation.getValidateCode())
			.append("\">http://localhost:8080/alliance/alliance/toAccountType.do?action=activate&email=")
			.append(email)
			.append("&validateCode=")
			.append(activation.getValidateCode())
			.append("</a>");
		MailUtil.send(email , sb.toString());
	}

	public void processActivate(String email, String validateCode) throws ServiceException {
		Activation user = allianceDao.findByEmail(email);

		// 验证用户状态
		if (user == null) {
			throw new ServiceException("该邮箱未注册（邮箱地址不存在）！");
		}
		// 验证用户状态
		if (user.getStatus() != 0) {
			throw new ServiceException("邮箱已激活，请登录！");
		}
		Date currentTime = new Date();

		// 验证链接是否过期
		if (!currentTime.before(user.getLastActivateTime())) {
			throw new ServiceException("激活码已过期！");
		}

		// 验证激活码是否正确
		if (!validateCode.equals(user.getValidateCode())) {
			throw new ServiceException("激活码不正确");
		}
		// 激活成功
		allianceDao.updateUserStatus(user.getId(), 1);
	}
}
