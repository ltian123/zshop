<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	</head>
	<body>
		<h1>用户登录</h1>
		<hr/>
		<form action="${pageContext.request.contextPath }/user/login" method="post">
			用户名：<input type="text" name="username"/><br/>
			密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"/><br/>
			<input type="submit" value="登录"/>
		</form>
		${e.message }
	</body>
</html>
