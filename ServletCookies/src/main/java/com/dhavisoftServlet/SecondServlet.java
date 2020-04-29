package com.dhavisoftServlet;

import java.io.*;
import javax.servlet.http.*;

public class SecondServlet extends HttpServlet {

	/**
		 * 
		 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {

			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			Cookie ck[] = request.getCookies();
			out.print("Hello "+ck[0].getValue());

			out.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
