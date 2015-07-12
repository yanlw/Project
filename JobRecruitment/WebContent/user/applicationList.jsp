<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投递记录</title>
</head>
<body>
	<s:include value="/header.jsp"/><br>
	<div id="search">
		<s:form action="JobApplicationAction_applicationList" namespace="/" method="post">
			职位名称：<s:textfield name="posts.title"/><br>
			公司名称：<s:textfield name="posts.enterprise.compName"/><br>
			投递时间：<s:textfield name="startDate"/>--<s:textfield name="endDate"/><br>
			状态：<s:select list="#{-1:'审核中',0:'未通过',1:'已通过'}" name="status"/>
			<s:submit value="查询"/>
		</s:form>
	</div>
	<div id="data">
		<ul>
			<li>职位名称&nbsp;公司名称&nbsp;工作地点&nbsp;投递日期&nbsp;审核状态&nbsp;操作</li>
			<s:iterator value="myApplication"  id="list" status="status">
				<s:set var="jId" value="#list[0]" />
				<s:set var="sId" value="#list[1]" />
				<li>
					<s:a action="PostsAction_previewPosts?sid=%{#sId}" namespace="/"><s:property value="#list[2]"/></s:a>&nbsp;
					<s:property value="#list[3]"/>&nbsp;
					<s:property value="#list[4]"/>&nbsp;
					<s:date name="#list[5]" format="yyyy/MM/dd"/>&nbsp;
					<s:if test="%{#list[6] == 0}">
						未通过
					</s:if><s:elseif test="%{#list[6] == 1}">
						已通过
					</s:elseif><s:else>
						审核中
					</s:else>
					&nbsp;
					<s:a action="JobApplicationAction_delApplication?sid=%{#jId}" namespace="/">删除</s:a>
				</li>
		    </s:iterator>
		</ul>
	</div>
</body>
</html>