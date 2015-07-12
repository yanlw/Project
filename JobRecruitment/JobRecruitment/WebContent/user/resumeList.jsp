<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>简历中心</title>
</head>
<body>
	<s:include value="/header.jsp"/><br>
	<s:a action="ResumeAction_toResumePage">创建简历</s:a>
	<ul>
		<s:iterator value="myResumes">
			<s:set var="sId" value="id" />
			<li><s:property value="jobtypeF"/>&nbsp;
				<s:property value="cacheLocationF"/>&nbsp;
				<s:a action="ResumeAction_previewResume?sid=%{#sId}" namespace="/" target="_blank">预览</s:a>&nbsp;
				<s:a action="ResumeAction_editResumes?sid=%{#sId}" namespace="/" >修改</s:a>
				<s:a action="ResumeAction_delResumes?sid=%{#sId}" namespace="/" >删除</s:a>
			</li>
		</s:iterator>
	</ul>
</body>
</html>