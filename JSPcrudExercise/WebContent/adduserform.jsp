<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add User Form</title>
</head>
<body>

<jsp:include page="userform.html"></jsp:include>

</body>
</html>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<%
	String bgColor = "LIGHTBLUE";
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