<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业信息列表</title>
</head>
<body>
	<s:include value="header.jsp"/>
	<br><br><br>
	<div id="search">
		<s:form action="EnterpriseAction_findEnterpriseList" namespace="/" method="post">
			公司名称:<s:textfield name="compName"/>&nbsp;
			认证状态：<s:select list="#{-1:'全部',0:'未认证',1:'已认证'}" name="authenticate"/>&nbsp;
			<s:submit value="查询"/>
		</s:form>
	</div>
	<div id="enterpriseList">
		<ul>
		<li>公司名&nbsp;邮箱&nbsp;联系人&nbsp;状态&nbsp;注册时间 &nbsp;操作</li>
		<s:iterator value="enterpriseList">
			<s:set var="eId" value="id" />
			<li>
				<s:property value="compName"/>&nbsp;
				<s:property value="email"/>&nbsp;
				<s:property value="contactor"/>&nbsp;
				<s:if test="%{authenticate==1}">
					已认证
				</s:if><s:else>
					未认证
				</s:else>
				<s:date name="regDate" format="yyyy/MM/dd"/>&nbsp;
				<s:a action="EnterpriseAction_toEnterprisePage?eid=%{#eId}" namespace="/" >修改</s:a>
				<s:a action="EnterpriseAction_delEnterprise?eid=%{#eId}" namespace="/" >删除</s:a>
			</li>
		</s:iterator>
	</ul>
	</div>
</body>
</html>