<%@page pageEncoding="utf-8" isELIgnored="false"
	contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="test" prefix="t"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<title>车险无忧大联盟 - 会员注册</title>
		<link href="../style/reset.css" rel="stylesheet" />
		<link href="../style/common.css" rel="stylesheet" />
		<link rel="stylesheet" href="../fonts/iconfont.css">
		<link href="../style/style.css" rel="stylesheet" />
		<script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/jquery.cycle.all.min.js"></script>
		<script src="../js/script.js"></script>
		<script src="../js/html5shiv.min.js"></script>
		<style type="text/css">
			.reg .fr_z .inp_z .error_msg {
				font-size: 12px;
				color: red;
				display: block;
				margin-top: 10px;
				width: 100%
			}
			
			.reg .fr_z .inp_z .right_msg {
				font-size: 12px;
				color: green;
				display: block;
				margin-top: 10px;
				width: 100%
			}
		</style>
<script type="text/javascript">
	var code_flag;
	var email_flag;
	//刷新验证码图片
	function change_code() {
		$("#image_code").attr("src", "image_code.do?date=" + new Date().getTime());
	}
	
	function set_msg(id, msg) {
		$("#"+id).removeClass();
		$("#" + id).text(msg);
	}
	
	function check_email() {
		var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		var email = $("#email").val();
		if (email == "") {
			$("#email_msg").removeClass();
			$("#email_msg").text("邮箱不能为空").addClass("error_msg");
			return false;
		}
		if (!reg.test(email)) {
			$("#email_msg").removeClass();
			$("#email_msg").text("邮箱格式错误，请重新输入").addClass("error_msg");
			return false;
		}
		$.post("checkMemberByEmail.do",$("#email").serialize(),
				function(data){
			      if(data==0){
			    	  $("#email_msg").removeClass();
						$("#email_msg").text("邮箱已被注册").addClass("error_msg");
						email_flag=false;
				      }
			          if(data==1){
				    	  $("#email_msg").removeClass();
							$("#email_msg").text("可以注册的邮箱").addClass("right_msg");
							email_flag=true;
					      }
			});
		return email_flag;
	}
	
	function check_password() {
		var reg = /^[A-Za-z0-9]{6,16}$/;
		var password1 = $("#password1").val();
		if (password1 == "") {
			$("#password1_msg").removeClass();
			$("#password1_msg").text("密码不能为空").addClass("error_msg");
			return false;
		}
		if (!reg.test(password1)) {
			$("#password1_msg").removeClass();
			$("#password1_msg").text("密码格式错误，请输入6-16位字母、数字或者组合").addClass("error_msg");
			return false;
		}
		$("#password1_msg").text("密码格式正确").addClass("right_msg");
		var password2 = $("#password2").val();
		if (password2 == "") {
			$("#password2_msg").removeClass();
			$("#password2_msg").text("请再次输入密码").addClass("error_msg");
			return false;
		}
		if (password2 != password1) {
			$("#password2_msg").removeClass();
			$("#password2_msg").text("两次密码不相同").addClass("error_msg");
			return false;
		}
		$("#password2_msg").removeClass();
		$("#password2_msg").text("两次密码输入相同").addClass("right_msg");
		return true;
	}
	
	function check_code() {
		var code = $("#code").val();
		if (code == "") {
			$("#code_msg").removeClass("right_msg");
			$("#code_msg").text("验证码不能为空").addClass("error_msg");
			code_flag= false;
			return code_flag;
		}
		$.post("check_code.do", $("#code").serialize(), function(data) {
			if (data == 1) {
				$("#code_msg").removeClass("right_msg");
				$("#code_msg").text("验证码错误").addClass("error_msg");
				code_flag= false;
			} else {
				$("#code_msg").text("验证码正确").addClass("right_msg");
				code_flag=true;
				
			}
		});
		return code_flag;
	}
	
	function check_agreement(){
		var isagree = document.getElementById("argeement").attributes["ind"].value;  
		if(isagree == 1){
			alert("您未同意并遵守《大联盟服务协议》！");
			return false;
		}else{
			return true;
		}
	}
	
	function check() {
		var a = check_email();
		var b = check_password();
		var c = check_code();
		var d = check_agreement();
		if ( a && b && c && d) {
			$("#register").submit();
		} else {
			return;
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

		<div class="reg">
			<div class="cnt_z_title">
				会员注册
			</div>

			<form id="register" action="register.do?action=register"
				method="post">
				<div class="fr_z">
					<div class="lab">
						邮箱：
					</div>
					<div class="inp_z">
						<span id="email_msg">作为登录帐号，请填写未被联盟注册邮箱</span>
						<input type="text" name="ad_member_email" id="email"
							onblur="check_email();"
							onfocus="set_msg('email_msg', '作为登录帐号，请填写未被联盟注册邮箱(目前只支持QQ邮箱包括qq企业邮箱，新浪邮箱，网易邮箱)')" />
					</div>
				</div>
				<div class="fr_z">
					<div class="lab">
						密码：
					</div>
					<div class="inp_z">
						<span id="password1_msg">字母、数字或者组合，最短6位，区分大小写</span>
						<input type="password" name="ad_member_pw" id="password1"
							onblur="check_password();"
							onfocus="set_msg('password1_msg','字母、数字或者组合，最短6位，区分大小写')" />
					</div>
				</div>
				<div class="fr_z">
					<div class="lab">
						确认密码：
					</div>
					<div class="inp_z">
						<span id="password2_msg">请再次输入密码</span>
						<input type="password" id="password2" onblur="check_password();"
							onfocus="set_msg('password2_msg','请再次输入密码')" />
					</div>
				</div>
				<div class="fr_z vlidate_z">
					<div class="lab">
						验证码：
					</div>
					<div class="inp_z">
						<span id="code_msg">请输入验证码</span>
						<input type="text" name="code" id="code" onblur="check_code();"
							onfocus="set_msg('code_msg','请输入验证码')" style="margin-top:4px;"/>
						<img src="image_code.do" class="v_code" id="image_code" alt="验证码"
							title="点击更换" onclick="change_code();" />
						<a class="refrash" onclick="change_code();">换一张</a>
					</div>
				</div>
				<div class="accept">
					<i class="" id="argeement" ind="1"></i><a href="toRegisterAgreement.do">同意并遵守《大联盟服务协议》</a>
				</div>
				<input type="button" value="注 册" class="fr_sub" onclick="check();">
			</form>
		</div>

    <%@ include file="footer.jsp" %>
    
	</body>
</html>


