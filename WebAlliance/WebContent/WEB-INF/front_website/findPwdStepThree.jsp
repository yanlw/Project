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
<title>车险无忧大联盟 - 找回密码</title>
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
  
      <div class="pwd_box">
	   <div class="title">
         <h3>找回密码</h3>
	   </div>
	   <div class="process">
	   <img src="../images/sss3.png" />
	   </div>
	   <div class="form">
	     <div class="tips">
		   <p class="p1">新密码设置成功！</p>
			<p class="p2">请牢记您新设置的密码。<span><a href="index.do" style="color:#fcb461;">返回首页</a></span></p>
		 </div>
	   </div>
      </div>
      
    <%@ include file="footer.jsp" %>
    
</body>
</html>
