<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职位搜索</title>
</head>
<body>
	<s:if test="#session.admin != null">
		<s:include value="/admin/header.jsp"/>
	</s:if><s:else>
		<s:include value="/header.jsp"/>
	</s:else>
	<br>
	<div id="search">
		<s:form action="PostsAction_findMyPostsList" method="post" namespace="/">
			职位名称：<s:textfield name="title"/><br>
			职位类别：<s:textfield name="schJobTypeMask"/><br>
			工作地点：<s:textfield name="cacheLocationF"/><br>
			发布日期：<s:textfield name="lastDate"/><br>
			<s:if test="#session.admin != null">
				<s:select list="#{-1:'审核中',0:'未通过',1:'通过'}" name="approvalStatus"/><br>
				<s:submit value="查询"/>
			</s:if><s:else>
				<s:hidden name="approvalStatus" value="1"/>
				<s:submit value="搜工作"/>
			</s:else>
		</s:form>
	</div>
	<div id="data">
		<ul>
			<s:if test="#session.admin != null">
				<li>职位名称&nbsp;公司名称&nbsp;工作地点&nbsp;招聘人数&nbsp;发布日期&nbsp;操作</li>
			</s:if><s:else>
				<li>职位名称&nbsp;公司名称&nbsp;工作地点&nbsp;招聘人数&nbsp;发布日期</li>
			</s:else>
			<s:iterator value="myPosts">
				<s:set var="sId" value="id" />
				<s:set var="eId" value="enterprise.id" />
				<li>
					<s:a action="PostsAction_previewPosts?sid=%{#sId}" namespace="/"><s:property value="title"/></s:a>&nbsp;
					<s:a action="EnterpriseAction_previewPage?eid=%{#eId}" namespace="/"><s:property value="enterprise.compName"/></s:a>&nbsp;
					<s:property value="cacheLocationF"/>&nbsp;
					<s:property value="jobnum"/>&nbsp;
					<s:date name="lastDate" format="yyyy/MM/dd"/>&nbsp;
					<s:if test="#session.admin != null">
						<s:if test="%{approvalStatus==0}">
							<s:a action="PostsAction_checkPosts?sid=%{#sId}&status=1" namespace="/">通过</s:a>&nbsp;
						</s:if><s:elseif test="%{approvalStatus==1}">
							<s:a action="PostsAction_checkPosts?sid=%{#sId}&status=0" namespace="/">拒绝</s:a>&nbsp;
						</s:elseif><s:else>
							<s:a action="PostsAction_checkPosts?sid=%{#sId}&status=1" namespace="/">通过</s:a>&nbsp;
							<s:a action="PostsAction_checkPosts?sid=%{#sId}&status=0" namespace="/">拒绝</s:a>&nbsp;
						</s:else>
					</s:if>
				</li>
			</s:iterator>
		</ul>
	</div>
</body>
</html>