package com.Dhavisoft.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dhavisoft.DAO.UserDao;
import com.Dhavisoft.Model.User;

/**
 * @author VAIBHAV
 */

@WebServlet("/register")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			doGet(request, response);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			register(request,response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	
	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, ClassNotFoundException {
		int j=0;
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
	while(j<1)
	{
		if(firstName==null||firstName=="")
		{
			request.setAttribute("NOTIFICATION", "First Name Must Needed ");
		}
		else request.setAttribute("firstname", request.getParameter("firstName"));
		
		if(lastName==null||lastName=="")
		{	
			request.setAttribute("NOTIFICATION1", "Last Name Must Needed ");
		}
		else request.setAttribute("lastname", request.getParameter("lastName"));
		if(username==null||username=="")
		{	
			request.setAttribute("NOTIFICATION2", "USERNAME Must Needed");
		}
		else request.setAttribute("username", request.getParameter("username"));
		if(password==null||password=="")
		{
			request.setAttribute("NOTIFICATION3", "PASSWORD Must Needed");
		}
		else request.setAttribute("password", request.getParameter("password"));
		
		if(firstName==null||firstName==""||lastName==null||lastName==""||username==null||username==""||password==null||password=="")
				{j=j+1;
			 RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		        rd.forward(request, response);
		        
				}
		else
		{	j=j+1;
			if(UserDao.CheckUsername(username))
		{request.setAttribute("firstname", request.getParameter("firstName"));
		request.setAttribute("lastname", request.getParameter("lastName"));
		request.setAttribute("password", request.getParameter("password"));
			request.setAttribute("Username", "Username Already Taken!! ");
			 
			 RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		        rd.forward(request, response);
		}
		else {	
			HttpSession hs=request.getSession();
			hs.setAttribute("un", username);

		User employee = new User();
		employee.setFirstName(firstName);
		employee.setLastName(lastName);
		employee.setUsername(username);
		employee.setPassword(password);
		int i=UserDao.registerEmployee(employee);
		if(i>0)
		{

		RequestDispatcher dispatcher = request.getRequestDispatcher("todo-form.jsp");
		dispatcher.forward(request, response);
		}
		else
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
		}
		}
	}
		
	}
		
		
			

	
	}
}
