package com.dhavisoft.mvcexample;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletController extends HttpServlet {
	protected void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String n1=request.getParameter("user");
		String n2=request.getParameter("password");
		LoginBean lb=new LoginBean();
		lb.setName(n1);
		lb.setPassword(n2);
		request.setAttribute("bean",lb);
		boolean status=lb.validate();
		if(status) {
			RequestDispatcher rd=request.getRequestDispatcher("LoginView.jsp");
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("ErrorView.jsp");
			rd.forward(request, response);
	}
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
