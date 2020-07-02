	<!DOCTYPE html>
	<%@page import="com.Dhavisoft.DAO.TodoDaoImpl"%>
<%@page import="com.Dhavisoft.Model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="zxx" class="no-js">
	<head>
	<link rel="icon" href="d1.png" sizes="16x16 32x32" type="image/png">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		</head>
		<%
HttpSession hs=request.getSession(false);
String uname = (String)hs.getAttribute("un");

%>
		<header>
		<nav class="navbar navbar-expand-sm bg-white navbar-dark">

  <div class="logo">
			<img src="http://www.dhavisoft.com/wp-content/uploads/2020/02/cropped-new-logo-100x124.png">
							</div>
  <a class="navbar-brand" href="http://www.dhavisoft.com" style="color: black;font-style: oblique;font-weight: bolder; padding-left: 5%;"><h1>Dhavisoft</h1></a>
  <div style="padding-left: 60%; font-weight: bolder; color: black;">
  <ul class="navbar-nav" style="align-items: center;">
<% if(uname==null)  {%>

  
    <li class="nav-item">
      <a href="login.jsp"style="color: black;font-weight: bold;">Login</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </li>
    <li class="nav-item">
      <a href="register.jsp"style="color: black;font-weight: bold;">Register</a>
    </li>
    	<%}
			else {
			%>

    <li class="nav-item">
      <a href="<%=request.getContextPath()%>/list" style="color: black;">Todos</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </li>
    <li class="nav-item">
    <a href="<%=request.getContextPath()%>/new" style="color: black;">New&nbsp;&nbsp;Todo</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </li>
     <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" data-toggle="dropdown" style="color: black;">
        More
      </a>
      <div class="dropdown-menu">
     &nbsp;&nbsp;&nbsp; <a href="register.jsp" style="color: black;">profile</a><br>
    &nbsp;&nbsp;&nbsp;  <a href="<%=request.getContextPath()%>/logout" style="color: black;">Logout</a>
      
      </div>
    </li>
   <%} %>
     </ul>
      </div>
</nav>
					
			
</header>
</html>