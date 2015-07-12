<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业用户页面</title>
</head>
<body>
	<s:include value="header.jsp"/><br><br>
	<div>
		您好，<s:property value="#session.enterprise.userName"/><br>
		<s:a action="EnterpriseAction_toEnterprisePage" namespace="/"><s:property value="#session.enterprise.compName"/></s:a><br>
		<s:if test="#session.enterprise.authenticate==1">
			已认证
		</s:if><s:else>
			未认证 &nbsp;<s:a action="EnterpriseAction_toEnterprisePage" namespace="/"><input type="button" value="我要认证"/></s:a>
		</s:else>
	</div>
</body>
</html>