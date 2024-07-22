<%@ page import="com.offcn.entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//获取登录用户信息
	User user = (User)session.getAttribute("user");
	//判断用户信息是否为空，如果为空表示未登录，跳转到页面先登录
	if(user == null){
		response.sendRedirect("login.jsp");
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录控制</title>
</head>
<body>

</body>
</html>