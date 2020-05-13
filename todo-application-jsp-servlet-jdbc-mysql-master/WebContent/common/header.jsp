<style>
.header {
	position: fixed;
	bottom: 0;
	width: 100%;
	height: 40px;
	background-color: lightblue;
}
</style>
<header>
	<nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: lightblue">
		<div class="container">
			<img
				src="file:///F:/java%20program/todo-application-jsp-servlet-jdbc-mysql-master/todo-application-jsp-servlet-jdbc-mysql-master/favicon.ico"
				alt="Cinque Terre" width="50" height="50">
			<div class="topleft">
				<a href="https://www.dhavisoft.com" class="navbar-brand">
					Dhavisoft-Todo App</a>
			</div>
		</div>
<ul class="navbar-nav navbar-collapse justify-content-end">
			<li><a href="<%=request.getContextPath()%>/login"
				class="nav-link">Login</a></li>
			<li><a href="<%=request.getContextPath()%>/register"
				class="nav-link">Signup</a></li>
		</ul>
	</nav>
</header>