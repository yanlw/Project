<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职位详细</title>
</head>
<body>
	<s:set var="eId" value="enterprise.id" />
	<s:set var="sId" value="id" />
	<s:property value="title"/><br>
	<s:a action="EnterpriseAction_previewPage?eid=%{#eId}" namespace="/"><s:property value="enterprise.compName"/></s:a><br>
	职位月薪：<s:property value="desiredSalaryScope"/>元/月
	工作地点：<s:property value="cacheLocationF"/><br>
	发布时间：<s:date name="lastDate" format="yyyy/MM/dd"/>
	工作性质：<s:property value="employmenttype"/><br>
	工作经验：<s:property value="minYears"/>
	最低学历：<s:property value="degree"/><br>
	招聘人数：<s:property value="jobnum"/>人
	职位类别：<s:property value="schJobTypeMask"/><br>
	职位描述：<s:property value="jobdesc"/><br>
	<s:if test="#session.user != null">
		<s:if test="%{existResume == false}">
			<s:a action="JobApplicationAction_application?sid=%{#sId}&eid=%{#eId}" namespace="/"><input type="button" value="立即申请"/></s:a>
		</s:if><s:else>
			<input type="button" value="立即申请" disabled="disabled"/>
		</s:else>
	</s:if>
</body>
</html>