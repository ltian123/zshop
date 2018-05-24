<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#username").blur(function(){
					$.getJSON("${pageContext.request.contextPath}/user/validateUsername",
							  {"username":$(this).val()},
							  function(ajaxResult){
							  	$("#usernameMessage").text(ajaxResult.data);
							  	if(ajaxResult.status=="success"){
							  		$("#usernameMessage").css("color","green");
							  		return;
							  	}
							  	$("#usernameMessage").css("color","red");
							  	
							  });
				});
			});
		</script>
	</head>
	<body>
		<h1>用户注册</h1>
		<hr/>
		<form action="${pageContext.request.contextPath }/user/regist" method="post">
			用户名：<input type="text" name="username" id="username"/><span id="usernameMessage"></span><br/>
			密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"/><br/>
			电&nbsp;&nbsp;&nbsp;话：<input type="text" name="phone"/><br/>
			<input type="submit" value="注册"/>
		</form>
		${e.message }
	</body>
</html>
