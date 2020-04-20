<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
<title>Using JSTL Functions</title>
</head>
<body>

	<c:set var="str1" value="Welcome to JSP        programming         " />
	<p>String-1 Length is : ${fn:length(str1)}</p>

	<c:set var="str2" value="${fn:trim(str1)}" />
	<p>String-2 Length is : ${fn:length(str2)}</p>
	<p>Final value of string is : ${str2}</p>

</body>

</body>
</html>