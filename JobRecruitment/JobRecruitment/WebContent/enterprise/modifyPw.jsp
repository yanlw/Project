<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业修改密码</title>
</head>
<body>
	<s:include value="header.jsp"/>
	<div>
		<s:form action="modifyPwAction_doModifyPw" namespace="/" method="post">
			旧密码：<s:password name="password"/><s:actionerror/><br>
			新密码：<s:password name="newPassword"/><s:fielderror><s:param>newPassword</s:param></s:fielderror><br>
			确定密码：<s:password name="confirmPassword"/><br>
			<s:submit value="修改"/><s:reset value="取消"/>
		</s:form>
	</div>
</body>
</html>