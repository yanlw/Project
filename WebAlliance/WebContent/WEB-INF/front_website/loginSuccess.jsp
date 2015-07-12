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
<title>欢迎来到车险无忧大联盟</title>
<link href="../style/reset.css" rel="stylesheet" />
<link href="../style/common.css" rel="stylesheet"  />
<link href="../fonts/iconfont.css" rel="stylesheet">
<link href="../style/style.css" rel="stylesheet" />
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/jquery.cycle.all.min.js"></script>
<script src="../js/script.js"></script>
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
         <div class="box_02 left">
            <div id="slider" class="bx02_01">
                  <!-- start slideshow -->
                  <div id="slideshow">
                    <div class="slider-item"><a href="http://www.baidu.com"><img src="../images/001.jpg" width="540" height="264"/></a></div>
                    <!-- <div class="slider-item"><a href=""><img src="../images/002.jpg" width="540" height="264"/></a></div> -->
                    <!-- <div class="slider-item"><a href=""><img src="../images/003.jpg" width="540" height="264"/></a></div> -->
                    <!-- <div class="slider-item"><a href=""><img src="../images/004.jpg" width="540" height="264"/></a></div> -->
                  </div>
                  <!-- end #slideshow -->
                  <div class="controls-center">
                    <div id="slider_controls">
                      <ul id="slider_nav">
                        <li><a href="http://www.chexian51.com"></a></li>
                        <!-- <li><a href="#"></a></li> -->
                        <!-- <li><a href="#"></a></li> -->
                        <!-- <li><a href="#"></a></li> -->
                      </ul>
                    </div>
                  </div>
                  <div class="clr"></div>
                </div>
            <div class="bx02_02 mg_tp_20">
               <p><a href="" class="more right"></a><span>推广费比例</span></p>
               <div class="seo">
                  <div class="so_01">
                      <span class="so_info">大联盟会员通过推广车险广告链接为车险无忧带来会员注册及车险产品销售收入，大联盟会员会有以下2种收入：</span>
                      <i><a href="javascript:;" class="seo_01"></a><br/><span>每个有效注册3-5元</span></i>
                      <i><a href="javascript:;" class="seo_02"></a><br/><span>每笔有效交易收入15~50%</span></i>
                  </div>
               </div>
               <ul>
                     <li><a href="toGetSpreadCode.do" class="so_active">我要推广</a></li>
                     <li><a href="viewIncome.do">收益详细</a></li>
                  </ul>
            </div>
         </div>
         <div class="box_03 left">
            <div class="bx03_02 mg_tp_20">
                <a href="" class="more right"></a><span>当月排行榜<i>TOP5</i></span>
                <ul>
                    <li><span>0.00 元</span><a href="#" title="">程**</a></li>  
                    <li><span>0.00 元</span><a href="#" title="">单**</a></li>
                    <li><span>0.00 元</span><a href="#" title="">韩**</a></li>
                    <li><span>0.00 元</span><a href="#" title="">俞**</a></li>
                    <li><span>0.00 元</span><a href="#" title="">梁**</a></li>
                </ul>
            </div>
           <div class="mg_tp_20 bx03_03">
                <a href="" class="more right"></a><span>最新加盟会员</span>
                <ul>
                    <c:forEach items="${newestMembers}" var="newestMember" varStatus="ni">
						<li>
							<c:if test="${ni.index<8}">
								<span><fmt:formatDate value="${newestMember.create_time}" pattern="yyyy-MM-dd"/></span>
								<a href="#" title="">${newestMember.ad_member_name}&nbsp;&nbsp;(${newestMember.ad_member_no})</a>
							</c:if>
						</li>
					</c:forEach>
                </ul>
            </div>
            
         </div>
      </section>

	<%@ include file="footer_partner.jsp" %>
    <%@ include file="footer.jsp" %>

</body>
</html>
