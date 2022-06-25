package com.tracking.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.DBObject;
import com.tracking.Database.DatabaseClass;

/**
 * Servlet implementation class HomeServelet
 */
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public DatabaseClass database   ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
         this.database= new DatabaseClass(); 
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("login") == null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/SignInPage.jsp").forward(request, response);	
		}else {
			System.out.println("homepage get");
			List<DBObject> activites = this.database.FindActivities(session.getAttribute("id").toString());
			request.setAttribute("activites", activites);
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/homePage.jsp").forward(request, response);	
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
