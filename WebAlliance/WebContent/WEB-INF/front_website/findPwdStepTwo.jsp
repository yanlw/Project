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
<style type="text/css">
	.msg {color:#5DA7F5 ; font-size: 14px;}
	.error_msg {color: red;}
	.right_msg {color: green;}
</style>
<script type="text/javascript">
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
		var y = check_password();
		if(y){
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
	  
      <div class="pwd_box">
	   <div class="title">
         <h3>找回密码</h3>
	   </div>
	   <div class="process">
	   <img src="../images/sss2.png" />
	   </div>
	   <div class="form">
	   <form action="findPwdStepThree.do" method="post" id="StepTwo" onsubmit="return check();">
		   <table border="0">
			 <tr>
				<td width="170" align="right">
				新登录密码：
				</td>
				<td width="280" align="center">
				<input type="password" name="ad_member_new_pw" id="password1" onblur="check_password();"/>
				</td>
				<td width="240" align="left" id="password1_msg" class="msg">
					请输入您的新密码
				</td>
			 </tr>
			 <tr>
				<td align="right">
				确认新密码：
				</td>
				<td align="center">
				<input type="password" name="name" id="password2" onblur="check_password();"/>
				</td>
				<td id="password2_msg" class="msg" align="left">请再次输入您的新密码</td>
			 </tr>
			  <tr>
				<td>
				
				</td>
				<td>
				<input type="submit" class="next" value="提 交"/>
				</td>
				<td>
				
				</td>
			 </tr>
		   </table>
	   </form>
	   </div>
      </div>
      
    <%@ include file="footer.jsp" %>
      
</body>
</html>
