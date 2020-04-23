<%@page import="com.dhavisoft.dao.UserDao"%>
<jsp:useBean id="u" class="com.dhavisoft.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i=UserDao.update(u);
response.sendRedirect("viewusers.jsp");
%>