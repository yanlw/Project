package com.rrb.alliance.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
import com.rrb.alliance.util.FileUtil;
import com.rrb.alliance.util.ImageCode;
import com.rrb.alliance.util.MD5Util;
import com.rrb.alliance.util.TestSendEmail;
import com.rrb.alliance.util.TestSendMsg;

@Controller
@RequestMapping("/alliance")
public class AllianceController implements Serializable {

	
	private static final long serialVersionUID = 1L;
	private static int MEMBER_APPLY_CASH_NO = 10000;// 假定提现订单编号从10000开始

	// 自增一个规定的提现订单编号
	public static void increApplyCashNo() {
		MEMBER_APPLY_CASH_NO ++;
	}
	
	//注解注入Service
	@Resource
	private AllianceService allianceService;
	/*
	 * 跳转到首页的操作
	 */
	@RequestMapping("/index.do")
	public String index(HttpServletRequest request, Page page) {
		HttpSession session = request.getSession();
		List<Member> newestList = allianceService.findMemberByNewestTime(page);
		List<Member> newMembers = new ArrayList<Member>();
		for(Member m : newestList){
			String name = m.getad_member_name();
			String firstname = name.substring(0, 1);
			name = firstname + "**";
			m.setad_member_name(name);
			newMembers.add(m);
		}
		session.setAttribute("newestMembers", newMembers);
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "index";
		} else {
			Member m = allianceService.findMemberByUsername(member.getad_member_id());
			session.setAttribute("member", m);
			return "loginSuccess";
		}
	}
	
	/*
	 * 检查登录成功的操作
	 */
	@RequestMapping("/checkLogin.do")
	@ResponseBody
	public int checkLogin(HttpServletRequest request, String username,
			String password) {
		Member member = allianceService.findMemberByUsername(username);
		if (member == null) {
			return 1;
		}
		if (!password.equals(member.getad_member_pw())) {
			return 2;
		}
		if(member.getad_member_check_info() != 1){
			return 3;
		}
		HttpSession session = request.getSession();
		session.setAttribute("member", member);
		return 0;
	}
	
	/*
	 * 登录成功操作
	 */
	@RequestMapping("/loginSuccess.do")
	public String loginSuccess(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		Member m = allianceService.findMemberByUsername(member.getad_member_id());
		session.setAttribute("member", m);
		return "loginSuccess";
	}

	/*
	 * 跳转到大联盟课堂的操作
	 */
	@RequestMapping("/toAllianceClass.do")
	public String toAllianceClass() {
		return "allianceClass";
	}
	
	/*
	 * 安全退出的操作
	 */
	@RequestMapping("/loginOut.do")
	public String loginOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		return "index";
	}

	/*
	 * 跳转到提现页面的操作
	 */
	@RequestMapping("/toApplyCash.do")
	public String toApplyCash() {
		return "withdrawal";
	}

	/*
	 * 提现操作
	 */
	@RequestMapping("/applyCash.do")
	public String applyCash(HttpSession session,MemberApplyMoneyRecord mamr) {
		Member member = (Member) session.getAttribute("member");
		String ad_member_id = member.getad_member_id();
		mamr.setCreate_time(new Timestamp(System.currentTimeMillis()));
		if (mamr.getMember_apply_is_invoice() == null) {
			mamr.setMember_apply_is_invoice("0");
		}
		if (mamr.getMember_apply_money_amount() == 0) {
			return "redirect:index.do";
		}
		mamr.setMember_apply_cash_no(MEMBER_APPLY_CASH_NO);
		allianceService.applyCash(mamr);
		allianceService.addMemberApplyMoneyRecord(mamr);
		increApplyCashNo();
		member = allianceService.findMemberByUsername(ad_member_id);
		session.setAttribute("member", member);
		return "redirect:findApplyCash.do";
	}

	/*
	 * 跳转到修改资料的页面
	 */
	@RequestMapping("/toModiMember.do")
	public String toModiMember() {
		return "memberModi";
	}

	/*
	 * 跳转到注册页面的操作
	 */
	@RequestMapping("/toRegister.do")
	public String toRegister() {
		return "register";
	}
	
	/*
	 * 跳转到银行账户管理页面
	 */
	@RequestMapping("/toBankNumberManager.do")
	public String toBankNumberManager() {
		return "bankNumberManager";
	}

	/*
	 * 修改资料的操作
	 */
	@RequestMapping("/modiMember.do")
	public String modiMember(Member member, HttpSession session) {
		if (member.getAd_member_new_pw() == null || member.getAd_member_new_pw() == "") {
			member.setAd_member_new_pw(member.getad_member_pw());
		}
		allianceService.modiMember(member);
		session.removeAttribute("member");
		return "redirect:index.do";
	}
	
	/*
	 * 修改银行账号
	 */
	@RequestMapping("/modiBank.do")
	public String modiBank(Member member, HttpSession session){
		allianceService.modiBank(member);
		return "redirect:index.do";
	}

	/*
	 * 填写邮箱密码后进行验证激活的操作
	 */
	@RequestMapping("/register.do")
	public String register(Member member, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Member me = (Member) request.getSession().getAttribute("registerTwo");
		member.setCreate_time(new Timestamp(System.currentTimeMillis()));
		if(me != null){
			member.setad_member_id(me.getad_member_email());
			member.setad_member_email(me.getad_member_email());
		}
		request.getSession().setAttribute("register", member);
		String action = request.getParameter("action");
		if ("register".equals(action)) {
			String email = request.getParameter("ad_member_email");
			String validateCode = MD5Util.encode2hex(email);
			String tipic = "车险无忧大联盟：会员注册";
			StringBuffer content = new StringBuffer();
			content.append("<html><head></head><body>");
			content.append("<hr width=450 align='left' style='border: 1px dashed; height: 0.1px'>");
			content.append("<p style='font-size: 16;'><b>车险无忧大联盟：会员注册</b></p>");
			content.append("<hr width=450 align='left' style='border: 1px dashed; height: 0.1px'></br>");
			content.append("<p style='font-size:12px;'>亲爱的用户：</p>");
			content.append("<p style='font-size:12px; text-indent:2em'>欢迎加入车险无忧大联盟，成为大联盟中的一员！</p>");
			content.append("<p style='font-size:12px; text-indent:2em'>为了保障您的利益，请点击下面的链接，完善您的个人信息，并完成注册！</p>");
			content.append("<p style='font-size:12px; text-indent:2em; color:red;'>注意：该链接只有效一次，且48小时内有效，请尽快完成注册！若点击链接后跳转到首页，表示该链接已无效，请重新注册！</p>");
			content.append("<p style='font-size:12px; text-indent:2em'><a href=http://localhost:8080/WebAlliance/alliance/register.do?action=activate&validateCode=" + validateCode );
			content.append(	"&email=" + email + ">http://localhost:8080/WebAlliance/alliance/register.do?action=activate&validateCode=" + validateCode + "&email=" + email + "</a></p>");
			content.append("<p style='font-size:12px; text-indent:2em'>(如果链接无法点击，请将它复制并粘贴到浏览器的地址栏中访问)</p><br>");
			content.append("<p style='font-size:12px;'>此致！</p>");
			content.append("<p style='font-size:12px;'>车险无忧大联盟&nbsp;&nbsp;团队</p>");
			content.append("<p style='font-size:12px;'><a href='http://union.chexian51.com'>http://union.chexian51.com</a></p>");
			content.append("</body></html>");
			
			member.setad_member_email(email);
			member.setad_member_id(email);
			request.getSession().setAttribute("registerTwo", member);
			int result = TestSendEmail.sendEmail(tipic, email, content.toString());
	        if (result != HttpStatus.SC_OK) {//邮件发送失败
	        	
	        }
			request.getRequestDispatcher("toEmailActivation.do").forward(request, response);
		} else if ("activate".equals(action)) {
			String email = request.getParameter("email");
			String validateCode = request.getParameter("validateCode");
			
			try {
				allianceService.processActivate(email, validateCode);
				request.getRequestDispatcher("toAccountType.do").forward(request,response);
			} catch (ServiceException e) {
				request.setAttribute("message", e.getMessage());
				request.getRequestDispatcher("index.do").forward(request,response);
			}
		}
		return "accountType";
	}

	@RequestMapping("/detailRegister.do")
	public String detailRegister(Member m, HttpServletRequest request,
			MultipartHttpServletRequest mrequest) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("registerTwo");
		m.setCreate_time(new Timestamp(System.currentTimeMillis()));
		m.setUpdate_time(new Timestamp(System.currentTimeMillis()));
		m.setad_member_email(member.getad_member_email());
		m.setad_member_pw(member.getad_member_pw());
		m.setad_member_id(member.getad_member_email());
        if(allianceService.findMemberByEmail(member.getad_member_email())!=null){
        	session.setAttribute("member", m);
    		return "redirect:index.do";
        }
        
		// 获得第1张图片（根据前台的name名称得到上传的文件）
		MultipartFile imgFile = mrequest.getFile("imgFile");
		MultipartFile imgFile2 = mrequest.getFile("imgFile2");
		// 定义一个数组，用于保存可上传的文件类型
		List<String> fileTypes = new ArrayList<String>();
		fileTypes.add("jpg");
		fileTypes.add("jpeg");
		fileTypes.add("bmp");
		fileTypes.add("gif");
		fileTypes.add("png");
		String imgName = imgFile.getOriginalFilename();
		String imgName2 = null;
		if(null!=imgFile2){
			imgName2 = imgFile2.getOriginalFilename();
		}
		
		String thisRootPath = request.getSession().getServletContext().getRealPath("").replace("\\", "/");	// D:/Java/Apache Tomcat/webapps/WebAlliance
		String examinePhotoPath = thisRootPath.substring(0, thisRootPath.lastIndexOf("/")) + "/Alliance/examinePhoto";
		String type = request.getParameter("type");
		String photoFileName = "";
		if ("private".equalsIgnoreCase(type)) {
			photoFileName = "/privateExamine";
		}
		if ("public".equalsIgnoreCase(type)) {
			photoFileName = "/publicExamine";
		}
		// 保存图片
		if (!(imgName == null || "".equals(imgName))) {
			String photoName1 = FileUtil.getFile(imgFile, examinePhotoPath, photoFileName, fileTypes);
			m.setad_member_prove1("examinePhoto" + photoFileName + "/" + photoName1);
		}
		if (!(imgName2 == null || "".equals(imgName2))) {
			String photoName2 = FileUtil.getFile(imgFile2, examinePhotoPath, photoFileName, fileTypes);
			m.setad_member_prove2("examinePhoto" + photoFileName + "/" + photoName2);
		}
		allianceService.addMember(m);
		session.setAttribute("member", m);
		return "index";
	}
	
	/*
	 * 跳转到对私的页面
	 */
	@RequestMapping("/toMainPrivateMessage.do")
	public String toMainPrivateMessage() {
		return "mainPrivateMessage";
	}

	/*
	 * 跳转到对公的页面
	 */
	@RequestMapping("/toMainPublicMessage.do")
	public String toMainPublicMessage() {
		return "mainPublicMessage";
	}

	/*
	 * 验证首页登录信息
	 */
	@RequestMapping("/check_username.do")
	@ResponseBody
	public boolean checkUsername(String ad_member_id) {
		Member member = allianceService.findMemberByUsername(ad_member_id);
		if (member != null) {
			return false;
		} else {
			return true;
		}
	}

	/*
	 * 激活后选择对公对私的页面跳转
	 */
	@RequestMapping("/toAccountType.do")
	public String toAccountType(HttpSession session) {
		Member register = (Member) session.getAttribute("register");
		if (register == null) {
			return "redirect:index.do";
		}
		return "accountType";
	}

	/*
	 * 激活邮箱的操作
	 */
	@RequestMapping("/toEmailActivation.do")
	public String toEmailActivation(HttpSession session) {
		Member register = (Member) session.getAttribute("register");
		if (register == null) {
			return "redirect:index.do";
		}
		return "emailActivation";
	}

	/*
	 * 生成验证码的操作
	 */
	@RequestMapping("/image_code.do")
	public void imageCode(HttpServletResponse response) {
		OutputStream ops;
		try {
			ops = response.getOutputStream();
			BufferedImage image = ImageCode.getImage();
			response.setContentType("image/png");
			ImageIO.write(image, "png", ops);
			ops.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/*
	 * 验证验证码的操作
	 */
	@RequestMapping("/check_code.do")
	@ResponseBody
	public int checkCode(String code) {
		String number = ImageCode.number;
		if (number.equalsIgnoreCase(code)) {
			return 0;
		} else {
			return 1;
		}
	}

	/*
	 * 跳转到网页邮箱的操作
	 */
	@RequestMapping("/toEmail.do")
	public void toEmail(HttpServletResponse response, HttpSession session) {
		Member member = (Member) session.getAttribute("register");
		String email = member.getad_member_email();
		String ext=email.substring(email.indexOf("@")+1);
		try {
		if(ext.contains("sina")||ext.contains("51uc")){
			response.sendRedirect("http://mail.sina.com.cn");
		} else 
		if(ext.contains("qq")){
			response.sendRedirect("http://mail.qq.com");
		} else
		if(ext.contains("163")){
			response.sendRedirect("http://mail.163.com/");
		} else
		if(ext.contains("126")){
			response.sendRedirect("http://mail.126.com/");
		}else{
			response.sendRedirect("http://exmail.qq.com/");
		}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/*
	 * 跳转到车险无忧官网的操作
	 */
	@RequestMapping("/toCheXian51.do")
	public void toCheXian51(HttpServletResponse response) {
		try {
			response.sendRedirect("http://www.chexian51.com");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/*
	 * 跳转到提现明细的操作
	 */
	@RequestMapping("/findApplyCash.do")
	public String findApplyCash(ApplyCashPage page,HttpSession session, Model model,HttpServletRequest request) {
		Member member = (Member) session.getAttribute("member");
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		if(starttime != ""){
			page.setStarttime(starttime);
		}else{
			page.setStarttime(null);
		}
		if(endtime != ""){
			page.setEndtime(endtime);
		}else{
			page.setEndtime(null);
		}
		page.setAd_member_id(member.getad_member_id());
		List<MemberApplyMoneyRecord> list = allianceService.findApplyCashByPage(page);
		model.addAttribute("applyCash", list);
		page.setRows(allianceService.findApplyCashRows(page));
		model.addAttribute("applyCashPage", page);
		return "applyCashDetil";
	}

	/*
	 * 获获取推广代码页面跳转的操作
	 */
	@RequestMapping(value = "/toGetSpreadCode.do")
	public String toGetSpreadCode(Model model) {
		List<Advertise> list = allianceService.findAdvertise();
		model.addAttribute("advs", list);
		return "getSpreadCode";
	}

	/*
	 * 注册获得手机验证码的操作
	 */
	@RequestMapping("/getPhoneCode.do")
	@ResponseBody
	public void getPhoneCode(String ad_member_phone, HttpSession session) {
		Member member = (Member) allianceService.findMemberByPhone(ad_member_phone);
		if (member == null) {
			String phoneCode = TestSendMsg.GetRoundValue();
			TestSendMsg.sendMsg(ad_member_phone, phoneCode);
			session.setAttribute("phoneCode", phoneCode);
		}
	}
	
	/*
	 * 找回密码获得手机验证码的操作
	 */
	@RequestMapping("/achievePhoneCode.do")
	@ResponseBody
	public void achievePhoneCode(String ad_member_phone, HttpSession session) {
		Member member = (Member) allianceService.findMemberByPhone(ad_member_phone);
		if (member != null) {
			String phoneCode = TestSendMsg.GetRoundValue();
			TestSendMsg.sendMsg(ad_member_phone, phoneCode);
			session.setAttribute("phoneCode", phoneCode);
		}
	}

	/*
	 * 用来验证手机验证码的操作
	 */
	@RequestMapping("/checkPhoneCode.do")
	@ResponseBody
	public int checkPhoneCode(String phoneCode, HttpSession session) {
		String pcode = (String) session.getAttribute("phoneCode");
		if (pcode == null) {
			return 0;// 代表还没有获取验证码
		}
		if (!pcode.equalsIgnoreCase(phoneCode)) {
			return 1;// 代表验证码错误
		}
		return 2;// 代表验证码正确
	}

	/*
	 * 用来验证邮箱是否注册的请求操作
	 */
	@RequestMapping("/checkMemberByEmail.do")
	@ResponseBody
	public String checkMemberByEamil(String ad_member_email) {
		Member member = (Member) allianceService.findMemberByEmail(ad_member_email);
		if (member == null) {
			return "1";// 可以注册
		} else {
			return "0";// 已被注册
		}
	}
	
	/*
	 * 用来验证手机号是否注册的请求操作
	 */
	@RequestMapping("/checkMemberByPhone.do")
	@ResponseBody()
	public int checkMemberByPhone(String ad_member_phone) {
		Member member = (Member) allianceService.findMemberByPhone(ad_member_phone);
		if (member == null) {
			return 1;// 表示可以注册
		} else {
			return 0;// 可以注册
		}
	}

	/*
	 * 佣金收益
	 */
	@RequestMapping("/viewIncome.do")
	public String viewIncome(IncomePage page,HttpSession session, Model model,HttpServletRequest request) {
		Member member = (Member) session.getAttribute("member");
		page.setAd_member_id(member.getad_member_id());
		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");
		if(beginTime != ""){
			page.setBeginTime(beginTime);
		}else{
			page.setBeginTime(null);
		}
		if(endTime != ""){
			page.setEndTime(endTime);
		}else{
			page.setEndTime(null);
		}
		List<Order> list = allianceService.viewIncome(page);
		model.addAttribute("income", list);
		page.setRows(allianceService.findIncomeRows(page));
		model.addAttribute("incomePage", page);
		return "viewIncome";
	}
	
	/*
	 * 佣金收益明细
	 */
	@RequestMapping("/incomeDetail.do")
	public String incomeDetail(IncomeDetailPage page,HttpSession session, HttpServletRequest request, Model model){
		Member member = (Member) session.getAttribute("member");
		page.setAd_member_id(member.getad_member_id());
		String applyCashNo = request.getParameter("apply_cash_no");
		page.setApply_cash_no(applyCashNo);
		String timeBegin = request.getParameter("timeBegin");
		String timeEnd = request.getParameter("timeEnd");
		if(timeBegin != ""){
			page.setTimeBegin(timeBegin);
		}else{
			page.setTimeBegin(null);
		}
		if(timeEnd != ""){
			page.setTimeEnd(timeEnd);
		}else{
			page.setTimeEnd(null);
		}
		List<Order> list = allianceService.incomeDetail(page);
		model.addAttribute("incomeDetail", list);
		page.setRows(allianceService.findIncomeDetailRows(page));
		model.addAttribute("incomeDetailPage", page);
		return "incomeDetail";
	}
	
	/*
	 * 用户注册协议跳转
	 */
	@RequestMapping("/toRegisterAgreement.do")
	public String toRegisterAgreement(){
		return "registerAgreement";
	}
	
	/*
	 * 找回密码步骤1
	 */
	@RequestMapping("/findPwdStepOne.do")
	public String findPwdStepOne(){
		return "findPwdStepOne";
	}
	
	/*
	 * 找回密码步骤2
	 */
	@RequestMapping("/findPwdStepTwo.do")
	public String findPwdStepTwo(Member member,HttpServletRequest request,HttpSession session){
		String phone = member.getad_member_phone();
		session.setAttribute("telephone", phone);
		return "findPwdStepTwo";
	}
	
	/*
	 * 找回密码步骤3
	 */
	@RequestMapping("/findPwdStepThree.do")
	public String findPwdStepThree(Member member,HttpServletRequest request,HttpSession session){
		String phone = (String)session.getAttribute("telephone");
		member.setad_member_phone(phone);
		allianceService.findPassword(member);
		return "findPwdStepThree";
	}
	
	/*
	 * 跳转到联系我们页面	
	 */
	@RequestMapping("/toConnectUs.do")
	public String toConnectUs(){
		return "connectUs";
	}
	
}
