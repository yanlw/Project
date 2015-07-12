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
	<s:include value="/header.jsp"/>
	<div id="navigation">
		<ul>
			 <li><s:a href="#personalInfo">个人信息</s:a></li>
			 <li><s:a href="#comment">自我评价</s:a></li>
			 <li><s:a href="#jobTarget">求职意向</s:a></li>
			 <li><s:a href="#workExperience">工作经验</s:a></li>
			 <li><s:a href="#educationalBackgrounds">教育背景</s:a></li>
			 <li><s:a href="#languageSkills">语言能力</s:a></li>
			 <li><s:a href="#certificate">证书</s:a></li>
			 <li><s:a href="#photo">照片</s:a></li>
		</ul>
	</div>
	<div id="content">
		<s:form action="ResumeAction_saveOrUpdateResume" namespace="/" method="post">
			<div id="personalInfo">
				<div>个人信息</div>
				<div><s:hidden name="id"/>
					姓名： <s:textfield name="user.name"/><br>
					性别：<s:radio list="#{true:'男',false:'女'}" name="user.sex"/><br>
					出生日期：<s:textfield name="user.birthday"/><br>
					参加工作年份：<s:textfield name="user.workingDate"/><br>
					户口所在地：<s:textfield name="user.hometown"/><br>
					现居地：<s:textfield name="user.currentResidence"/><br>
					联系方式：<s:textfield name="user.telphone"/><br>
					电子邮箱：<s:textfield name="user.email" readonly="true"/><br>
					婚姻状况：<s:radio list="#{0:'未婚',1:'已婚',2:'离异'}" name="user.maritalStatus"/><br>
					国籍：<s:textfield name="user.nationality"/><br>
					证件：<s:select list="#{0:'身份证',1:'护照',2:'军官证',3:'香港身份证',4:'澳门身份证',5:'港澳通行证',6:'台胞证'}" name="user.idType"/><s:textfield name="user.idNumber"/><br>
					海外工作/学习经历：<s:radio list="#{0:'有',1:'无'}" name="user.overseas"/><br>
					政治面貌：<s:radio list="#{0:'中共党员(含预备党员)',1:'团员',2:'群众',3:'民主党派',4:'无党派人士'}" name="user.politicalStatus"/>
				</div>
			</div>
			<div id="comment">
				<div>自我评价</div>
				<div>
					标题： <s:select list="#{1:'自我评价',2:'职业目标'}" name="commentTitle"/><br>
					内容：<s:textarea name="commentContent"/>
				</div>
			</div>
			<div id="jobTarget">
				<div>求职意向</div>
				<div>
					期望工作性质:<s:radio list="#{1:'全职',2:'兼职',3:'实习'}" name="employmenttype"/><br>
					期望从事职业:<s:textfield name="jobtypeF"/><br>
					期望工作地点：<s:textfield name="cacheLocationF"/><br>
					期望月薪(税前)：<s:select list="#{1:'1000元/月以下',2:'1000-2000元/月',3:'2001-4000元/月',4:'4001-6000元/月',5:'6001-8000元/月',6:'8001-10000元/月',7:'10001-15000元/月',8:'15000-25000元/月',9:'25000元/月以上',0:'面议'}" name="desiredSalaryScope"/><br>
					工作状态：<s:select list="#{1:'我目前处于离职状态，可立即上岗',2:'我目前在职，正考虑换个新环境（如有合适的工作机会，到岗时间一个月左右）',3:'我对现有工作还算满意，如有更好的工作机会，我也可以考虑。（到岗时间另议）',4:'目前暂无跳槽打算',5:'应届毕业生'}" name="currentCareerStatus"/>
				</div>
			</div>
			<div id="workExperience">
				<div>工作经验</div>
				<div>
					企业名称： <s:textfield name="cmpanyName"/><br>
					职位名称：<s:textfield name="customSubJobtype"/><br>
					工作时间： <s:textfield name="workStartDate"/>--<s:textfield name="workEndDate"/><br>
					工作描述：<s:textarea name="jobDescription"/><br>
					企业性质：<s:select list="#{1:'国企',2:'外商独资',3:'代表处',4:'合资',5:'民营',6:'股份制企业',7:'上市公司',8:'国家机关',9:'事业单位',10:'其它'}" name="companytype"/>
					企业规模：<s:select list="#{1:'20人以下',2:'20-99人',3:'100-499人',4:'500-999人',5:'1000-9999人',6:'10000人以上'}" name="companySize"/>
				</div>
			</div>
			<div id="educationalBackgrounds">
				<div>教育背景</div>
				<div>
					时间： <s:textfield name="startDate"/><br>
					学校名称： <s:textfield name="schoolName"/><br>
					专业名称： <s:textfield name="mainMajorF"/><br>
					学历/学位：<s:select list="#{1:'初中',2:'中技',3:'高中',4:'中专',5:'大专',6:'本科',7:'硕士',8:'MBA',9:'EMBA',10:'博士',0:'其他'}" name="degree"/>
				</div>
			</div>
			<div id="languageSkills">
				<div>语言能力</div>
				<div>
					外语语种：<s:select list="#{'英语':'英语','日语':'日语','法语':'法语','德语':'德语','俄语':'俄语','韩语':'韩语','西班牙语':'西班牙语','葡萄牙语':'葡萄牙语','阿拉伯语':'阿拉伯语','意大利语':'意大利语',9999:'其他'}" name="languages"/>
					 读写能力：<s:select list="#{'一般':'一般','良好':'良好','熟练':'熟练','精通':'精通'}" name="literacy"/>
					 听说能力：<s:select list="#{'一般':'一般','良好':'良好','熟练':'熟练','精通':'精通'}" name="spoken"/>
				</div>
			</div>
			<div id="certificate">
				<div>证书</div>
				<div>
					证书名称：<s:textfield name="certification"/><br>
					获得时间： <s:textfield name="getDate"/>
				</div>
			</div>
			<div id="photo">
				<div>照片</div>
				<div>
					照片名称：<s:file name="myphoto"/><br>
					<s:if test='%{myphoto != null && myphoto != ""}'>
						<img border="0" src='upload/<s:property value="myphoto"/>'>
					</s:if>
					<s:else>
						<img border="0" src="upload/resume/my_head.jpg">
					</s:else>
				</div>
			</div>
			是否公开：<s:radio list="#{true:'开放',false:'保密' }" name="open"></s:radio>
			<s:submit value="保存"/><s:reset value="重置"/>
		</s:form>
	</div>
</body>
</html>