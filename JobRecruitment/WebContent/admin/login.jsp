<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
</head>
<body>
	<s:form action="adminLoginAction_doLogin" namespace="/" method="post">
		<s:hidden name="loginType" value="2"/>
		用户名:<s:textfield name="userName"/><s:actionerror/><br>
		密码：<s:password name="password"/><br>
		<s:submit value="登录"/>
	</s:form>
</body>
</html>