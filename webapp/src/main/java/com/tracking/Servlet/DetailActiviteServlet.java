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
public class DetailActiviteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public DatabaseClass database   ;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailActiviteServlet() {
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
			System.out.println("detailactivite get");
			
			Document activite = activite_collection.find(eq("_id",new ObjectId(id))).first();
			//System.out.println("activite-----------------------------------------"+activite.toJson());
			ArrayList<JSONObject> positions = new ArrayList<JSONObject>();  
			JSONObject object = null;
			try {
			
				object = new JSONObject(activite.toJson());  
				System.out.println("json sami-----------------------------------------"+object.get("positions"));
				JSONObject jsonObject = (JSONObject) object;               
				JSONArray msg = (JSONArray) jsonObject.get("positions");
				System.out.println("json sami-----------------------------------------"+msg);
				int len = msg.length();
				for (int i=0;i<len;i++){ 
					JSONObject test = (JSONObject) msg.get(i);
					System.out.println("---------------------------------------------------------------------"+test.getString("Latitude"));

					//Position a =new Position(test.getString("Latitude"),test.getString("Longitude"));
					positions.add(test);
				} 
				System.out.println("positions"+positions);

	
			} catch (JSONException e) {
				//some exception handler code.
			}
			

			request.setAttribute("positions", positions);
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/DetailActivite.jsp").forward(request, response);	
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
/**
 ArrayList<String> positions = new ArrayList<String>();  
			JSONObject object = null;
			try {
			
				object = new JSONObject(activite.toJson());  
				System.out.println("json sami-----------------------------------------"+object.get("positions"));
				JSONObject jsonObject = (JSONObject) object;               
				JSONArray msg = (JSONArray) jsonObject.get("positions");
				System.out.println("json sami-----------------------------------------"+msg);
				int len = msg.length();
				for (int i=0;i<len;i++){ 
					System.out.println(msg.get(i).toString());
					positions.add(msg.get(i).toString());
				} 
				System.out.println("positions"+positions);

	
			} catch (JSONException e) {
				//some exception handler code.
			}
 */