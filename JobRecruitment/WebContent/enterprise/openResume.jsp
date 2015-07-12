<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>简历搜索</title>
</head>
<body>
	<s:include value="header.jsp"/><br>
	<div id="search">
		<s:form action="ResumeAction_findOpenResumes" method="post" namespace="/">
			关键词：<s:textfield name="jobtypeF"/><br>
			职位名称：<s:textfield name="customSubJobtype"/><br>
			期望工作地区：<s:textfield name="cacheLocationF"/><br>
			学历：<s:select list="#{0:'不限',1:'初中',2:'中技',3:'高中',4:'中专',5:'大专',6:'本科',7:'硕士',8:'MBA',9:'EMBA',10:'博士'}" name="degree"/><br>
			更新日期：<s:textfield name="lastDate"/><br>
			<s:submit value="人才搜索"/>
		</s:form>
	</div>
	<div id="data">
		<ul>
			<li>简历名称&nbsp; 职位名称&nbsp; 学历&nbsp;工作经验&nbsp;期望工作地区&nbsp;期望月薪&nbsp;更新时间</li>
			<s:iterator value="myResumes">
				<s:set var="sId" value="id" />
				<li><s:a action="ResumeAction_previewResume?sid=%{#sId}" namespace="/" target="_blank">
						<s:property value="jobtypeF"/><s:property value="cacheLocationF"/>
					</s:a>&nbsp;
					<s:property value="customSubJobtype"/>&nbsp;
					<s:property value="degree"/>&nbsp;
					<s:property value="year"/>年&nbsp;
					<s:property value="cacheLocationF"/>&nbsp;
					<s:property value="desiredSalaryScope"/>&nbsp;
					<s:property value="lastDate"/>&nbsp;
				</li>
			</s:iterator>
		</ul>
	</div>
</body>
</html>