<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Format-tag</title>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<title>fmt:message Tag</title>
</head>
<body>
	<fmt:setBundle basename="com.javatpoint.Message" var="lang" />
	<fmt:message key="vegetable.Potato" bundle="${lang}" />
	<br />
	<fmt:message key="vegetable.Tomato" bundle="${lang}" />
	<br />
	<fmt:message key="vegetable.Carrot" bundle="${lang}" />
	<br />
</body>
</body>
</html>