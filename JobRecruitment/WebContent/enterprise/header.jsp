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
		<s:if test="#session.enterprise != null">
			您好，<s:property value="#session.enterprise.userName"/>&nbsp;
			<s:a action="modifyPwAction_toModifyPwPage" namespace="/">[修改密码]</s:a>&nbsp;
			<s:a action="LoginAction_logout?loginType=1" namespace="/">退出</s:a>
		</s:if>
	</div><br>
	<s:a action="EnterpriseAction_toIndexPage">首页</s:a>
	<s:a action="PostsAction_myPosts">我的职位</s:a>
	<s:a action="JobApplicationAction_myResumeList">我的简历</s:a>
	<s:a action="ResumeAction_findOpenResumes">简历搜索</s:a>
	<s:a action="EnterpriseAction_toEnterprisePage">公司信息</s:a>
</body>
</html>