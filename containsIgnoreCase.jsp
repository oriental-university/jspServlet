<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<html>  
<head>  
<title>Using JSTL Functions</title>  
</head>  
<body>  
  
<c:set var="String" value="Welcome to Dhavisoft Technologies"/>  
  
<c:if test="${fn:containsIgnoreCase(String, 'dhavisoft')}">  
   <p>Found dhavisoft string<p>  
</c:if>  
  
<c:if test="${fn:containsIgnoreCase(String, 'DHAVISOFT')}">  
   <p>Found DHAVISOFT string<p>  
</c:if>  
  
</body>  
</html>  