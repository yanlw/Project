<%@page pageEncoding="utf-8" isELIgnored="false" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<header>
	<nav>
		<a href="../alliance/index.do" class="logo" title=""><img src="../images/logo.png" width="170" height="49"></a>
		<ul>
			<c:if test="${member==null}">
				<li><a href="index.do" title="">登录</a></li>
				<li><a href="toRegister.do" title="">注册会员</a></li>
			</c:if>
		</ul>
	</nav>
</header>