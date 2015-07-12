<%@page pageEncoding="utf-8" isELIgnored="false"
	contentType="text/html; charset=utf-8"%>
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
<title>车险无忧大联盟 - 首页</title>
<link href="<%=basePath %>style/reset.css" rel="stylesheet" />
<link href="<%=basePath %>style/common.css" rel="stylesheet"  />
<link href="<%=basePath %>fonts/iconfont.css" rel="stylesheet" >
<link href="<%=basePath %>style/style.css" rel="stylesheet" />
<script src="<%=basePath %>js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath %>js/jquery.cycle.all.min.js"></script>
<script src="<%=basePath %>js/script.js"></script>
<script src="<%=basePath %>js/html5shiv.min.js"></script>
<script type="text/javascript">
 	//如何加盟
	function howJoinAlliance(){
		location.href = "toAllianceClass.do?id=howJoinAlliance";
	}
	//常见问题
	function getProblem(){
		location.href = "toAllianceClass.do?id=getProblem";
	}
</script>
<script type="text/javascript">
	function checkLogin() {
		var ad_member_id = $("#ad_member_id").val();
		var ad_member_pw = $("#ad_member_pw").val();
		if (ad_member_id == "" || ad_member_id == null) {
			//$("#loginMessage").text("请输入用户名");
			alert("请输入用户名!");
			return;
		}
		if (ad_member_pw == "" || ad_member_pw == null) {
			//$("#loginMessage").text("请输入密码");
			alert("请输入密码!");
			return;
		}
		$.post("checkLogin.do", {
			"username" : ad_member_id,
			"password" : ad_member_pw
		}, function(data) {
			if (data == 0) {
				location.href = "loginSuccess.do";
				return;
			}
			if (data == 1) {
				//$("#loginMessage").text("用户名不存在");
				alert("用户名不存在 ！");
				return;
			}
			if (data == 2) {
				//$("#loginMessage").text("密码错误");
				alert("密码错误 ！");
				return;
			}
			if (data == 3) {
				//$("#loginMessage").text("验证码错误");
				alert("该账号还未通过审核，请通过审核后再次登录 ！");
				return;
			}
		});
	}
	
	function set_msg() {
		$("#loginMessage").text(" ");
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
           <div class="bx01_01">
             <p>会员登录</p>
             <span>邮&nbsp;&nbsp;箱：</span>
             <input type="text" name="ad_member_id" id="ad_member_id" onfocus=""><br>
             <span>密&nbsp;&nbsp;码：</span>
             <input type="password" name="ad_member_pw" id="ad_member_pw" onfocus=""><br>
             <a href="<%=basePath %>alliance/findPwdStepOne.do">找回密码</a>
             <button type="button" class="lg_sub" onclick="checkLogin();">登录</button>
           </div>
            <div class="bx01_02 mg_tp_20"><a href="<%=basePath %>alliance/toAllianceClass.do"><img src="<%=basePath %>images/class.png" alt="大联盟课堂" width="290" height="125"></a></div>
            <div class="bx01_03 mg_tp_20">
                <span>大联盟指南</span>
                <ul>
                    <li><a href="javascript:howJoinAlliance();" title="">如何加盟</a></li> 
                    <li><a href="javascript:getProblem();" title="">常见问题</a></li>                                  
                </ul>
            </div>

         </div>
         <div class="box_02 left">
            <div id="slider" class="bx02_01">
                  <!-- start slideshow -->
                  <div id="slideshow">
                    <div class="slider-item"><a href="http://www.baidu.com" target="_blank"><img src="<%=basePath %>images/001.jpg" width="540" height="264"/></a></div>
                  </div>
                  <!-- end #slideshow -->
                  <div class="controls-center">
                    <div id="slider_controls">
                      <ul id="slider_nav">
                        <li><a href="http://www.baidu.com" target="_blank"></a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="clr"></div>
                </div>
            <div class="bx02_02 mg_tp_20">
               <p><a href="" class="more right"></a><span>推广费比例</span></p>
               <div class="seo">
                  <div class="so_01">
                      <span class="so_info">大联盟会员通过推广广告链接带来会员注册及车险产品销售收入，大联盟会员会有以下2种收入：</span>
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
            
            <!-- <div class="mg_tp_20 bx03_03">
                <a href="" class="more right">更多></a><span>大联盟年度大富翁<i>TOP5</i></span>
                <ul>
                    <li><span>0.00 元</span><a href="#" title="">程景(mark)</a></li>  
                    <li><span>0.00 元</span><a href="#" title="">单咏(Shannon)</a></li>
                    <li><span>0.00 元</span><a href="#" title="">韩阳(Tyrael)</a></li>
                    <li><span>0.00 元</span><a href="#" title="">俞莲(Renee)</a></li>
                    <li><span>0.00 元</span><a href="#" title="">梁敏(kyle)</a></li>
                </ul>
            </div>
             -->
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
