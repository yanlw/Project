<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公司信息一览</title>
</head>
<body>
	<s:if test="#session.admin != null">
		<s:include value="/admin/header.jsp"/>
	</s:if><s:elseif test="#session.enterprise != null">
		<s:include value="header.jsp"/>
	</s:elseif><s:else>
		<s:include value="/header.jsp"/>
	</s:else><br>
	企业名称：<s:property value="compName"/><br>
	主要行业：<s:property value="industry" /><br>
	公司性质：<s:property value="corptype"/><br>
	企业规模：<s:property value="corpsize"/><br>
	公司介绍：<s:property value="companyPersin"/><br>
	企业地址：<s:property value="compAddress"/><br>
	<s:if test="#session.admin != null">
	营业执照：<img border="0" src='upload/<s:property value="licenseImage"/>'>
	</s:if>
</body>
</html>