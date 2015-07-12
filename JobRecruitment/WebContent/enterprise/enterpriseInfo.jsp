<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公司信息</title>
</head>
<body>
	<s:if test="#session.admin != null">
		<s:include value="/admin/header.jsp"/>
	</s:if><s:else>
		<s:include value="header.jsp"/>
	</s:else>
	<s:form action="EnterpriseAction_updateEnterprise" namespace="/" method="post">
		<s:if test="#session.admin != null">
			<s:hidden name="id"/>
			<s:hidden name="licenseImage"/>
			<s:hidden name="userName"/>
			<s:hidden name="password"/>
			<h1>请填写公司信息</h1>
			企业名称：<s:textfield name="compName" /><s:fielderror><s:param>compName</s:param></s:fielderror><br>
			主要行业：<s:textfield name="industry" /><s:fielderror><s:param>industry</s:param></s:fielderror><br>
			公司性质：<s:select list="#{1:'国企',2:'外商独资',3:'代表处',4:'合资',5:'民营',6:'国家机关',7:'股份制企业',8:'上市公司',9:'事业单位',10:'其他' }" name="corptype"/><br>
			企业规模：<s:select list="#{1:'20人以下',2:'20-99人',3:'100-499人',4:'500-999人',5:'1000-9999人',6:'10000人以上'}" name="corpsize"/><br>
			企业地址：<s:textfield name="compAddress"/><s:fielderror><s:param>compAddress</s:param></s:fielderror><br>
			公司邮箱：<s:textfield name="email"/><s:fielderror><s:param>email</s:param></s:fielderror><br>
			公司介绍：<s:textarea name="companyPersin"/><s:fielderror><s:param>companyPersin</s:param></s:fielderror><br>
			联系人：<s:textfield name="contactor"/><s:radio list="#{true:'先生',false:'女士'}" name="sex"/><s:fielderror><s:param>contactor</s:param></s:fielderror><br>
			联系方式：<s:textfield name="phone"/><s:fielderror><s:param>phone</s:param></s:fielderror><br>
			认证状态：<s:select list="#{0:'未认证',1:'已认证'}" name="authenticate"/><br>
			<s:if test="%{authenticate==1}">
			营业执照：<img border="0" src='upload/<s:property value="licenseImage"/>'><br>
			</s:if>
		</s:if><s:else>
			<s:hidden name="id"/>
			<s:hidden name="compName"/>
			<s:hidden name="email"/>
			<s:hidden name="authenticate"/>
			<h1>请填写公司信息，并完成企业认证</h1>
			企业名称：<s:property value="compName"/><br>
			主要行业：<s:textfield name="industry" /><s:fielderror><s:param>industry</s:param></s:fielderror><br>
			公司性质：<s:select list="#{1:'国企',2:'外商独资',3:'代表处',4:'合资',5:'民营',6:'国家机关',7:'股份制企业',8:'上市公司',9:'事业单位',10:'其他' }" name="corptype"/><br>
			企业规模：<s:select list="#{1:'20人以下',2:'20-99人',3:'100-499人',4:'500-999人',5:'1000-9999人',6:'10000人以上'}" name="corpsize"/><br>
			企业地址：<s:textfield name="compAddress"/><s:fielderror><s:param>compAddress</s:param></s:fielderror><br>
			公司邮箱：<s:property value="email"/><br>
			公司介绍：<s:textarea name="companyPersin"/><s:fielderror><s:param>companyPersin</s:param></s:fielderror><br>
			联系人：<s:textfield name="contactor"/><s:radio list="#{true:'先生',false:'女士'}" name="sex"/><s:fielderror><s:param>contactor</s:param></s:fielderror><br>
			联系方式：<s:textfield name="phone"/><s:fielderror><s:param>phone</s:param></s:fielderror><br>
			<h1>企业认证</h1>
			<s:if test="%{authenticate==1}">
			认证状态：已认证
			</s:if><s:else>
			认证状态：未认证<br>
			上传营业执照:<s:file name="licenseImage" value="上传"/><s:fielderror><s:param>licenseImage</s:param></s:fielderror>
			</s:else>
			<br>
		</s:else>
		<s:submit value="保存"/>
	</s:form>
</body>
</html>