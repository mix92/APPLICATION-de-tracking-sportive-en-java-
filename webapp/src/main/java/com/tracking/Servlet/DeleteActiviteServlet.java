package com.tracking.Servlet;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.DBObject;
import com.tracking.Database.DatabaseClass;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;

import static com.mongodb.client.model.Filters.*;
import static com.mongodb.client.model.Projections.*;
import static com.mongodb.client.model.Sorts.descending;

import org.bson.types.ObjectId;

import com.tracking.Model.Position;

/**
 * Servlet implementation class DetailActiviteServlet
 */
public class DeleteActiviteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public DatabaseClass database   ;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteActiviteServlet() {
        super();
        this.database= new DatabaseClass(); 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uri = "mongodb://127.0.0.1:27017/?gssapiServiceName=mongodb";
		MongoClient mongoClient = MongoClients.create(uri);
		MongoCollection<Document> activite_collection =  mongoClient.getDatabase("tracking").getCollection("Activites");

		String id = request.getParameter("id");
		HttpSession session = request.getSession();

		if (session.getAttribute("login") == null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/SignInPage.jsp").forward(request, response);	
		}else {
			System.out.println("deleteactivite get");
			
		//	Document activite = activite_collection.remove({"_id": new ObjectId(id) }).first();
		activite_collection.deleteOne(new Document("_id", new ObjectId(id)));
			
			
			response.sendRedirect("/webapp/HomeServlet");	
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}