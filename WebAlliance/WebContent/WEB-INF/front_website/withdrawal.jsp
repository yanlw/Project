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
<title>车险无忧大联盟 - 提现申请</title>
<link href="../style/reset.css" rel="stylesheet" />
<link href="../style/common.css" rel="stylesheet"  />
<link rel="stylesheet" href="../fonts/iconfont.css">
<link href="../style/style.css" rel="stylesheet" />
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/html5shiv.min.js"></script>
<style type="text/css">
	#note {
		border: 2px solid black;
		width: 250px;
		height: 150px;
		background-color: white;
		padding: 20px;
		visibility: hidden;
		position: absolute;
	}
	.account .ac_tab .msg {color:#5DA7F5 ; font-size: 14px;}
	.account .ac_tab .error_msg {color: red;}
	.account .ac_tab .right_msg {color: green;}
</style>
<script type="text/javascript">
	function show_note(objEvent){
		var obj = document.getElementById("note");
		obj.style.visibility = "visible";
		obj.style.left = objEvent.clientX + 5;
		obj.style.top = objEvent.clientY + 5;
	}
	
	function hide_note(){
		obj = document.getElementById("note");
		obj.style.visibility = "hidden";
	}
	
	function check_money(){
		var reg = /^[0-9]*$/;
		var member_apply_money_amount = $("#member_apply_money_amount").val();
		if(member_apply_money_amount == ""){
			$("#member_apply_tax_money").val(0);
	        $("#member_apply_fact_money").val(0);
			return false;
		}
		var apply_cash = parseInt(member_apply_money_amount);
		var total_cash = parseInt($("#ad_member_total_cash").val());
		var ad_member_pause_cash = parseInt($("#ad_member_pause_cash").val());
		var is_invoice = $('input[name=member_apply_is_invoice]:checked').val();
		if(!reg.test(member_apply_money_amount)){
			$("#apply_msg").removeClass();
			$("#apply_msg").text("请输入整数！").addClass("error_msg");
			$("#member_apply_tax_money").val(0);
	        $("#member_apply_fact_money").val(0);
            return false;
		}
		if(apply_cash < 100){
			$("#apply_msg").removeClass();
			$("#apply_msg").text("提现金额应不小于100元！").addClass("error_msg");
			$("#member_apply_tax_money").val(0);
	        $("#member_apply_fact_money").val(0);
            return false;
		}
		if(total_cash < apply_cash){
			$("#apply_msg").removeClass();
			$("#apply_msg").text("您的可提现金额不足！请重新输入！").addClass("error_msg");
			$("#member_apply_tax_money").val(0);
	        $("#member_apply_fact_money").val(0);
            return false;
		}
		if(is_invoice == 1){
			$("#member_apply_tax_money").val(0);
	        $("#member_apply_fact_money").val(apply_cash);
		}
		if(is_invoice == 0){
			var member_apply_tax_money=Math.ceil(apply_cash*0.1);
	        var member_apply_fact_money=apply_cash-member_apply_tax_money;
	        $("#member_apply_tax_money").val(member_apply_tax_money);
	        $("#member_apply_fact_money").val(member_apply_fact_money);
		}
		if(ad_member_pause_cash>0){
			$("#note_msg").removeClass();
			$("#note_msg").text("上次提现还未结算，暂时无法提现，请耐心等待！").addClass("error_msg");
			return false;
		}
		$("#apply_msg").text("").removeClass();
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
            <div class="ac_title">提现</div>
            <div class="ac_info">说明：如果不能提供发票，将按国家个人所得税标准进行扣税。若有提现未支付，则无法再次提现！</div>
            <form action="applyCash.do" method="post" onsubmit="return check_money()">
                <table class="ac_tab" style="margin-top:0px;">
                   <tbody>
                      <tr>
                         <td width="190">可提现金额</td>
                         <td>
                         	${member.ad_member_total_cash}
                         	<input type="hidden" name="ad_member_total_cash" id="ad_member_total_cash" value="${member.ad_member_total_cash} " />
	                        <input type="hidden" name="ad_member_no" id="ad_member_no" value="${member.ad_member_no}" />
							<input type="hidden" name="ad_member_id" id="ad_member_id" value="${member.ad_member_id}" />
							<input type="hidden" name="ad_member_pause_cash" id="ad_member_pause_cash" value="${member.ad_member_pause_cash}" />
                         </td>
                      </tr>
                      <tr>
                         <td>提现金额</td>
                         <td>
                         	<input type="text" name="member_apply_money_amount" id="member_apply_money_amount" onblur="check_money();" class="ac_inp"/>&nbsp;元
                         	&nbsp;&nbsp;&nbsp;<span id="apply_msg" class="msg">请输入需要提现的金额（不少于100元的整数）</span>
                         </td>
                      </tr>
                      <tr>
                         <td>是否提供发票</td>
                         <td>
	                         <input type="radio" name="member_apply_is_invoice" id="member_apply_is_invoice" value="1" onclick="check_money();" class="ac_rad"/>是
	                         <input type="radio" name="member_apply_is_invoice" id="member_apply_is_invoice" value="0" onclick="check_money();" class="ac_rad" style="margin-left:20px;" checked/>否
	                     </td>
                      </tr>
                      <tr>
                         <td>个税金额</td>
                         <td>
                         	<input type="text" name="member_apply_tax_money" id="member_apply_tax_money" readonly value="0" class="ac_inp"/>&nbsp;
                         	<div id="note" style="font-size:15px;">
								1.测试时，所用税率都为10%</br></br>
								2.测试时，所用税率都为10%</br></br>
								3.测试时，所用税率都为10%</br>
							</div>
                         	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="ac_ck" style="text-decoration:none;" onclick="show_note(event);" onmouseout="hide_note();">点击查看税率</a>
                         </td>
                      </tr>
                      <tr>
                         <td>实际提现金额</td>
                         <td>
                         	<input type="text" name="member_apply_fact_money" id="member_apply_fact_money" readonly  class="ac_inp"/>
                         	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="note_msg" class="msg"></span>
                         </td>
                      </tr>
                   </tbody>
                </table>
                <div class="ac_sm">
                  <input type="submit" value="提交" class="ac_sub">
                </div>
            </form> 
            <div class="ac_tip">
            
<div class="ac_col">提醒：为方便各大联盟站长及时收款和公司结算推广费用， 请各大联盟站长统一采下列格式填写出具的发票。</div>
<div>发票抬头： 连云港淮海工学院</div>
<div>费用名：     信息费，服务费，咨询费（任选其一）</div>
<div>收件人：    车险无忧大联盟组</div>
<div>联系地址：  连云港市新浦区苍梧路59号</div>
<div>邮编：        888888</div>
<div>拨款时间：  每月25日到30日</div>
<div>工作时间：  周一至周五</div>
<div>联系电话：  0518-88888888</div>
<div class="ac_col">备注：</div>
<div>1. 发票须由正规渠道获取，收据类文件将不予接受。</div>
<div>2. 请大联盟用户在每月15日之前完成提现申请，15日之后申请的将延期至次月25日进行支付。</div>
<div>3. 请提供发票的会员于每月20日前将发票寄到联系地址，若未能在20日前将发票寄达，将延至下月发支付。</div>
<div>4. 以个人名义开立发票者，请在收款单位栏目填写：连云港淮海工学院；并在邮寄发票时在信封上注明申请提现的账户人姓名与会员号或是以便利贴方式在信件内作此注明。</div>
            </div>
         </div>
      </section>

	<%@ include file="footer_partner.jsp" %>
    <%@ include file="footer.jsp" %>

</body>
</html>
