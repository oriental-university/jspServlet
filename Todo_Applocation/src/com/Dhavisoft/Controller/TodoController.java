package com.Dhavisoft.Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hamcrest.core.IsEqual;
import org.hamcrest.core.IsNull;

import com.Dhavisoft.DAO.TodoDao;
import com.Dhavisoft.DAO.TodoDaoImpl;
import com.Dhavisoft.Model.Todo;


/*
 * @author VAIBHAV
 */

@WebServlet("/")
public class TodoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TodoDao todoDAO;

	public void init() {
		todoDAO = new TodoDaoImpl();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		HttpSession hs=request.getSession(false);
		if(hs.getAttribute("un")==null) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		else {
		
		String action = request.getServletPath();
		
		try {
			switch (action) {
			case "/new":
				
				showNewForm(request, response);
				break;
			case "/insert":
				insertTodo(request, response);
				break;
			case "/delete":
				deleteTodo(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateTodo(request, response);
				break;
			case "/list":
				listTodo(request, response);
				break;
			
			default:
			
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
		}
	}

	private void listTodo(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		List<Todo> listTodo = todoDAO.selectAllTodos();
		request.setAttribute("listTodo", listTodo);
		if(listTodo.isEmpty())
		{
			request.setAttribute("EL", "Todo List Is Empty!!!");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("todo-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("todo-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Todo existingTodo = todoDAO.selectTodo(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("todo-form.jsp");
		request.setAttribute("todo", existingTodo);
		dispatcher.forward(request, response);

	}

	private void insertTodo(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		int j=0;
		String title = request.getParameter("title");
		HttpSession hs=request.getSession(false);
		String username = (String)hs.getAttribute("un");
		String description = request.getParameter("description");
		boolean isDone = Boolean.valueOf(request.getParameter("isDone"));
		LocalDate date=LocalDate.now();
		while(j<1)
		{
			if(title==null||title==""||username==null||username==""||description==null||description==""||date==null) {
				request.setAttribute("title", "Title Requiried");
				request.setAttribute("description", "Description Requiried");
				request.setAttribute("date", "Date Requiried");
			}
			else
			{
				request.setAttribute("title", title);
				request.setAttribute("description", description);
				request.setAttribute("date", date);
			}
			if(title==null||title==""||username==null||username==""||description==null||description==""||date==null)
			{	j++;
				RequestDispatcher dispatcher = request.getRequestDispatcher("/new");
				dispatcher.forward(request, response);
			}
			else
			{
				j++;
				Todo newTodo = new Todo(title, username, description, date, isDone);
				todoDAO.insertTodo(newTodo);
				response.sendRedirect("list");
			}
			
		}
		
	}

	private void updateTodo(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		int j=0;
		String title = request.getParameter("title");
		HttpSession hs=request.getSession(false);
		String username = (String)hs.getAttribute("un");
		System.out.println(username);
		String description = request.getParameter("description");
		//DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-mm-dd");
		LocalDate targetDate = LocalDate.parse(request.getParameter("targetDate"));
		
		boolean isDone = Boolean.valueOf(request.getParameter("isDone"));
		while(j==0)
		{
			if(title==null||title==""||username==null||username==""||description==null||description==""||targetDate==null) {
				request.setAttribute("title", "Title Requiried");
				request.setAttribute("description", "Description Requiried");
				request.setAttribute("date", "Date Requiried");
			}
			else
			{
				request.setAttribute("title", title);
				request.setAttribute("description", description);
				request.setAttribute("date", targetDate);
			}
			if(title==null||title==""||username==null||username==""||description==null||description==""||targetDate==null)
			{	j++;
				RequestDispatcher dispatcher = request.getRequestDispatcher("/edit");
				dispatcher.forward(request, response);
			}
			else
			{
				j++;
				Todo updateTodo = new Todo(id, title, username, description, targetDate, isDone);
				
				todoDAO.updateTodo(updateTodo);
				
				response.sendRedirect("list");
			}
			
		}
		
	}

	private void deleteTodo(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		todoDAO.deleteTodo(id);
		response.sendRedirect("list");
	}
	
}
