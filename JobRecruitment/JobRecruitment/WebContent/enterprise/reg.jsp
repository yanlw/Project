<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业注册</title>
</head>
<body>
	<s:form action="RegAction_doReg" namespace="/" method="post">
		<s:hidden name="RegType" value="1"/>
		<h1>公司信息</h1>
		企业名称：<s:textfield name="compName"/><s:fielderror><s:param>compName</s:param></s:fielderror><br>
		企业地址：<s:textfield name="compAddress"/><s:fielderror><s:param>compAddress</s:param></s:fielderror><br>
		联系人：<s:textfield name="contactor"/><s:radio list="#{true:'先生',false:'女士'}" name="sex"/><s:fielderror><s:param>contactor</s:param></s:fielderror><br>
		联系方式：<s:textfield name="phone"/><s:fielderror><s:param>phone</s:param></s:fielderror><br>
		<h1>账户信息</h1>
		用户名：<s:textfield name="userName"/><s:fielderror><s:param>userName</s:param></s:fielderror><br>
		邮箱：<s:textfield name="email"/><s:fielderror><s:param>email</s:param></s:fielderror><br>
		密码：<s:password name="password"/><s:fielderror><s:param>password</s:param></s:fielderror><br>
		确定密码：<s:password name="confirmPassword"/><br>
		<s:submit value="免费注册"/>
	</s:form>
</body>
</html>