package com.rrb.alliance.dao;

import java.util.List;

import com.rrb.alliance.entity.Activation;
import com.rrb.alliance.entity.Advertise;
import com.rrb.alliance.entity.Member;
import com.rrb.alliance.entity.MemberApplyMoneyRecord;
import com.rrb.alliance.entity.Order;
import com.rrb.alliance.entity.page.ApplyCashPage;
import com.rrb.alliance.entity.page.IncomeDetailPage;
import com.rrb.alliance.entity.page.IncomePage;
import com.rrb.alliance.entity.page.Page;
  
public interface AllianceDao {
	/**
	 * 根据用户名查询会员的方法
	 */
	public Member findMemberByUsername(String username);

	/**
	 * 根据用户id查询会员的方法
	 */
	public Member findMemberById(Integer id);

	/**
	 * 根据加盟时间查询会员的方法
	 */
	public List<Member> findMemberByNewestTime(Page page);

	/**
	 * 新增会员
	 */
	public void addMember(Member member);

	/**
	 * 修改会员信息
	 */
	public void modiMember(Member member);

	/**
	 * 修改银行账号
	 */
	public void modiBank(Member member);

	/**
	 * 状态删除会员
	 */
	public Member deleteMember(Integer ad_member_no);

	/**
	 * 成功提现
	 */
	public void applyCash(MemberApplyMoneyRecord mamr);

	/**
	 * 插入到提现记录表
	 */
	public void addMemberApplyMoneyRecord(MemberApplyMoneyRecord mamr);

	/**
	 * 根据邮箱查找会员
	 */
	public Member findMemberByEmail(String email);

	/**
	 * 根据手机号查找会员
	 */
	public Member findMemberByPhone(String phone);

	/**
	 * 查询所有提现明细（含分页）
	 */
	public List<MemberApplyMoneyRecord> findApplyCashByPage(ApplyCashPage page);

	/**
	 * 查询提现明细总记录数
	 */
	public int findApplyCashRows(ApplyCashPage page);

	/**
	 * 查看佣金收益（含分页）
	 */
	public List<Order> viewIncome(IncomePage page);

	/**
	 * 查询佣金收益总记录数
	 */
	public int findIncomeRows(IncomePage page);

	/**
	 * 查询佣金收益明细
	 */
	public List<Order> incomeDetail(IncomeDetailPage page);

	/**
	 * 查询收佣金收益明细总记录数
	 */
	public int findIncomeDetailRows(IncomeDetailPage page);

	/**
	 * 找回密码
	 */
	public void findPassword(Member member);

	/**
	 * 查询所有广告
	 */
	public List<Advertise> findAdvertise();
	
	/**
	 * 根据Email删除用户邮箱验证信息
	 */
	public void deleteUser(String email);
	
	/**
	 * 保存用户
	 */
	public void saveUser(Activation activation);
	
	/**
	 * 根据Email查找用户
	 */
	public Activation findByEmail(String email);
	
	/**
	 * 更新用户状态 
	 */
	public void updateUserStatus(int id , int status);

}
