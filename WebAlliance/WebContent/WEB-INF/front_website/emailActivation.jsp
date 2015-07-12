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
<title>车险无忧大联盟 - 邮箱激活</title>
<link href="../style/reset.css" rel="stylesheet" />
<link href="../style/common.css" rel="stylesheet"  />
<link rel="stylesheet" href="../fonts/iconfont.css">
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

      <div class="cnt_z cnt_mail">
          <div class="mail_intro">
          <br>
              <div style="color:blue;font-weight: bold;">
              	感谢注册，确认邮件已发送至您注册的邮箱中：${register.ad_member_email}<br><br>
              	请进入邮箱查看邮件，并激活大联盟账号
              </div>
              
              <br><br><br>
              <div  style="color:lightblue;">
              	没有收到邮件？<br>
	            &nbsp;&nbsp;&nbsp;&nbsp;1.&nbsp;请检查邮箱地址是否正确，您可以返回重新输入<br>
	            &nbsp;&nbsp;&nbsp;&nbsp;2.&nbsp;请检查您的垃圾邮箱<br>
	            &nbsp;&nbsp;&nbsp;&nbsp;3.&nbsp;若仍未收到，请尝试重新发送
              </div>
          </div>
          
      </div>
     
    <%@ include file="footer.jsp" %>

</body>
</html>
