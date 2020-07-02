<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Todo Management Application</title>
<link rel="icon" href="d1.png" sizes="16x16 32x32" type="image/png">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style type="text/css">
* {
	font-family: Helvetica Neue, Arial, sans-serif;
}

body {
	background-image: linear-gradient(#aaa 25%, #000);
}

h1, table {
	text-align: center;
}

table {
	border-collapse: collapse;
	width: 100%;
	margin: 0 auto 5rem;
}

th, td {
	padding: 2.0rem;
	font-size: 1.5rem;
}

tr {
	background: #F0F8FF;
}

tr, td {
	transition: .4s ease-in;
}

tr:first-child {
	background: #B0E0E6;
}

tr:nth-child(even) {
	background: #E6E6FA;
}

tr:hover:not (#firstrow ), tr:hover td:empty {
	background: #FFFAFA;
	pointer-events: visible;
}
tr
:hover
:not
 
(
#firstrow
 
)
{
transform
:
 
scale
(1
.0
);

	
font-weight
:
 
700;
box-shadow
:
 
0
px
 
3
px
 
7
px
 
rgba
(0
,
0,
0,
0
.5
);


}
</style>
</head>
<body
	style="background-image: url('https://wallpaperaccess.com/full/796843.png'); background-size: 100%;">
	<jsp:include page="header.jsp"></jsp:include>

	<div class="row">


		<div class="container" style="padding-top: 3%;">
			<h3 align="center" style="font-weight: bolder; color: white;">Todo
				List</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					Todo</a>
			</div>
			<br> <br>
			<table id="racetimes">
				<tr id="firstrow">
					<th>Title</th>
					<th>Target Date</th>
					<th>Todo Status</th>
					<th>Actions</th>
				</tr>
						<tr><p style="font-size: xx-large; font-weight: bolder;font-family: monospace; color: red;">${EL}</p></tr>
				<c:forEach var="todo" items="${listTodo}">
					<tr>
						<td><c:out value="${todo.title}" /></td>
						<td><c:out value="${todo.targetDate}" /></td>
						<td><c:out value="${todo.status}" /></td>
						<td><a href="edit?id=<c:out value='${todo.id}' />">Edit</a>
							&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="delete?id=<c:out value='${todo.id}' />">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
