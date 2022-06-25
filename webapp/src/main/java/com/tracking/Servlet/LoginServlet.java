package com.tracking.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.DBObject;
import com.tracking.Database.DatabaseClass;

import org.bson.types.ObjectId;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("login get");
		HttpSession session = request.getSession();
		if (session.getAttribute("login") == null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/SignInPage.jsp").forward(request, response);	
		}else {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/homePage.jsp").forward(request, response);	
		}
		
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("login post");
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		System.out.println("login :"+login+ " " +" password:" +password  );	
		DatabaseClass database = new DatabaseClass(); 
		System.out.println("avant");
		DBObject user = database.FindUser(login, password);
		System.out.println(user);
		if (user == null) {
			System.out.println("connexion echoue");
			//request.setAttribute("loginError", "fail");
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/SignInPage.jsp").forward(request, response);

		}else {
			ObjectId idObj = (ObjectId)user.get("_id");

			String id = idObj.toString();
			System.out.println("Connexion reussi");
			HttpSession session = request.getSession();
			session.setAttribute("login", user.get("login"));
			session.setAttribute("id", id);
			session.setMaxInactiveInterval(60*30);
			response.sendRedirect("/webapp/HomeServlet");	
		}

		//this.getServletContext().getRequestDispatcher("/WEB-INF/views/homePage.jsp").forward(request, response);
	
	}
}
