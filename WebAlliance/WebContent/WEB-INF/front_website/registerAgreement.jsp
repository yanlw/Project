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
<title>车险无忧大联盟 - 用户注册协议</title>
<link href="../style/reset.css" rel="stylesheet" />
<link href="../style/common.css" rel="stylesheet"  />
<link rel="stylesheet" href="fonts/iconfont.css">
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

      <div class="agreement_bg">
          <section>
              <div class="agr_title">车险无忧用户注册协议</div>
              <div class="agr_top">本协议是会员（以下简称“您”）与车险无忧大联盟（简称“本站”）所有者就车险无忧大联盟网站服务等相关事宜所订立
的契约，请您仔细阅读本注册协议，您点击"同意并继续"按钮后，即视为您接受并同意遵守本协议的约定。</div>  
              <div class="agr_con">1.1本站的各项电子服务的所有权和运作权归车险无忧大联盟所有。您同意所有注册协议条款并完成注册程序，才能成为本站的正式用户。您确认：本协议条款是处理双方权利义务的
依据，始终有效，法律另有强制性规定或双方另有特别约定的，依其规定或约定。<br/>
1.2您点击同意本协议的，即视为您确认自己具有享受本站服务、下单购物等相应的权利能力和行为能力，能够独立承担法律责任。<br/>
1.3您确认，如果您在18周岁以下，您只能在父母或其他监护人的监护参与下才能使用本站。<br/>
1.4车险无忧大联盟保留在中华人民共和国大陆地区施行之法律允许的范围内独自决定拒绝服务、关闭用户账户、清除或编辑内容或取消订单的权利。<br/>
1.5您使用本站提供的服务时，应同时接受适用于本站特定服务、活动等的准则、条款和协议（以下统称为“其他条款”）；如果以下使用条件与“其他条款”有不一致之处，
则以其他条款”为准。<br/>
          </section>
      </div>

	<%@ include file="footer_partner.jsp" %>
    <%@ include file="footer.jsp" %>

      <script>
         $(function(){
			 var _width=$('.page ul').outerWidth();
			 $('.page ul').css({'margin-left':-_width/2})
			 
		 })
      </script>
</body>
</html>
