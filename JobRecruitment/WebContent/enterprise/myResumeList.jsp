<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的简历</title>
</head>
<body>
	<s:include value="header.jsp"/><br>
	<div id="search">
		<s:form action="JobApplicationAction_myResumeList" namespace="/" method="post">
			职位名称：<s:textfield name="posts.title"/><br>
			简历名称：<s:textfield name="resume.jobtypeF"/><br>
			学历：<s:select list="#{-1:'不限',1:'初中',2:'中技',3:'高中',4:'中专',5:'大专',6:'本科',7:'硕士',8:'MBA',9:'EMBA',10:'博士',0:'其他'}" name="resume.degree"/><br>
			投递时间：<s:textfield name="startDate"/>--<s:textfield name="endDate"/><br>
			状态：<s:select list="#{-2:'全部',-1:'审核中',0:'未通过',1:'已通过'}" name="status"/><br>
			<s:submit value="查询"/>
		</s:form>
	</div>
	<div id="data">
		<ul>
			<li>职位名称&nbsp;简历名称&nbsp;学历&nbsp;工作经验&nbsp;投递日期&nbsp;审核状态&nbsp;操作</li>
			<s:iterator value="myApplication"  id="list" status="status">
				<s:set var="jId" value="#list[0]" />
				<s:set var="pId" value="#list[1]" />
				<s:set var="rId" value="#list[2]" />
				<li>
					<s:a action="PostsAction_previewPosts?sid=%{#pId}" namespace="/"><s:property value="#list[3]"/></s:a>&nbsp;
					<s:a action="ResumeAction_previewResume?sid=%{#rId}" namespace="/"><s:property value="#list[4]"/>&nbsp;<s:property value="#list[5]"/></s:a>&nbsp;
					<s:property value="#list[6]"/>&nbsp;
					<s:property value="#list[7]"/>年&nbsp;
					<s:date name="#list[8]" format="yyyy/MM/dd"/>&nbsp;
					<s:if test="%{#list[9] == 0}">
						未通过
					</s:if><s:elseif test="%{#list[9] == 1}">
						已通过
					</s:elseif><s:else>
						审核中
					</s:else>
					<s:a action="JobApplicationAction_updateStatus?sid=%{#jId}&eid=1" namespace="/">通过</s:a>&nbsp;
					<s:a action="JobApplicationAction_updateStatus?sid=%{#jId}&eid=0" namespace="/">拒绝</s:a>
				</li>
		    </s:iterator>
		</ul>
	</div>
</body>
</html>