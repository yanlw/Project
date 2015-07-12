<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的职位</title>
</head>
<body>
	<s:include value="header.jsp"/><br>
	<s:a action="PostsAction_toMyPostsPage" namespace="/">发布职位</s:a><br>
	<div id="data">
		<ul>
			<li>职位名称&nbsp;工作地点&nbsp;招聘人数&nbsp;发布日期&nbsp;审核状态&nbsp;操作</li>
			<s:iterator value="myPosts">
				<s:set var="sId" value="id" />
				<li>
					<s:property value="title"/>&nbsp;
					<s:property value="cacheLocationF"/>&nbsp;
					<s:property value="jobnum"/>&nbsp;
					<s:property value="lastDate"/>&nbsp;
					<s:property value="approvalStatus"/>&nbsp;
					<s:a action="PostsAction_editPosts?sid=%{#sId}" namespace="/">修改</s:a>
					<s:a action="PostsAction_delPosts?sid=%{#sId}" namespace="/">删除</s:a>
				</li>
			</s:iterator>
		</ul>
	</div>
</body>
</html>