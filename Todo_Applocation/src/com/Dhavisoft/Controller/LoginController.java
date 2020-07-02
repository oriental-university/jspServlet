package com.Dhavisoft.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dhavisoft.DAO.LoginDao;
import com.Dhavisoft.Model.LoginBean;


/**
 * @author VAIBHAV
 */

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDao loginDao;

	public void init() {
		loginDao = new LoginDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		authenticate(request, response);
	}
	/**
	 * Login Validation
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void authenticate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(username==null||username=="")
			
		{
			request.setAttribute("NOTIFICATION", "USERNAME Must Needed.");
				if(password==null||password=="")
				
			{
				request.setAttribute("NOTIFICATION1", "PASSWORD  Must Needed.");
			      RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			        rd.forward(request, response);
				 
			}
				else { 
					request.setAttribute("password",request.getParameter("password") );
			 RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		        rd.forward(request, response);}
		}
		 
		else   if(password==null||password=="")
				
			{		request.setAttribute("username",request.getParameter("username"));
				request.setAttribute("NOTIFICATION1", "PASSWORD Must Needed.");
			      RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			        rd.forward(request, response);
			}
		
		else
		{
		LoginBean lb = new LoginBean();
	
		lb.setUsername(username);
		lb.setPassword(password);
		
		try {
			if (LoginDao.validate(lb)) {
				System.out.println(lb.getId());
				HttpSession hs=request.getSession();
				hs.setAttribute("un", username);
				System.out.println(username);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/list");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("NOTIFICATION2", "ENTER VALIDATE  USERNAME OR PASSWORD !!!!! ");
				request.setAttribute("NOTIFICATION1", "Invalid PASSWORD  ");
				request.setAttribute("NOTIFICATION", "Invalid USERNAME ");
			    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		        rd.forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
	}
}
