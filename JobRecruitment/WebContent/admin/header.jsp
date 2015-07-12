<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导航</title>
</head>
<body>
	<div align="right">
		<s:if test="#session.admin != null">
			您好，<s:property value="#session.admin"/>&nbsp;
			<s:a action="AdminAction_toModifyPwPage" namespace="/">[修改密码]</s:a>&nbsp;
			<s:a action="adminLoginAction_logout?loginType=2" namespace="/">退出</s:a>
		</s:if>
	</div><br>
	<s:a action="AdminAction_toIndex">首页</s:a>
	<s:a action="UserAction_findUserList">用户管理</s:a>
	<s:a action="EnterpriseAction_findEnterpriseList">企业管理</s:a>
	<s:a action="EnterpriseAction_findLicenseList">认证审核</s:a>
	<s:a action="PostsAction_findMyPostsList?status =-1">招聘审核</s:a>
</body>
</html>