package com.tracking.Servlet;


import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import java.util.ArrayList;

import java.util.List;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;


/**
 * Servlet implementation class AddActivityServlet
 */
public class LancerActiviteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LancerActiviteServlet() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Lancer activite get");
		HttpSession session = request.getSession();
		if (session.getAttribute("login") == null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/SignInPage.jsp").forward(request, response);	
		}else {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/LancerActivitePage.jsp").forward(request, response);	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = "mongodb://127.0.0.1:27017/?gssapiServiceName=mongodb";
		MongoClient mongoClient = MongoClients.create(uri);
		MongoCollection<Document> activite_collection =  mongoClient.getDatabase("tracking").getCollection("Activites");
		MongoCollection<Document> positions_collection =  mongoClient.getDatabase("tracking").getCollection("Postition");
		
		System.out.println("lancer activite post");
		String datedebut = request.getParameter("datedebut");
		String datefin = request.getParameter("datefin");
		String nbrminutes = request.getParameter("nbrminutes");
		String sport = request.getParameter("sport");
		System.out.println(sport);
		String coords = request.getParameter("iteneraire");
		HttpSession session = request.getSession();
		
		
		// get positions
		JSONArray array;
		List<Document> positions = new ArrayList<>();
		try {
			array = new JSONArray(coords);
			for(int i=0; i < array.length(); i++)   
			{  
			JSONObject object = array.getJSONObject(i);   
			positions.add(new Document("Latitude", object.getString("lat")).append("Longitude",object.getString("lng")));
			positions_collection.insertOne(new Document("Latitude", object.getString("lat")).append("Longitude",object.getString("lng")));
			}  
		} catch (JSONException e1) {
			e1.printStackTrace();
		}  
		
		
		// format date
		Date datestart = null;
		try {
			datestart = (new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ")).parse(datedebut.replaceAll("Z$", "+0000"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Date datefinish = null;
		try {
			datefinish = (new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ")).parse(datefin.replaceAll("Z$", "+0000"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
	
		// persist Activity 
		Document activity = new Document("_id", new ObjectId());
		activity.append("datedebut", datestart).append("positions", positions).append("datefin", datefinish)
		.append("nbrminutes", nbrminutes).append("nomactivite", sport).append("iduser",session.getAttribute("id"));
		activite_collection.insertOne(activity);
		
		
		response.sendRedirect("/webapp/HomeServlet");	
	}
	
	/*
	 * 
	 * System.out.println("lancer activite post");
		String datedebut = request.getParameter("datedebut");
		String datefin = request.getParameter("datefin");
		//String nbrminutes = request.getParameter("nbrminutes");
		
		String coords = request.getParameter("iteneraire");
		System.out.println(coords);
		
		JSONArray array;
		Position position =null;
		List<Position> test = new ArrayList<>();
		try {
			array = new JSONArray(coords);
			for(int i=0; i < array.length(); i++)   
			{  
			JSONObject object = array.getJSONObject(i);  
			System.out.println(object.getString("lng"));  
			System.out.println(object.getString("lat"));  
			position= new Position(object.getString("lat"),object.getString("lng"));
			test.add(position);
			System.out.println(position);
			
			}  
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}  
		
		
		
		Date datestart = null;
		try {
			datestart = (new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ")).parse(datedebut.replaceAll("Z$", "+0000"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Date datefinish = null;
		try {
			datefinish = (new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ")).parse(datefin.replaceAll("Z$", "+0000"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(datefinish);
		System.out.println(datedebut);

		
		HttpSession session = request.getSession();
		
		String sport = request.getParameter("sport_list");
		
		DatabaseClass database = new DatabaseClass(); 
		database.CreateActivite(sport, session.getAttribute("id").toString(),datestart,datefinish,test);*/


}
