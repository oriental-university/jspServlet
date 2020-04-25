<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add User Success</title>
</head>
<body>

<p>Record successfully saved!</p>
<jsp:include page="userform.html"></jsp:include>

</body>
</html>
<HTML>
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