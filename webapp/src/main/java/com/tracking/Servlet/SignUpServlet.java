package com.tracking.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tracking.Database.DatabaseClass;

/**
 * Servlet implementation class SignUpServlet
 */
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Sign Up get");
		this.getServletContext().getRequestDispatcher("/WEB-INF/views/SignUpPage.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirm_password = request.getParameter("confirm_password");
		
		System.out.println(" login : "+login +"    email: " +email+ "   password:  " +password +"    re-password:     " +confirm_password);
		
		DatabaseClass database = new DatabaseClass(); 
		
		
		if( password.equals(confirm_password)) {
			database.CreateUser(login, email, password);
			response.sendRedirect("/webapp/LoginServlet");	
		}
		else {
			response.sendRedirect("/webapp/SignUpServlet");	
		}

	}

}
