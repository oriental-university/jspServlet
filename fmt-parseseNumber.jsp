<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<title>fmt:parseNumber tag</title>
</head>
<body>
	<h3>The fmt:parseNumber tag Example is:</h3>

	<c:set var="Amount" value="786.970" />

	<fmt:parseNumber var="j" type="number" value="${Amount}" />
	<p>
		<i>Amount is:</i>
		<c:out value="${j}" />
	</p>

	<fmt:parseNumber var="j" integerOnly="true" type="number"
		value="${Amount}" />
	<p>
		<i>Amount is:</i>
		<c:out value="${j}" />
	</p>
</body>

</html>