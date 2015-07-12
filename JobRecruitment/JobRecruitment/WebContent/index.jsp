<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>主页面</title>
		<style>
			*{ margin:0; padding:0; list-style:none;}
			body{ font-size:12px;}
			
			#menu{width:360px; overflow:hidden; margin:100px auto;border:1px solid #BF9660;}
			#menu #nav {display:block;width:100%;padding:0;margin:0;list-style:none;}
			#menu #nav li {float:left;width:120px;}
			#menu #nav li a {display:block;line-height:27px;text-decoration:none;padding:0 0 0 5px; text-align:center; color:#333;}
			#menu_con{ width:358px; height:135px; border-top:none}
			.tag{ padding:10px; overflow:hidden;}
			.selected{background:#C5A069; color:#fff;}
		</style>
	</head>
	<body>
		<s:include value="header.jsp"/>
		<div id="menu">
			<!--tag标题-->
		    <ul id="nav">
		        <li><a href="#" class="selected">个人登录</a></li>
		        <li><a href="#">企业用户</a></li>
		    </ul>
			<!--二级菜单-->
		    <div id="menu_con">
				<div id="userLogin" class="tag">
					<s:if test="#session.user != null">
			    		<div>欢迎回来，<s:property value="#session.user.name"/>
			    			&nbsp;&nbsp;&nbsp;<s:a action="LoginAction_logout?loginType=0" namespace="/">[退出]</s:a><br>
			    			<s:a action="UserAction_toModifyPwPage" namespace="/">[修改密码]</s:a>
			    		</div>
					</s:if><s:else>
						<s:form action="LoginAction_doLogin" namespace="/" method="post">
							<s:hidden name="loginType" value="0"/>
							email:<input type="text" name="email"><s:actionerror/>
							密码：<input type="password" name="password">
							<s:submit value="登录"/><br>
							<input type="button" value="注册找工作" onclick="userClick()">
						</s:form>
					</s:else>
		         </div> 
		        <div class="tag" style="display:none">
		         	<input type="button" value="企业账号登录" onclick="businessClick('login')">
		         	<input type="button" value="免费注册 发布职位" onclick="businessClick('reg')">
		        </div>
			</div>
		</div>
		<script type="text/javascript" src="js/tabs.js"></script>
		<script type="text/javascript">
			tabs.set("nav","menu_con");//执行
			
			/* 跳转到用户注册页面 */
			function userClick(){
				window.location.href = "RegAction_toRegPage.do?regType=0";
			}
			
			/* 跳转到企业注册或登录页面 */
			function businessClick(str){
				if(str == "login"){
					window.location.href = "LoginAction_toLoginPage.do?loginType=1";
				}else{
					window.location.href = "RegAction_toRegPage.do?regType=1";
				}
			}
		</script>
	</body>
</html>