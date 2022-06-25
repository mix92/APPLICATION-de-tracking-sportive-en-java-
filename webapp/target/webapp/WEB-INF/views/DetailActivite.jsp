<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="org.bson.BSONObject "%>
<%@page import="org.json.JSONObject"%>

<!DOCTYPE html>
<meta charset="ISO-8859-1">
<title>Maps</title>
<html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Tracking</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="images/logo_small_icon_only_inverted.png">
        <link rel="shortcut icon" href="images/logo_small_icon_only.png">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
        <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
        <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />

    <style>
        #weatherWidget .currentDesc {
            color: #ffffff!important;
        }
            .traffic-chart {
                min-height: 335px;
            }
            #flotPie1  {
                height: 150px;
            }
            #flotPie1 td {
                padding:3px;
            }
            #flotPie1 table {
                top: 20px!important;
                right: -10px!important;
            }
            .chart-container {
                display: table;
                min-width: 270px ;
                text-align: left;
                padding-top: 10px;
                padding-bottom: 10px;
            }
            #flotLine5  {
                height: 105px;
            }

            #flotBarChart {
                height: 150px;
            }
            #cellPaiChart{
                height: 160px;
            }

        </style>
    </head>

    <body>
                    <!-- Left Panel -->
                    <aside id="left-panel" class="left-panel">
                        <nav class="navbar navbar-expand-sm navbar-default">
                            <div id="main-menu" class="main-menu collapse navbar-collapse">
                                <ul class="nav navbar-nav">
                                    <li class="active">
                                        <a href="HomeServlet"><i class="menu-icon fa fa-laptop"></i>Dashboard </a>
                                    </li>

                                    <li class="menu-title">Data</li><!-- /.menu-title -->

                                    <li class="menu-item-has-children dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Activities</a>
                                        <ul class="sub-menu children dropdown-menu">
                                            <li><i class="menu-icon fa fa-line-chart"></i><a href="LancerActiviteServlet">Course</a></li>
                                        </ul>
                                    </li>

                                    <li class="menu-item-has-children dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>Details</a>
                                        <ul class="sub-menu children dropdown-menu">
                                            <li><i class="menu-icon fa fa-map-o"></i><a href="DetailActiviteServlet"> Maps</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </nav>
                    </aside>
                    <!-- /#left-panel -->
                    <!-- Right Panel -->
                    <div id="right-panel" class="right-panel">
                        <!-- Header-->
                        <header id="header" class="header">
                            <div class="top-left">
                                <div class="navbar-header">
                                    <a class="navbar-brand" href="HomeServlet"><img src="images/logo.png"@ alt="Logo"></a>
                                    <a class="navbar-brand hidden" href="./"><img src="images/logo_small_icon_only_inverted.png"@ alt="Logo"></a>
                                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                                </div>
                            </div>
                            <div class="top-right">
                                <div class="header-menu">
                                    <div class="user-area dropdown float-right">
                                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <img class="user-avatar rounded-circle" src="images/admin.jpg" alt="User Avatar">
                                        </a>

                                        <div class="user-menu dropdown-menu">
                                            <a class="nav-link" href="LogoutServlet"><i class="fa fa-power -off"></i>Logout</a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </header>
            <div class="content">
               
                <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAEhbPTWelYOCQcpiTg9-BTbd_ynw3a3FY&sensor=false&callback=map_init"></script>
                    <script type="text/javascript">
                        function InitializeMap() {
                            var ltlng = [];
                            <%
                            List<JSONObject> attribut = (List<JSONObject>)request.getAttribute("positions"); 
                                for( JSONObject att : attribut   )
                                    {              
                            %>
                           
                            <%=att.getString("Latitude")%>  
                            <%=att.getString("Longitude")%>  
                            ltlng.push(new google.maps.LatLng(<%=att.getString("Latitude")%>  , <%=att.getString("Longitude")%>));
                            <%  
                                    }      
                            %>
                            
                            //ltlng.push(new google.maps.LatLng(34.056821813274674, -117.19573651940273));
                            //ltlng.push(new google.maps.LatLng(12.24, 70.16));

                            // var latlng = new google.maps.LatLng(-34.397, 150.644);
                            var myOptions = {
                                zoom: 20,
                                //center: latlng,
                                center: ltlng[0],
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            };
                            var map = new google.maps.Map(document.getElementById("map"), myOptions);

                            for (var i = 0; i < ltlng.length; i++) {
                                var marker = new google.maps.Marker
                                    (
                                    {
                                        // position: new google.maps.LatLng(-34.397, 150.644),
                                        position: ltlng[i],
                                        map: map,
                                        title: 'Click me'
                                    }
                                    );
                            }
                            //***********ROUTING****************//

                            //Intialize the Path Array
                            var path = new google.maps.MVCArray();

                            //Intialize the Direction Service
                            var service = new google.maps.DirectionsService();

                            //Set the Path Stroke Color
                            var poly = new google.maps.Polyline({ map: map, strokeColor: '#4986E7' });
                            //Loop and Draw Path Route between the Points on MAP
                            for (var i = 0; i < ltlng.length; i++)
                            {
                                if ((i + 1) < ltlng.length) {
                                    var src = ltlng[i];
                                    var des = ltlng[i + 1];
                                    path.push(src);
                                    poly.setPath(path);
                                    service.route({
                                        origin: src,
                                        destination: des,
                                        travelMode: google.maps.DirectionsTravelMode.DRIVING
                                    }, function (result, status) {
                                        if (status == google.maps.DirectionsStatus.OK) {
                                            for (var i = 0, len = result.routes[0].overview_path.length; i < len; i++) {
                                                path.push(result.routes[0].overview_path[i]);
                                            }
                                        }
                                    });
                                }
                            }

                        }

                        window.onload = InitializeMap;
                    </script>
                        <h2>Detail Activite</h2>
                        <div id="map" style="width: 800px; top: 68px; left: 172px; position: absolute; height: 500px">
                        </div>
            </div>
        </body>
         <div class="clearfix"></div>
        <!-- Footer -->
        <footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright &copy; 2021 Your Running App
                    </div>
                </div>
            </div>
        </footer>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="assets/js/main.js"></script>

<!--  Chart js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

<!--Chartist Chart-->
<script src="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartist-plugin-legend@0.6.2/chartist-plugin-legend.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/simpleweather@3.1.0/jquery.simpleWeather.min.js"></script>
<script src="assets/js/init/weather-init.js"></script>

<script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
<script src="assets/js/init/fullcalendar-init.js"></script>
