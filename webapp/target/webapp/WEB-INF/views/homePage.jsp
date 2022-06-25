<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="org.bson.BSONObject"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<!doctype html>

<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
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
        <!-- /#header -->
        <!-- Content -->
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
                <!-- Widgets  -->
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-five">
                                    <div class="stat-icon dib flat-color-1">
                                        <i class="pe-7s-gym"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="text-left dib">
                                            <div class="stat-text"><span class="count"><%= nb1 %></span></div>
                                            <div class="stat-heading">Jogging</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-five">
                                    <div class="stat-icon dib flat-color-2">
                                        <i class="pe-7s-bicycle"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="text-left dib">
                                            <div class="stat-text"><span class="count"><%= nb2 %></span></div>
                                            <div class="stat-heading">Vélo</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-five">
                                    <div class="stat-icon dib flat-color-3">
                                        <i class="pe-7s-medal"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="text-left dib">
                                            <div class="stat-text"><span class="count"><%= nb2 %></span></div>
                                            <div class="stat-heading">Ski</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-five">
                                    <div class="stat-icon dib flat-color-4">
                                        <i class="pe-7s-car"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="text-left dib">
                                            <div class="stat-text"><span class="count"><%= nb4 %></span></div>
                                            <div class="stat-heading">Car</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Widgets -->
                <!--  Traffic  -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="box-title">Stastiques </h4>
                            </div>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="card-body">
                                        <!-- <canvas id="TrafficChart"></canvas>   -->
                                        <div id="traffic-chart" class="traffic-chart"></div>
                                    </div>
                                </div>
                                <% total = nb1+nb2+nb3+nb4; 
                                    if(total!=0){
                                        nb1p= nb1*100/total;
                                        nb2p= nb2*100/total;
                                        nb3p= nb3*100/total;
                                        nb4p= nb4*100/total;

                                    }
                                
                                %>
                                <div class="col-lg-4">
                                    <div class="card-body">
                                        <div class="progress-box progress-1">
                                            <h4 class="por-title">Jogging</h4>
                                            <div class="por-txt"><%= nb1p %>%</div>
                                            <div class="progress mb-2" style="height: 5px;">
                                                <div class="progress-bar bg-flat-color-1" role="progressbar" style="width:<%= nb1p %>%;"  aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div class="progress-box progress-2">
                                            <h4 class="por-title">Vélo</h4>
                                            <div class="por-txt"> <%= nb2p %>%</div>
                                            <div class="progress mb-2" style="height: 5px;">
                                                <div class="progress-bar bg-flat-color-2" role="progressbar" style="width: <%= nb2p %>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div class="progress-box progress-3">
                                            <h4 class="por-title">Ski</h4>
                                            <div class="por-txt"><%= nb3p %>%</div>
                                            <div class="progress mb-2" style="height: 5px;">
                                                <div class="progress-bar bg-flat-color-3" role="progressbar" style="width: <%= nb3p %>%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div class="progress-box progress-4">
                                            <h4 class="por-title">Car</h4>
                                            <div class="por-txt"><%= nb4p %>%</div>
                                            <div class="progress mb-2" style="height: 5px;">
                                                <div class="progress-bar bg-flat-color-4" role="progressbar" style="width: <%= nb4p %>%;" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div> <!-- /.card-body -->
                                </div>
                            </div> <!-- /.row -->
                            <div class="card-body"></div>
                        </div>
                    </div><!-- /# column -->
                </div>
                <!--  /Traffic -->
                <div class="clearfix"></div>
                <!-- Orders -->
                <div class="orders">
                    <div class="row">
                        <div class="col-xl-8">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="box-title">List Data </h4>
                                </div>
                                <div class="card-body--">
                                    <div class="table-stats order-table ov-h">
                                        <table class="table ">
                                            <thead>
                                                <tr>
                                                    <th>Activity</th>
                                                    <th>Date Started</th>
                                                    <th>Date Arrived</th>
                                                    <th>Time</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                    <%! String categorie1="jogging"; %>
                                                    <%! String categorie2="ski"; %>
                                                    <%! String categorie3="velo"; %>
                                                    <%! String categorie4="car"; %>
                                                    <%! String categorie=" "; %>
                                                    <%! String jour=" "; %>
                                                    <%! int nb1=0; %>
                                                    <%! int nb2=0; %>
                                                    <%! int nb3=0; %>
                                                    <%! int nb4=0; %>
                                                    <%! String jour1="Mon"; %>
                                                    <%! String jour2="Tue"; %>
                                                    <%! String jour3="Wed"; %>
                                                    <%! String jour4="thu"; %>
                                                    <%! String jour5="Fri"; %>
                                                    <%! String jour6="Sat"; %>
                                                    <%! String jour7="Sun"; %>
                                                    <%! int j1=0; %>
                                                    <%! int j2=0; %>
                                                    <%! int j3=0; %>
                                                    <%! int j4=0; %>
                                                    <%! int j5=0; %>
                                                    <%! int j6=0; %>
                                                    <%! int j7=0; %>
                                                    <%! int j8=0; %>
                                                    <%! int j9=0; %>
                                                    <%! int j10=0; %>
                                                    <%! int j11=0; %>
                                                    <%! int j12=0; %>
                                                    <%! int j13=0; %>
                                                    <%! int j14=0; %>
                                                    <%! int j15=0; %>
                                                    <%! int j16=0; %>
                                                    <%! int j17=0; %>
                                                    <%! int j18=0; %>
                                                    <%! int j19=0; %>
                                                    <%! int j20=0; %>
                                                    <%! int j21=0; %>
                                                    <%! int j22=0; %>
                                                    <%! int j23=0; %>
                                                    <%! int j24=0; %>
                                                    <%! int j25=0; %>
                                                    <%! int j26=0; %>
                                                    <%! int j27=0; %>
                                                    <%! int j28=0; %>
                                                    <%! int total=0; %>
                                                    <%! float nb1p=0; %>
                                                    <%! float nb2p=0; %>
                                                    <%! float nb3p=0; %>
                                                    <%! float nb4p=0; %>


													<%

														List<DBObject> attribut = (List<DBObject>)request.getAttribute("activites"); 
                                                            
                                                            nb1=0;
                                                            nb2=0;
                                                            nb3=0;
                                                            nb4=0;
                                                            j1=0;
                                                            j2=0;
                                                            j3=0;
                                                            j4=0;
                                                            j5=0;
                                                            j6=0;
                                                            j7=0;
                                                            j8=0;
                                                            j9=0;
                                                            j10=0;
                                                            j11=0;
                                                            j12=0;
                                                            j13=0;
                                                            j14=0;
                                                            j15=0;
                                                            j16=0;
                                                            j17=0;
                                                            j18=0;
                                                            j19=0;
                                                            j20=0;
                                                            j21=0;
                                                            j22=0;
                                                            j23=0;
                                                            j24=0;
                                                            j25=0;
                                                            j26=0;
                                                            j27=0;
                                                            j28=0;
            
                                                            
															for( DBObject att : attribut   )
															{
                                                              categorie= (String) att.get("nomactivite");
                                                              java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat( "EE" );
                                                              jour= formater.format(att.get("datedebut"));
                                                              
                                                              if(categorie.equals(categorie1) && jour.equals(jour1)){
                                                                j1++;
                                                              }else if(categorie.equals(categorie1) && jour.equals(jour2)){
                                                                j2++;
                                                              }else if(categorie.equals(categorie1) && jour.equals(jour3)){
                                                                j3++;
                                                              }else if(categorie.equals(categorie1) && jour.equals(jour4)){
                                                                j4++;
                                                              }else if(categorie.equals(categorie1) && jour.equals(jour5)){
                                                                j5++;
                                                              }else if(categorie.equals(categorie1) && jour.equals(jour6)){
                                                                j6++;
                                                              }else if(categorie.equals(categorie1) && jour.equals(jour7)){
                                                                j7++;
                                                              }

                                                              if(categorie.equals(categorie2) && jour.equals(jour1)){
                                                                j8++;
                                                              }else if(categorie.equals(categorie2) && jour.equals(jour2)){
                                                                j9++;
                                                              }else if(categorie.equals(categorie2) && jour.equals(jour3)){
                                                                j10++;
                                                              }else if(categorie.equals(categorie2) && jour.equals(jour4)){
                                                                j11++;
                                                              }else if(categorie.equals(categorie2) && jour.equals(jour5)){
                                                                j12++;
                                                              }else if(categorie.equals(categorie2) && jour.equals(jour6)){
                                                                j13++;
                                                              }else if(categorie.equals(categorie2) && jour.equals(jour7)){
                                                                j14++;
                                                              }

                                                              if(categorie.equals(categorie3) && jour.equals(jour1)){
                                                                j15++;
                                                              }else if(categorie.equals(categorie3) && jour.equals(jour2)){
                                                                j16++;
                                                              }else if(categorie.equals(categorie3) && jour.equals(jour3)){
                                                                j17++;
                                                              }else if(categorie.equals(categorie3) && jour.equals(jour4)){
                                                                j18++;
                                                              }else if(categorie.equals(categorie3) && jour.equals(jour5)){
                                                                j19++;
                                                              }else if(categorie.equals(categorie3) && jour.equals(jour6)){
                                                                j20++;
                                                              }else if(categorie.equals(categorie3) && jour.equals(jour7)){
                                                                j21++;
                                                              }

                                                              if(categorie.equals(categorie4) && jour.equals(jour1)){
                                                                j22++;
                                                              }else if(categorie.equals(categorie4) && jour.equals(jour2)){
                                                                j23++;
                                                              }else if(categorie.equals(categorie4) && jour.equals(jour3)){
                                                                j24++;
                                                              }else if(categorie.equals(categorie4) && jour.equals(jour4)){
                                                                j25++;
                                                              }else if(categorie.equals(categorie4) && jour.equals(jour5)){
                                                                j26++;
                                                              }else if(categorie.equals(categorie4) && jour.equals(jour6)){
                                                                j27++;
                                                              }else if(categorie.equals(categorie4) && jour.equals(jour7)){
                                                                j28++;
                                                              }

                                                              if(categorie.equals(categorie1)){ 
                                                                    nb1++;
                                                               }else if(categorie.equals(categorie2)){ 
                                                                    nb2++;
                                                               }else if(categorie.equals(categorie3)){ 
                                                                    nb3++;
                                                               }else if(categorie.equals(categorie4)){ 
                                                                    nb4++;
                                                               }
														%>
														<tr>
														<td>  <span class="name"><%=att.get("nomactivite")%></span></td>
														<td> <span class="name"><%=att.get("datedebut")%></span> </td>
														<td><span class="name"><%=att.get("datefin")%></span></td>
														<td><span class="name"><%=att.get("nbrminutes")%></span></td>

														<td>
                                                        	<span class="badge badge-danger"><a href='DeleteActiviteServlet?id=<%=att.get("_id")%>'>delete</a></span>
                                                    	</td>
														<td>
                                                        	<span class="badge badge-success"><a href='DetailActiviteServlet?id=<%=att.get("_id")%>'>View</a></span>
                                                            <!--<span class="badge badge-success"><a href="DetailActiviteServlet?id=<%=att.get("_id")%></a>">View</a></span>-->
                                                   		 </td>
														</tr>
														<%  
															}      
														%>

                                            </tbody>
                                        </table>
                                    </div> <!-- /.table-stats -->
                                </div>
                            </div> <!-- /.card -->
                        </div>  <!-- /.col-lg-8 -->

                        <div class="col-xl-4">
                            <div class="row">
                                
                                <div class="col-lg-6 col-xl-12">
                                    <div class="card bg-flat-color-3  ">
                                        <div class="card-body">
                                            <h4 class="card-title m-0  white-color ">June 2021</h4>
                                        </div>
                                         <div class="card-body">
                                             <div id="flotLine5" class="flot-line"></div>
                                         </div>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- /.col-md-4 -->
                    </div>
                </div>
                <!-- /.orders -->
                <!-- Calender Chart Weather  -->
                <div class="row">
                    <div class="col-md-12 col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <!-- <h4 class="box-title">Chandler</h4> -->
                                <div class="calender-cont widget-calender">
                                    <div id="calendar"></div>
                                </div>
                            </div>
                        </div><!-- /.card -->
                    </div>

                    <div class="col-lg-4 col-md-6">
                        <div class="card weather-box">
                            <h4 class="weather-title box-title">Météo</h4>
                            <div class="card-body">
                                <div class="weather-widget">
                                    <div id="weather-one" class="weather-one"></div>
                                </div>
                            </div>
                        </div><!-- /.card -->
                    </div>
                </div>
                <!-- /Calender Chart Weather -->
                <!-- Modal - Calendar - Add New Event -->
                <div class="modal fade none-border" id="event-modal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"><strong>Add New Event</strong></h4>
                            </div>
                            <div class="modal-body"></div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
                                <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /#event-modal -->
                <!-- Modal - Calendar - Add Category -->
                <div class="modal fade none-border" id="add-category">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"><strong>Add a category </strong></h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Category Name</label>
                                            <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name"/>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Choose Category Color</label>
                                            <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                                <option value="success">Success</option>
                                                <option value="danger">Danger</option>
                                                <option value="info">Info</option>
                                                <option value="pink">Pink</option>
                                                <option value="primary">Primary</option>
                                                <option value="warning">Warning</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- /#add-category -->
            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
        <footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright &copy; Make By Armand Tsameza & Omar Tieno Diallo 
                    </div>
                </div>
            </div>
        </footer>
        <!-- /.site-footer -->
    </div>
    <!-- /#right-panel -->

    <!-- Scripts -->
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

    <!--Local Stuff-->
    <script>
        jQuery(document).ready(function($) {
            "use strict";

            // Line Chart  #flotLine5
            var newCust = [[0, 3], [1, 5], [2,4], [3, 7], [4, 9], [5, 3], [6, 6], [7, 4], [8, 10]];

            var plot = $.plot($('#flotLine5'),[{
                data: newCust,
                label: 'New Data Flow',
                color: '#fff'
            }],
            {
                series: {
                    lines: {
                        show: true,
                        lineColor: '#fff',
                        lineWidth: 2
                    },
                    points: {
                        show: true,
                        fill: true,
                        fillColor: "#ffffff",
                        symbol: "circle",
                        radius: 3
                    },
                    shadowSize: 0
                },
                points: {
                    show: true,
                },
                legend: {
                    show: false
                },
                grid: {
                    show: false
                }
            });
            // Line Chart  #flotLine5 End
            // Traffic Chart using chartist
            if ($('#traffic-chart').length) {
                var chart = new Chartist.Line('#traffic-chart', {
                  labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                  series: [
                  [<%=j1 %>, <%=j2 %>, <%=j3 %>,  <%=j4 %>,  <%=j5 %>,  <%=j6 %>, <%=j7 %>],
                  [<%=j8 %>, <%=j9 %>, <%=j10 %>,  <%=j11 %>,  <%=j12 %>,  <%=j13 %>, <%=j14 %>],
                  [<%=j15 %>, <%=j16 %>, <%=j17 %>,  <%=j18 %>,  <%=j19 %>,  <%=j20 %>, <%=j21 %>],
                  [<%=j22 %>, <%=j23 %>, <%=j24 %>,  <%=j25 %>,  <%=j26 %>,  <%=j27 %>, <%=j28 %>]
                  ]
              }, {
                  low: 0,
                  showArea: true,
                  showLine: false,
                  showPoint: false,
                  fullWidth: true,
                  axisX: {
                    showGrid: true
                }
            });

                chart.on('draw', function(data) {
                    if(data.type === 'line' || data.type === 'area') {
                        data.element.animate({
                            d: {
                                begin: 2000 * data.index,
                                dur: 2000,
                                from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
                                to: data.path.clone().stringify(),
                                easing: Chartist.Svg.Easing.easeOutQuint
                            }
                        });
                    }
                });
            }
            // Traffic Chart using chartist End
            //Traffic chart chart-js
            //Traffic chart chart-js  End
            
        });
    </script>
</body>
</html>

