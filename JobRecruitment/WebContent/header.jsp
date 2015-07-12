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
	<s:a action="LoginAction_toLoginPage?loginType=0">首页</s:a>
	<s:a action="ResumeAction_myResumes">简历中心</s:a>
	<s:a action="PostsAction_findMyPostsList?status=1">职位搜索</s:a>
	<s:a action="JobApplicationAction_applicationList">投递记录</s:a>
</body>
</html>