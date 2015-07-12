<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户修改</title>
</head>
<body>
	<s:include value="header.jsp"/>
	<div id="userInfo">
		<s:form action="UserAction_updateUser" namespace="/" method="post">
			<s:hidden name="id"/>
			<s:hidden name="password"/>
			姓名： <s:textfield name="name"/><br>
			性别：<s:radio list="#{true:'男',false:'女'}" name="sex"/><br>
			出生日期：<s:textfield name="birthday"/><br>
			参加工作年份：<s:textfield name="workingDate"/><br>
			户口所在地：<s:textfield name="hometown"/><br>
			现居地：<s:textfield name="currentResidence"/><br>
			联系方式：<s:textfield name="telphone"/><br>
			电子邮箱：<s:textfield name="email"/><br>
			婚姻状况：<s:radio list="#{0:'未婚',1:'已婚',2:'离异'}" name="maritalStatus"/><br>
			国籍：<s:textfield name="nationality"/><br>
			证件：<s:select list="#{0:'身份证',1:'护照',2:'军官证',3:'香港身份证',4:'澳门身份证',5:'港澳通行证',6:'台胞证'}" name="idType"/><s:textfield name="idNumber"/><br>
			海外工作/学习经历：<s:radio list="#{0:'有',1:'无'}" name="overseas"/><br>
			政治面貌：<s:radio list="#{0:'中共党员(含预备党员)',1:'团员',2:'群众',3:'民主党派',4:'无党派人士'}" name="politicalStatus"/><br>
			<s:submit value="修改"/>&nbsp;
			<s:a href="javascript:history.go(-1)"><input type="button" value="返回" /></s:a>
		</s:form>
	</div>
</body>
</html>