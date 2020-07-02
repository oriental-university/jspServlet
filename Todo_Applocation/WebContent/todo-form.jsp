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
	  <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style type="text/css">
body { background-image: linear-gradient(#aaa 25%, #000);}</style>
</head>

</head>
<body style="background-image: url('https://wallpaperaccess.com/full/796843.png');background-size: 100%;">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container col-md-5" style="padding-top: 5%;">
		<div class="card">
			<div class="card-body">
				<c:if test="${todo != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${todo == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${todo != null}">
            			Edit Todo
            		</c:if>
						<c:if test="${todo == null}">
            			Add New Todo
            		</c:if>
					</h2>
				</caption>

				<c:if test="${todo != null}">
					<input type="hidden" name="id" value="<c:out value='${todo.id}' />" />
					
				</c:if>
				<label style="font-weight: bolder;color: black;font-size: large;">Todo Title</label>
						<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-pen"></i></span>
						</div>
						 <input type="text"
						value="<c:out value='${todo.title}' />" class="form-control"
						name="title" minlength="5" placeholder="Enter Title">
					</div><p style="font-weight: bolder;color: red;">${title}</p>
			

				
					<label style="font-weight: bolder;color: black;font-size: large;">Todo Decription</label>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-edit"></i></span>
						</div>
						<input type="text"
						value="<c:out value='${todo.description}' />" class="form-control"
						name="description" minlength="5" placeholder="Enter Description">
					</div> <p style="font-weight: bolder;color: red;">${description}</p>
			

				
					<label style="font-weight: bolder;color: black;font-size: large;">Todo Status</label>
						<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-clock"></i></span>
						</div>
						<select class="form-control"
						name="isDone">
						<option value="false">In Progress</option>
						<option value="true">Complete</option>
					</select>
					</div>  
			

			
					<label style="font-weight: bolder;color: black;font-size: large;">Todo Target Date</label>
						<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
						</div>
						<input type="date"
						value="<c:out value='${todo.targetDate}' />" class="form-control"
						name="targetDate">
					</div> 
					 <p style="font-weight: bolder;color: red;">${date}</p>
			

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
