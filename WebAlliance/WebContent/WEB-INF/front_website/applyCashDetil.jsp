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
<title>车险无忧大联盟 - 提现明细</title>
<link href="../style/reset.css" rel="stylesheet" />
<link href="../style/common.css" rel="stylesheet"  />
<link rel="stylesheet" href="../fonts/iconfont.css">
<link href="../style/style.css" rel="stylesheet" />
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/lyz.calendar.min.js" type="text/javascript"></script>
<script src="../js/html5shiv.min.js"></script>
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
            <div class="ac_title">提现明细</div>
            <div class="page_x">
            	<ul>
               		<li>
               			<c:choose>
		                    <c:when test="${applyCashPage.currentPage==1}">
		                    	<a href="#">上一页</a>
		                    </c:when>
		                    <c:otherwise>
		                    	<a href="findApplyCash.do?starttime=${applyCashPage.starttime}&endtime=${applyCashPage.endtime}&currentPage=${applyCashPage.currentPage-1}">上一页</a>
		                    </c:otherwise>
	                    </c:choose>
               		</li>
	                
                	<c:forEach begin="1" end="${applyCashPage.totalPage}" var="p">
	                	<li>
	        	        	<c:choose>
	        	        		<c:when test="${p==applyCashPage.currentPage}">
	        	        			<a href="findApplyCash.do?starttime=${applyCashPage.starttime}&endtime=${applyCashPage.endtime}&currentPage=${p}" style="background:#5da7f5; color:#fff;">${p}</a>
	        	        		</c:when>
	        	        		<c:otherwise>
	        	        			<a href="findApplyCash.do?starttime=${applyCashPage.starttime}&endtime=${applyCashPage.endtime}&currentPage=${p}">${p}</a>
	        	        		</c:otherwise>
	        	        	</c:choose>
	               		</li>
        	        </c:forEach>
	                
	                <li>
	                	<c:choose>
		                    <c:when test="${applyCashPage.currentPage==applyCashPage.totalPage}">
		                    	<a href="#">下一页</a>
		                    </c:when>
		                    <c:otherwise>
		                    	<a href="findApplyCash.do?starttime=${applyCashPage.starttime}&endtime=${applyCashPage.endtime}&currentPage=${applyCashPage.currentPage+1}">下一页</a>
		                    </c:otherwise>
	                    </c:choose>
			        </li>
	            </ul>
            </div>
            <form>
                <table class="ac_tab_list" style="margin-top: 10px">
                   <tbody>
                      <tr>
                         <td>编号</td>
                         <td>申请日期</td>
                         <td>申请金额(元)</td>
                         <td>是否提供发票</td>
                         <td>个税金额(元)</td>
                         <td>实际提现金额(元)</td>
                         <td>完成时间</td>
                         <td>银行流水号</td>
                         <td>状态</td>
                      </tr>
                      <c:forEach items="${applyCash}" var="a">
	    			 	<tr>
	    			 		<td>${a.member_apply_no}</td>
	    			 		<td><fmt:formatDate value="${a.create_time}" pattern="yyyy-MM-dd"/></td>
	    			 		<td>${a.member_apply_money_amount}</td>
	    			 		<td>
		    			 		<c:choose>
		    			 			<c:when test="${a.member_apply_is_invoice==0}">不提供发票</c:when>
			                        <c:when test="${a.member_apply_is_invoice==1}">提供发票</c:when>
		    			 		</c:choose>
	    			 		</td>
	    			 		<td>${a.member_apply_tax_money}</td>
	    			 		<td>${a.member_apply_fact_money}</td>
	    			 		<td>${a.member_apply_pay_date}</td>
	    			 		<td>${a.member_apply_bank_serial}</td>
	    			 		<td>
		    			 		<c:choose>
		    			 			<c:when test="${a.member_apply_is_pay==0}">未支付</c:when>
			                        <c:when test="${a.member_apply_is_pay==1}">已支付</c:when>
		    			 		</c:choose>
	    			 		</td>
	    			 	</tr>
	    			 </c:forEach>
                   </tbody>
                </table>
                
            </form> 
         </div>
      </section>
     
	<%@ include file="footer_partner.jsp" %>
    <%@ include file="footer.jsp" %>

<script>
    $(function () {
        $("#txtBeginDate").calendar({
            controlId: "divDate01",                                 // 弹出的日期控件ID，默认: $(this).attr("id") + "Calendar"
            speed: 200,                                           // 三种预定速度之一的字符串("slow", "normal", or "fast")或表示动画时长的毫秒数值(如：1000),默认：200
            complement: true,                                     // 是否显示日期或年空白处的前后月的补充,默认：true
            readonly: true,                                       // 目标对象是否设为只读，默认：true
            upperLimit: new Date(),                               // 日期上限，默认：NaN(不限制)
            lowerLimit: new Date("2011/01/01"),                   // 日期下限，默认：NaN(不限制)
            callback: function () { 
               
            }
        });
		$("#txtEndDate").calendar({
            controlId: "divDate02",                                 // 弹出的日期控件ID，默认: $(this).attr("id") + "Calendar"
            speed: 200,                                           // 三种预定速度之一的字符串("slow", "normal", or "fast")或表示动画时长的毫秒数值(如：1000),默认：200
            complement: true,                                     // 是否显示日期或年空白处的前后月的补充,默认：true
            readonly: true,                                       // 目标对象是否设为只读，默认：true
            upperLimit: new Date(),                               // 日期上限，默认：NaN(不限制)
            lowerLimit: new Date("2011/01/01"),                   // 日期下限，默认：NaN(不限制)
            callback: function () {                               // 点击选择日期后的回调函数
               
            }
        });
    });
</script>

</body>
</html>
