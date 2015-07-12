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
	.pwd_box .form .error_msg {
		color: red;
		margin-left: 10px;
	}
	
	.pwd_box .form .right_msg {
		color: green;
		margin-left: 10px;
	}
	.pwd_box .form .codebt{margin-left:20px; width:98px; font-size:14px; height:40px;background:gray;border:none;color:#fff;}
</style>
<script type="text/javascript">
	var flag;
	function check_phone() {
		var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		var phone = $("#ad_member_phone").val();
		if (phone == "") {
			$("#phone_msg").removeClass();
			$("#phone_msg").text("手机号码不能为空").addClass("error_msg");
			return false;
		}
		if (!reg.test(phone)) {
			$("#phone_msg").removeClass();
			$("#phone_msg").text("手机号码格式错误").addClass("error_msg");
			return false;
		}
		$.ajax({     
		    url:"checkMemberByPhone.do",     
		    type:'post',     
		    data:'ad_member_phone='+phone,     
		    async : false, //默认为true 异步        
		    success:function(data){ 
		    	if(data==0){
		    		$("#phone_msg").text("");
		    		return true;	
		    	}else if(data==1){
		    		$("#phone_msg").removeClass();
					$("#phone_msg").text("手机号未绑定账号").addClass("error_msg");
		    		return false;
		    	}
		    }
		}); 
	}
	
	//发送短信验证码
	function achievePhoneCode(){
		var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		var phone = $("#ad_member_phone").val();
		if (phone == "") {
			$("#phone_msg").removeClass();
			$("#phone_msg").text("手机号码不能为空").addClass("error_msg");
			return false;
		}
		if (!reg.test(phone)) {
			$("#phone_msg").removeClass();
			$("#phone_msg").text("手机号码格式错误").addClass("error_msg");
			return false;
		}
		$.ajax({     
		    url:"checkMemberByPhone.do",     
		    type:'post',     
		    data:'ad_member_phone='+phone,     
		    async : false, //默认为true 异步        
		    success:function(data){ 
		    	if(data==0){
		    		$("#phone_msg").text("");
		    		return true;	
		    	}else if(data==1){
		    		$("#phone_msg").removeClass();
					$("#phone_msg").text("手机号未绑定账号").addClass("error_msg");
		    		return false;
		    	}
		    }
		}); 
		$.post("achievePhoneCode.do", $("#ad_member_phone").serialize(), function(data) {
			$("#phone_msg").removeClass();
			$("#phone_msg").text("短信验证码已发送").addClass("right_msg");
			var i = 30;
			var timer = setInterval(function(){
				if(i == 0){
					$("#codebt").attr("onclick","achievePhoneCode();").text("获取验证码").removeClass("codebt");
					clearInterval(timer);
					return;
				}
				$("#codebt").removeAttr("onclick").text("获取验证码("+i+")").addClass("codebt");
				i--;
			},1000);
		});
	}

	function check_mes() {
		var mes = $("#mes").val();
		if (mes == "") {
			$("#mes_msg").removeClass();
			$("#mes_msg").text("短信验证码不能为空").addClass("error_msg");
			return false;
		}
		$.post("checkPhoneCode.do", $("#mes").serialize(), function(data) {
			if (data == 0) {
				$("#mes_msg").removeClass();
				$("#mes_msg").text("短信验证码没有获取").addClass("error_msg");
				flag = false;
			} else if (data == 1) {
				$("#mes_msg").removeClass();
				$("#mes_msg").text("短信验证码错误").addClass("error_msg");
				flag = false;
			} else {
				$("#mes_msg").removeClass();
				$("#mes_msg").text("短信验证码正确").addClass("right_msg");
				flag = true;
			}
		});
		return flag;
	}
	
	function check(){
		var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		var phone = $("#ad_member_phone").val();
		if (phone == "") {
			$("#phone_msg").removeClass();
			$("#phone_msg").text("手机号码不能为空").addClass("error_msg");
			return false;
		}
		if (!reg.test(phone)) {
			$("#phone_msg").removeClass();
			$("#phone_msg").text("手机号码格式错误").addClass("error_msg");
			return false;
		}
		$.ajax({     
		    url:"checkMemberByPhone.do",     
		    type:'post',     
		    data:'ad_member_phone='+phone,     
		    async : false, //默认为true 异步      
		    success:function(data){ 
		    	if(data==0){
		    		var mes = $("#mes").val();
					if (mes == "") {
						$("#mes_msg").removeClass();
						$("#mes_msg").text("短信验证码不能为空").addClass("error_msg");
						return false;
					}
					$.post("checkPhoneCode.do", $("#mes").serialize(), function(data) {
						if (data == 0) {
							$("#mes_msg").removeClass();
							$("#mes_msg").text("短信验证码没有获取").addClass("error_msg");
							return false;
						} else if (data == 1) {
							$("#mes_msg").removeClass();
							$("#mes_msg").text("短信验证码错误").addClass("error_msg");
							return false;
						} else {
							$("#mes_msg").removeClass();
							$("#mes_msg").text("短信验证码正确").addClass("right_msg");
							document.stepOne.submit();
							return true;
						}
					});
		    	}else if(data==1){
		    		$("#phone_msg").removeClass();
					$("#phone_msg").text("手机号未绑定账号").addClass("error_msg");
		    		return false;
		    	}
		    }
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
	  
      <div class="pwd_box">
	   <div class="title">
         <h3>找回密码</h3>
	   </div>
	   <div class="process">
	   <img src="../images/sss1.png" />
	   </div>
	   <div class="form">
		   <form action="findPwdStepTwo.do" method="post" id="stepOne" name="stepOne">
			   <table border="0">
				 <tr>
					<td width="170" align="right">请输入手机号码：</td>
					<td width="280" align="center">
						<input type="text" id="ad_member_phone" name="ad_member_phone" onblur="check_phone();">
					</td>
					<td width="280" align="left">
						<a id="codebt" onclick="achievePhoneCode();" class="send_code" style="padding: 10px">获取验证码</a>
						<span id="phone_msg"></span>
					</td>
				 </tr>
				 <tr>
					<td align="right">请输入您收到的验证码：</td>
					<td align="center">
						<input type="text" id="mes" name="phoneCode" onblur="check_mes();">
					</td>
					<td>
						<span id="mes_msg"></span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				 </tr>
				  <tr>
					<td>
					</td>
					<td>
						<button type="button" class="next" onclick="check();"/>下一步</button>
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
