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
		<title>车险无忧大联盟 - 联盟指南</title>
		<link href="../style/reset.css" rel="stylesheet" />
		<link href="../style/common.css" rel="stylesheet" />
		<link rel="stylesheet" href="../fonts/iconfont.css">
		<link href="../style/style.css" rel="stylesheet" />
		<script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/jquery.cycle.all.min.js"></script>
		<script src="../js/script.js"></script>
 		<script src="../js/html5shiv.min.js"></script>
 		<script type="text/javascript">
 			//如何加盟
 			function howJoinAlliance(){
 				$("#allianceClass #subtitle").html("如何加盟");
 				$("#allianceClass #contentText").html("<h3>1.阅读协议/注册加入</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详细阅读车险无忧大联盟协议，完全同意车险无忧大联盟协议内容。注册会员，提交大联盟成员申请；<br><h3>2.审核通过/获取广告代码</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登录车险无忧大联盟进入“获取代码”获取广告代码；<br><h3>3.投放广告</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;复制广告代码至您的网站相应位置。");
 			}
 			//常见问题
 			function getProblem(){
 				$("#allianceClass #subtitle").html("常见问题");
 				$("#allianceClass #contentText").html("<h3>1.如何才可以成为车险无忧大联盟会员？</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;答：如果您想成为车险无忧大联盟的会员，首先需要注册并审核通过后，加入车险无忧大联盟。<br>" +
 				"<h3>2.我的大联盟账号密码忘了或被盗怎么办？</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;答：在车险无忧大联盟的合作代码和密码是您在系统中的重要信息，请妥善保管，登录密码请定期更换。如果出现账号被盗的情况，请及时与我们联系，因未及时联系造成的一切损失由用户本人独自承担。建议不要在网吧等不安全的场所登录大联盟账号，并定期更换密码。<br>" +
 				"<h3>3.申请加入车险无忧大联盟需要通过审核吗？</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;答：在您加入车险无忧大联盟时，需要在推广途径中完善您的推广信息，请您结合自己实际采用的推广途径填写信息，系统会依据您提交的材料进行审核。<br>" +
 				"<h3>4.注册审核未通过是否还可以重新申请？</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;答：如果您提交的注册信息没有通过车险无忧大联盟的审核，您是可以再次进行提交您的审核申请的。<br>" +
 				"<h3>5.如果没有网站可以用QQ发链接或是微博、SNS发链接方式、或是在软件上放广告方式推广吗？</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;答：可以的。如果您没有自己网站，请您结合自己实际采用的推广途径填写信息，车险无忧大联盟将针对您提交的资料进行如实审核，即可进行车险无忧大联盟推广。<br>");
 			}
 			
 			String.prototype.getQueryString = function(name)
			{
			  var reg = new RegExp("(^|&|\\?)"+ name +"=([^&]*)(&|$)"), r;
			  if (r=this.match(reg)) return unescape(r[2]); return null;
			};
 			var id = location.search.getQueryString("id");
 			if(id == "getAllianceSummary"){
 				$(function(){
 					getAllianceSummary();
 				});
 			}
 			if(id == "getJoinCondition"){
 				$(function(){
 					getJoinCondition();
 				});
 			}
 			if(id == "howJoinAlliance"){
 				$(function(){
 					howJoinAlliance();
 				});
 			}
 			if(id == "getProblem"){
 				$(function(){
 					getProblem();
 				});
 			}
 			if(id == "allianceAnnounce"){
 				$(function(){
 					allianceAnnounce();
 				});
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
			<div class="memb_02">
				<span>联盟指南</span>
				<ul>
					<li>
						<a href="javascript:howJoinAlliance();" title="">如何加盟</a>
					</li>
					<li>
						<a href="javascript:getProblem();" title="">常见问题</a>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="content left" id="allianceClass">
			<h2 id="subtitle"></h2>
			<div class="cnt_m" id="contentText">
			</div>
		</div>
		</section>
		
		<%@ include file="footer_partner.jsp" %>
      	<%@ include file="footer.jsp" %>
      
	</body>
</html>
