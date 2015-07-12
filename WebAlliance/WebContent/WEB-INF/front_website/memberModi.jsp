<%@page pageEncoding="utf-8" isELIgnored="false" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>车险无忧-登录后页面</title>
<link href="../style/reset.css" rel="stylesheet" />
<link href="../style/common.css" rel="stylesheet"  />
<link rel="stylesheet" href="../fonts/iconfont.css">
<link href="../style/style.css" rel="stylesheet" />
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/html5shiv.min.js"></script>
<style type="text/css">
	.msg {color:#5DA7F5 ; font-size: 14px;}
	.error_msg {color: red;}
	.right_msg {color: green;}
</style>
<script type="text/javascript">
	function check_tel(){
		var area_reg = /^\d{3,5}$/;
		var tel_reg = /^\d{7,8}$/;
		var ext_reg = /^\d{1,4}$/;
		
		var area = $("#area").val();
		var tel = $("#tel").val();
		var ext = $("#ext").val();
		if(area=="" && tel=="" && ext==""){
			$("#tel_msg").text("").removeClass("right_msg");
			return true;
		}
		if(area==""){
            $("#tel_msg").removeClass("right_msg");
            $("#tel_msg").text("电话区号不能为空").addClass("error_msg");
            return false;
		}
		if(!area_reg.test(area)){
			 $("#tel_msg").removeClass("right_msg");
	         $("#tel_msg").text("电话区号格式错误").addClass("error_msg");
	         return false;
		}
		if(tel==""){
               $("#tel_msg").removeClass("right_msg");
               $("#tel_msg").text("电话号码不能为空").addClass("error_msg");
               return false;
		}
		if(!tel_reg.test(tel)){
			 $("#tel_msg").removeClass("right_msg");
	         $("#tel_msg").text("电话号码格式错误").addClass("error_msg");
	         return false;
		}
		if(ext!=""){
			if(!ext_reg.test(ext)){
				 $("#tel_msg").removeClass("right_msg");
		         $("#tel_msg").text("分机号格式错误").addClass("error_msg");
		         return false;
			}
		}
		$("#tel_msg").text("电话号码格式正确").addClass("right_msg");
		return true;
	}
	
	function check_phone() {
		var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		var mphone = $("#mphone").val();
		if(mphone==""){
			$("#phone_msg").removeClass("right_msg");
			$("#phone_msg").text("手机号码不能为空").addClass("error_msg");
			return false;
		}
		if (!reg.test(mphone)) {
			$("#phone_msg").removeClass("right_msg");
			$("#phone_msg").text("手机号码格式错误，请重新输入").addClass("error_msg");
			return false;
		}
		$("#phone_msg").text("手机号码输入正确").addClass("right_msg");
		return true;
	}
		
	function check_password() {
		var reg = /^[A-Za-z0-9]{6,16}$/;
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();
		if (password1 == "") {
			$("#password1_msg").removeClass("right_msg");
			$("#password1_msg").text("密码不能为空").addClass("error_msg");
			$("#password2_msg").text("");
			return false;
		}
		if (!reg.test(password1)) {
			$("#password1_msg").removeClass("right_msg");
			$("#password1_msg").text("密码格式错误，请输入6-16位数字、字母、或组合").addClass("error_msg");
			$("#password2_msg").text("");
			return false;
		}
		$("#password1_msg").text("密码输入正确").addClass("right_msg");
		if (password2 == "") {
			$("#password2_msg").removeClass("right_msg");
			$("#password2_msg").text("请再次输入密码").addClass("error_msg");
			return false;
		}
	
		if (password2 != password1) {
			$("#password2_msg").removeClass("right_msg");
			$("#password2_msg").text("两次密码不相同").addClass("error_msg");
			$("#password1_msg").text("");
			return false;
		}
	
		$("#password2_msg").text("两次密码输入相同").addClass("right_msg");
		return true;
	}
	
	function check(){
		var b = check_phone();
		var c = check_tel();
		var d = check_password();
		var z = b && c && d;
		if(z){
			return true;
	    }else{
	    	return false;
	    }
	}
	
</script>
<!--[if lt IE 6]> 
<script src="js/DD_belatedPNG_0.0.8a.js" type="text/javascript"></script> 
<script type="text/javascript"> 
DD_belatedPNG.fix('*'); 
/* 将 .png_bg 改成你应用了透明PNG的CSS选择器*/ 
</script> 
<![endif]--> 

</head>

<body>
      
	<%@ include file="header.jsp" %>

      <section>
         <div class="box_01 left">
           <div class="bx01_01 memb_01">
             <p><a href="loginOut.do">安全退出</a>会员中心</p>
             <table class="tb_01">
                <tbody>
                   <tr>
                     <td width="110">用户</td>
                     <td width=""><div style="width:172px; height:43px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${member.ad_member_name}</div></td>
                   </tr>
                   <tr>
                   	<td colspan="2"><a href="toModiMember.do">修改资料</a></td>
                   </tr>
                   <tr>
                     <td>可提现金额</td>
                     <td><a href="toApplyCash.do">提现</a>${member.ad_member_total_cash}</td>
                   </tr>
                   <tr>
                     <td>冻结金额</td>
                     <td><div style="height:43px;">${member.ad_member_pause_cash}</div></td>
                   </tr>
                   <tr>
                     <td colspan="2"><a href="findApplyCash.do">提现明细</a></td>
                   </tr>
                </tbody>
             </table>
           </div>
            <div class="memb_02 mg_tp_20">
                <span>会员常用功能</span>
                <ul>
                    <li><a href="toGetSpreadCode.do" title="">快速获取推广代码</a></li>                                   
                    <li><a href="viewIncome.do" title="">快速查看佣金收益</a></li>
                    <li><a href="toApplyCash.do" title="">立即提现</a></li>
                </ul>
            </div>
            <div class="memb_03 mg_tp_20">
                <span>帐户管理</span>
                <ul>
                   <li><a href="toModiMember.do" title="">个人资料修改</a></li> 
                   <li><a href="toBankNumberManager.do" title="">银行账户管理</a></li>                                   
                </ul>
            </div>
            
            
         </div>
         <div class="account left">
            <div class="ac_title">个人资料修改</div>
            <form action="modiMember.do" method="post" onsubmit="return check()">
                <table class="ac_tab">
                   <tbody>
                      <tr>
                         <td width="190">姓名</td>
                         <td width="264">${member.ad_member_name}<input type="hidden" name="ad_member_no" value="${member.ad_member_no}" /></td>
                         <td width=""><span><i class="red">用户姓名不可修改</i></span></td>
                      </tr>
                      <tr>
                         <td>电子邮件</td>
                         <td  width="264">${member.ad_member_email}</td>
                         <td width=""><span><i class="red">电子邮件不可修改</i></span></td>
                      </tr>
                      <tr>
                         <td>手机</td>
                         <td><input type="text" id="mphone" name="ad_member_phone" value="${member.ad_member_phone}" class="ac_inp" onblur="check_phone();"/></td>
                         <td class="msg" id="phone_msg">请输入您的手机号码</td>
                      </tr>
                      <tr>
                         <td>联络电话</td>
                         <td>
	                         <input type="text" name="ad_member_tel_area" id="area" value="${member.ad_member_tel_area}" onblur="check_tel();" style="width:40px" class="ac_inp"/>
	                         <input type="text" name="ad_member_tel" id="tel" value="${member.ad_member_tel}" onblur="check_tel();" style="width:66px; margin-left:12px;" class="ac_inp"/>
	                         <input type="text" name="ad_member_tel_ext" id="ext" value="${member.ad_member_tel_ext}" onblur="check_tel();" class="ac_inp" style="width:33px; margin-left:12px;"/>
                         </td>
                         <td class="msg" id="tel_msg">请输入您的电话号码<br>（包括区号和分机号）</td>
                      </tr>
                      <tr>
                         <td>IM</td>
                         <td><input type="text" name="im" value="${member.im}" class="ac_inp"/></td>
                         <td><span style="line-height:20px; display:inline-block">格式如：QQ：12345678（仅填数字）<br>&nbsp;&nbsp;&nbsp;或&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSN：123@msn.com</span></td>
                      </tr>
                      <tr>
                         <td>新密码</td>
                         <td><input type="password" id="password1" onblur="check_password();" class="ac_inp"/></td>
                         <td id="password1_msg" class="msg">请输入您的新密码</td>
                      </tr>
                      <tr>
                         <td>确认密码</td>
                         <td><input type="password" id="password2" name="ad_member_new_pw" class="ac_inp" onblur="check_password();"/></td>
                         <td id="password2_msg" class="msg">请再次输入您的新密码</td>
                      </tr>
                   </tbody>
                </table>
                <div class="ac_sm">
                  <input type="submit" value="提交" class="ac_sub">
                </div>
            </form> 
         </div>
      </section>
      
	<%@ include file="footer_partner.jsp" %>
    <%@ include file="footer.jsp" %>
    
</body>
</html>
