<%@page import="com.Dhavisoft.DAO.TodoDaoImpl"%>
<%@page import="com.Dhavisoft.Model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="d1.png" sizes="16x16 32x32" type="image/png">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<style type="text/css">
body {
    font-family: "Lato", sans-serif; 
}
.main-head{
    height: 150px;
    background: #FFF;
   
}

@media screen and (min-width: 768px){
    .main{
        margin-left: 40%; 
    }

   
    .login-form{
        margin-top: 10%;
    }

}

.login-main-text{
    margin-top: 20%;
    padding: 60px;
    color: #fff;
}

.login-main-text h2{
    font-weight: 300;
}

.btn-black{
    background-color: #000 !important;
    color: #fff;
}
</style>
</head><body style="background-image: url('https://wallpaperaccess.com/full/796843.png');
background-repeat: no-repeat; background-size: 100%;">
<%
HttpSession hs=request.getSession(false);
String username = (String)hs.getAttribute("un");
System.out.println(username);

%>
<jsp:include page="header.jsp"></jsp:include>

      <div class="main" style="font-weight: bolder;color: black;">
         <div class="col-md-6 col-sm-12">
           
            <div class="login-form">
            <div class=card>
            <div class="card-body">
            <% if(username==null)  {%>
          
             <h1 style="font-weight: bolder;text-transform: uppercase;">Registration Form</h1>
             <form id="login-form" class="form" action="<%=request.getContextPath()%>/register" method="post">
              <label>First Name*</label>
             <div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input name="firstName" type="text"  class="form-control" value="${firstname}" placeholder="First Name">
					</div>
					<p style="color: red;">${NOTIFICATION}</p>
            <label>Last Name*</label>
                <div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						 <input type="text" name="lastName" class="form-control" value="${lastname}" placeholder="Last Name">
					</div>
					<p style="color: red;">${NOTIFICATION1}</p>
                  <label>User Name*</label>
                   <div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="username" value="${username}" placeholder="User Name">
                    
					</div>
					   <p style="color: red;">${NOTIFICATION2}${Username}</p>
                 
                 
                     <label>Password*</label>
                         <div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-lock"></i></span>
						</div>
						<input type="password" class="form-control" name="password" value="${password}"  placeholder="Password">
					</div>
					<p style="color: red;">${NOTIFICATION3}</p>
                     
               
                  <button type="submit" class="btn btn-secondary" style="font-weight: bolder; color: white;">Register</button>
                  <button class="btn btn-black"><a href="login.jsp" style="color: white;">Login</a></button>
                
               </form>
            </div>
            </div>
            </div>
         </div>
      </div>
       <jsp:include page="footer.jsp"></jsp:include>
             <%}
             else {
            	 User us=TodoDaoImpl.UserByName(username);
             %>
             <div class=card>
            <div class="card-body">
              <h1 style="font-weight: bolder;text-transform: uppercase;">User Profile</h1>
             
             <label>First Name</label>
             <div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input name="firstName" type="text"  class="form-control" value="<%=us.getFirstName()%>" disabled="disabled">
					</div>
            <label>Last Name</label>
                <div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						 <input type="text" name="lastName" class="form-control" value="<%=us.getLastName() %>" disabled="disabled">
					</div>
					
                  <label>User Name</label>
                   <div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="username" value=" <%=us.getUsername()%>" disabled="disabled">
                    
					</div>
					  
                 
                 
                     <label>Password</label>
                         <div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-lock"></i></span>
						</div>
						<input type="text" class="form-control" name="password" value="<%=us.getPassword()%>"disabled="disabled">
					</div>
					</div>
					</div>
					
				
                     
             <%} %>
             
     
</body>
</html>