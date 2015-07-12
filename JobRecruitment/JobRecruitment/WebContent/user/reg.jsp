<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>注册页面</title>
	</head>
	<body>
		<s:form action="RegAction_doReg" method="post">
			<s:hidden name="regType" value="0"/>
			邮箱：<s:textfield name="email"/><s:fielderror><s:param>email</s:param></s:fielderror>
			密码：<s:password name="password"/><s:fielderror><s:param>password</s:param></s:fielderror>
			确定密码：<s:password name="confirmPassword"/>
			<s:submit value="立即注册"/>
		</s:form>
	</body>
</html>