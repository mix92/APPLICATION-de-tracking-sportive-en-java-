<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Navbar</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
        <link type="text/css" rel="stylesheet" href="css/sourcesanspro-font.css" />
		
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
              <div class="navbar-header">          
                <a class="navbar-brand" href="HomeServlet">Tracking</a>
              </div>
              <ul class="nav navbar-nav">
                <li class="active"><a href="AddActivityServlet">Your Activity</a></li>
              </ul>
              <ul class="nav navbar-nav navbar-right">
                <li><a href="LogoutServlet"><span></span> Logout</a></li>
              </ul>
            </div>
          </nav>
          
    </body>