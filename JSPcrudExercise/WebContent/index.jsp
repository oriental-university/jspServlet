<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<a href="adduserform.jsp"> Add User</a>
	<br>
	<a href="viewusers.jsp">View Users</a>
</body>
</html>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<%
	String bgColor = "LIGHTYellow";
	String myColor = request.getParameter("color");

	if (myColor != null) {
		myColor = myColor;
	} else {
		myColor = bgColor;
	}
%>
<BODY BGCOLOR="<%=myColor%>">

</BODY>
</HTML>