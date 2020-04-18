<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dhavisoft.mvcexample.LoginBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>You are successfully logged in!</p>
<%
LoginBean p=(LoginBean)request.getAttribute("bean");
out.println("Welcome :"+p.getName());
%>
</body>
</html>