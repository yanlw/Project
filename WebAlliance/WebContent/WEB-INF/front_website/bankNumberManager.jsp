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
<title>车险无忧大联盟 - 银行账户管理</title>
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
	function check_bank(){
		var reg = /^[0-9]{19}$/;
		var bank_number1 = $("#bank_number1").val();
		var bank_number2 = $("#bank_number2").val();
		if (!reg.test(bank_number1)) {
			$("#bank1_msg").removeClass();
			$("#bank1_msg").text("请输入19位银行卡号！").addClass("error_msg");
			return false;
		}
		$("#bank1_msg").text("").removeClass("right_msg");
		if(bank_number2 != bank_number1){
			$("#bank_msg").removeClass("right_msg");
			$("#bank_msg").text("两次输入的银行账号不相同！").addClass("error_msg");
			return false;
		}
		$("#bank_msg").text("银行账号输入正确，请再次仔细核对！").addClass("right_msg");
		return true;
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
            <div class="ac_title">银行账户信息修改</div>
            <form action="modiBank.do" method="post" onsubmit="return check_bank()">
                <table class="ac_tab">
                   <tbody>
                      <tr>
                         <td>收款人姓名或公司名称</td>
                         <td>${member.ad_member_name}<input type="hidden" name="ad_member_no" value="${member.ad_member_no}"/></td>
                         <td><span>*&nbsp;&nbsp;开户人必须和联盟注册会员是同一人</span></td>
                      </tr>
                      <tr>
                         <td>开户银行名称</td>
                         <td><input name="ad_member_bank" value="${member.ad_member_bank}" class="ac_inp"/></td>
                         <td class="msg">*&nbsp;&nbsp;请仔细填写您的银行账号开户银行</td>
                      </tr>
                      <tr>
                         <td>开户支行名称</td>
                         <td><input name="ad_member_sub_bank" value="${member.ad_member_sub_bank}" class="ac_inp"/></td>
                         <td class="msg">*&nbsp;&nbsp;请仔细填写您的银行账号开户支行</td>
                      </tr>
                      <tr>
                         <td>银行账号</td>
                         <td><input id="bank_number1" name="ad_member_bank_number" value="${member.ad_member_bank_number}" class="ac_inp" onblur="check_bank();"/></td>
                         <td id="bank1_msg" class="msg">*&nbsp;&nbsp;请输入19位银行卡号</td>
                      </tr>
                      <tr>
                         <td>再次确认</td>
                         <td><input id="bank_number2" class="ac_inp" onblur="check_bank();"/></td>
                         <td id="bank_msg" class="msg">请再次输入银行账号，并仔细核对！</td>
                      </tr>
                   </tbody>
                </table>
                <div class="ac_sm">
                  <input type="submit" name="" value="提交" class="ac_sub">
                </div>
            </form> 
            <div class="ac_tip">
				<div class="ac_col" style="font-size:20px; font-weight:bold; color:red;">重要提醒：</div>
				<div class="ac_col" style="font-size:16px; font-weight:bold;"><br/>&nbsp;&nbsp;&nbsp;&nbsp;请认真核对您在本页面上所填写的所有银行账号信息（开户银行名称、开户支行名称、银行账号）</div>
				<div class="ac_col" style="font-size:16px; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;确认无误后，再提交申请！</div>
            </div>
         </div>
      </section>
      
	<%@ include file="footer_partner.jsp" %>
    <%@ include file="footer.jsp" %>

</body>
</html>
