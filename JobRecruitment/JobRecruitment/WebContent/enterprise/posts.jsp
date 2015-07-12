<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的职位</title>
</head>
<body>
	<s:include value="header.jsp"/><br>
	<s:form action="PostsAction_saveOrUpdatePosts" method="post" namespace="/">
		<s:hidden name="id"/>
		职位名称：<s:textfield name="title"/><br>
		职位类别：<s:textfield name="schJobTypeMask"/><br>
		职位描述：<s:textarea name="jobdesc"/><br>
		工作地点：<s:textfield name="cacheLocationF"/><br>
		工作经验：<s:select list="#{-1:'不限',0:'无经验',1:'1年以下',2:'1-3年',3:'3-5年',4:'5-10年',5:'10年以上' }" name="minYears"/><br>
		学历要求：<s:select list="#{0:'其他',1:'初中',2:'中技',3:'高中',4:'中专',5:'大专',6:'本科',7:'硕士',8:'MBA',9:'EMBA',10:'博士'}" name="degree"/><br>
		工作性质：<s:radio list="#{1:'全职',2:'兼职',3:'实习'}" name="employmenttype"/><br>
		招聘人数 ：<s:textfield name="jobnum"/><br>
		职位月薪：<s:select list="#{0:'面议',1:'1000元/月以下',2:'1000-2000元/月',3:'2001-4000元/月',4:'4001-6000元/月',5:'6001-8000元/月',6:'8001-10000元/月',7:'10001-15000元/月',8:'15000-25000元/月',9:'25000元/月以上'}" name="desiredSalaryScope"/><br>
		<s:submit value="保存"/>
	</s:form>
</body>
</html>