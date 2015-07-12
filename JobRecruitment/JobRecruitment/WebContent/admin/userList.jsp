<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
</head>
<body>
	<s:include value="header.jsp"/>
	<br><br><br>
	<div id="search">
		<s:form action="UserAction_findUserList" namespace="/" method="post">
			<s:textfield name="name"/>&nbsp;
			<s:submit value="查询"/>
		</s:form>
	</div>
	<div id="userList">
		<ul>
		<li>姓名&nbsp;性别&nbsp;生日&nbsp;邮箱&nbsp;工作时间&nbsp;注册时间</li>
		<s:iterator value="userList">
			<s:set var="sId" value="id" />
			<li><s:property value="name"/>&nbsp;
				<s:if test="%{sex == false}">
					女
				</s:if><s:else>
					男
				</s:else>&nbsp;
				<s:date name="birthday" format="yyyy/MM/dd"/>&nbsp;
				<s:property value="email"/>&nbsp;
				<s:date name="workingDate" format="yyyy/MM/dd"/>&nbsp;
				<s:date name="regDate" format="yyyy/MM/dd"/>&nbsp;
				<s:a action="UserAction_editUser?sid=%{#sId}" namespace="/" >修改</s:a>
				<s:a action="UserAction_delUser?sid=%{#sId}" namespace="/" >删除</s:a>
			</li>
		</s:iterator>
	</ul>
	</div>
</body>
</html>