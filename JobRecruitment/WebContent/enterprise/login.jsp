<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业登录或注册</title>
<style>
	*{ margin:0; padding:0; list-style:none;}
	body{ font-size:12px;}
	
	#menu{width:360px; overflow:hidden; margin:100px auto;border:1px solid #BF9660;}
	#menu #nav {display:block;width:100%;padding:0;margin:0;list-style:none;}
	#menu #nav li {float:left;width:120px;}
	#menu #nav li a {display:block;line-height:27px;text-decoration:none;padding:0 0 0 5px; text-align:center; color:#333;}
	#menu_con{ width:358px; height:135px; border-top:none}
	.tag{ padding:10px; overflow:hidden;}
	.selected{background:#C5A069; color:#fff;}
</style>
<script type="text/javascript" src="/js/tabs.js"></script>
<script type="text/javascript">
	tabs.set("nav","menu_con");//执行
</script>
</head>
<body>
	<div id="menu">
		<!--tag标题-->
	    <ul id="nav">
	        <li><a href="#" class="selected">有企业账号，马上登录</a></li>
	        <li><a href="#">没有账号，免费注册</a></li>
	    </ul>
		<!--二级菜单-->
	    <div id="menu_con">
	        <div id="login" class="tag">
				<s:form action="LoginAction_doLogin" namespace="/" method="post">
					<s:hidden name="loginType" value="1"/>
					用户名:<s:textfield name="userName"/><s:actionerror/>
					密码：<s:password name="password"/>
					<s:submit value="登录"/><br>
				</s:form>
	         </div> 
	        <div class="tag" style="display:none">
	         	<s:form action="RegAction_doReg" namespace="/" method="post">
					<s:hidden name="RegType" value="1"/>
					<h1>公司信息</h1>
					企业名称：<s:textfield name="compName"/><s:fielderror><s:param>compName</s:param></s:fielderror>
					企业地址：<s:textfield name="compAddress"/><s:fielderror><s:param>compAddress</s:param></s:fielderror>
					联系人：<s:textfield name="contactor"/><s:radio list="#{true:'先生',false:'女士'}" name="sex"/><s:fielderror><s:param>contactor</s:param></s:fielderror>
					联系方式：<s:textfield name="phone"/><s:fielderror><s:param>phone</s:param></s:fielderror>
					<h1>账户信息</h1>
					用户名：<s:textfield name="userName"/><s:fielderror><s:param>userName</s:param></s:fielderror>
					邮箱：<s:textfield name="email"/><s:fielderror><s:param>email</s:param></s:fielderror>
					密码：<s:password name="password"/><s:fielderror><s:param>password</s:param></s:fielderror>
					确定密码：<s:password name="confirmPassword"/>
					<s:submit value="免费注册"/>
				</s:form>
	        </div> 
		</div>
	</div>
</body>
</html>