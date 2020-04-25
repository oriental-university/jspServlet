<%@page import="com.dhavisoft.dao.UserDao"%>
<jsp:useBean id="u" class="com.dhavisoft.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u" />

<%
	UserDao.delete(u);
	//response.sendRedirect("viewusers.jsp");
	response.sendRedirect("deleteuser-success.jsp");
	
%>
