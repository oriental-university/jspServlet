<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="d1.png" sizes="16x16 32x32" type="image/png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
</head>
<title>Login</title>

<style type="text/css">
body {
	font-family: "Lato", sans-serif;
}

.main-head {
	height: 150px;
	background: #FFF;
}

.main {
	padding: 0px 10px;
}


@media screen and (min-width: 768px) {
	.main {
		margin-left: 40%;
	}
	.login-form {
		margin-top: 40%;
	}
	.register-form {
		margin-top: 20%;
	}
}

.login-main-text {
	margin-top: 20%;
	padding: 60px;
	color: #fff;
}

.login-main-text h2 {
	font-weight: 300;
}

.btn-black {
	background-color: #000 !important;
	color: #fff;
}
</style>

</head>
<body style="background-image: url('https://wallpaperaccess.com/full/796843.png');
background-repeat: no-repeat; background-size: 100%;">
	<jsp:include page="header.jsp"></jsp:include>

	<div class="main"style="font-weight: bolder;color:black;">
		<div class="col-md-6 col-sm-12">
			<div class="login-form">
			<div class="card">
			<div class="card-body">
			 <h1 style="font-weight: bolder;text-transform: uppercase; color: black;">Login Form</h1>
				<h3 style="color: red;font-size: medium;">${NOTIFICATION2}</h3>
				<form name="login" class="form"
					action="<%=request.getContextPath()%>/login" method="post">
					User Name*
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="username"
							value="${username}" placeholder="User Name">
					</div>
					<p style="color: red;">${NOTIFICATION}</p>
					
					Password*
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-lock"></i></span>
						</div>
						<input type="password" class="form-control" name="password"
							value="${password}" placeholder="Password">
						
					</div>
					<p style="color: red;">${NOTIFICATION1}</p>
					
					<button type="submit" class="btn btn-secondary"
						style="font-weight: bolder; color: white;">Login</button>

					<button class="btn btn-black">
						<a href="register.jsp" style="color: white;">Register</a>
					</button>
					
				</form>
				</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>