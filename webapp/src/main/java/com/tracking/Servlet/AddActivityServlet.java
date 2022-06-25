package com.tracking.Servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tracking.Database.DatabaseClass;

/**
 * Servlet implementation class AddActivityServlet
 */
public class AddActivityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddActivityServlet() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ajout nouvelle activite get");
		HttpSession session = request.getSession();
		if (session.getAttribute("login") == null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/SignInPage.jsp").forward(request, response);	
		}else {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/NewActivityPage.jsp").forward(request, response);	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//String date = request.getParameter("date");
		//String time_debut = request.getParameter("heure_debut");
		//String time_fin = request.getParameter("heure_fin");
		String sport = request.getParameter("sport_list");
		//System.out.println("date "+date+ " heure debut :"+time_debut+" heure fin: "+time_fin +" sport :"+sport);
		Date date = new Date();
		DatabaseClass database = new DatabaseClass(); 
		database.CreateActivite(sport, session.getAttribute("id").toString(),date);
	}

}
