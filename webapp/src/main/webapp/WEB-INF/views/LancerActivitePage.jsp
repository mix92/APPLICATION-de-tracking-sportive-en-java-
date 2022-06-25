<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<title>Chronomètre</title>
	<meta charset="utf-8">
	 <link rel="stylesheet" href="https://js.arcgis.com/4.19/esri/themes/light/main.css" />
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	   
	
	<style type="text/css">
      .chronometre{
        margin: auto ;
        width: 300px;
        text-align: center;
        
      }

      .tim{
      	margin: auto;
      	width: 300px;
      	border: 1px solid rgba(0,0,0,0.5);
      	padding:5px 0;
      	text-align: center;
      	font-size: 1.5em;
      	font-family: digital;
      	margin-bottom: 10px;


      }
     
      button{
        background: #3498db;
        color: #fff;
        width: 70px;
        border-radius: 5px;
        line-height: 1.5em;
        border: none
      }
      
      html,
      body,
      #viewDiv {
        padding: 0;
        margin: 0;
        height: 100%;
        }

    </style>
</head>
<body>
  <div class="top-left">
     <a href="HomeServlet"><i class="fa fa-chevron-left"></i></a>
  </div>

<div class="chronometre">
<label for="exampleFormControlSelect1">sport pratiqué</label> 
			<select name="sport_list" id="sport_list">
					<option>jogging</option>
					<option>ski</option>
					<option>velo</option>
          <option>car</option>
				</select>
  <div class="tim">
  	<span >0 h</span> :
  	<span >0 min</span> :
  	<span >0 s</span> :
  	<span >0 ms</span>

  </div>
  <button id="start" onclick="start()">Start</button>
  <button id="stop" onclick="stop()" >Stop</button>
  <button id="reset" onclick="reset()" >Reset</button>
  <button id="arret" onclick="arret()" >Arret</button>
</div>
<div id="viewDiv"></div>

  
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
  var dojoConfig = {
	        packages: [
	          {
	            name: "geolocate",
	            location: "//2gis.github.io/mock-geolocation/dist",
	            main: "geolocate"
	          }
	        ]
	      };
  </script>
  <script src="https://js.arcgis.com/4.19/"></script>
  <script>
  
  //coordonnée de depart
  var sp = document.getElementsByTagName("span");
  var btn_start=document.getElementById("start");
  var btn_stop=document.getElementById("stop");
  var btn_arret=document.getElementById("arret");
  var sport=document.getElementById("sport_list");
  var t;
  var ms=0,s=0,mn=0,h=0;
  var datedebut = null, datefin = null;
  var coords = [
      {
    	  lng: -117.19565880345007,
          lat: 34.05682230352545
      },
  ];
  var iteneraire = [
      {
    	  lng: -117.19565880345007,
          lat: 34.05682230352545
      },
  ];
   var  initialisateur = 1;
 
 
  require([
        "geolocate", // geolocation simulator (https://github.com/2gis/mock-geolocation)
        "esri/widgets/Track",
        "esri/views/SceneView",
        "esri/Map"
      ], function(geolocate, Track, SceneView, Map) {
        // geolocation simulator
        stubGeolocation();

        var map = new Map({
          basemap: "topo-vector"
        });

        var view = new SceneView({
          map: map,
          container: "viewDiv",
          center: [-117.187038, 34.057322],
          zoom: 18,
          ui: {
            components: ["attribution"] // replace default set of UI components
          }
        });

        var track = new Track({
          view: view,
          goToLocationEnabled: false // disable this since we want to control what happens after our location is acquired
        });
        view.ui.add(track, "top-left");

        view.when(function() {
          var prevLocation = view.center;

          track.on("track", function() {
            var location = track.graphic.geometry;

            view.goTo({
              center: location,
              tilt: 50,
              scale: 2500,
              heading: 360 - getHeading(location, prevLocation),  // only applies to SceneView
              rotation: 360 - getHeading(location, prevLocation) // only applies to MapView
            }).catch(function(error){
              if (error.name != "AbortError"){
                console.error(error);
              }
            });

            prevLocation = location.clone();
          });

          track.start();
        });

        function getHeading(point, oldPoint) {
          // get angle between two points
          var angleInDegrees = (Math.atan2(point.y - oldPoint.y, point.x - oldPoint.x) * 180) / Math.PI;

          // move heading north
          return -90 + angleInDegrees;
        }

        // geolocation simulator
        function stubGeolocation() {
            coords ,
            currentCoordIndex = 0;

          geolocate.use();

          setInterval(function() {
            geolocate.change(coords[currentCoordIndex]);
            currentCoordIndex = (currentCoordIndex + 1) % coords.length;
          }, 1500);
        }
      });
  
  
  /*La fonction update_chrono incrémente le nombre de millisecondes par 1 <==> 1*cadence = 100 */
  function update_chrono(){
    ms+=1;
    /*si ms=10 <==> ms*cadence = 1000ms <==> 1s alors on incrémente le nombre de secondes*/
       if(ms==10){
        ms=1;
        s+=1;
       }
       /*on teste si s=60 pour incrémenter le nombre de minute*/
       if(s==60){
        s=0;
        mn+=1;
       }
       if(mn==60){
        mn=0;
        h+=1;
       }
       /*afficher les nouvelle valeurs*/
       sp[0].innerHTML=h+" h";
       sp[1].innerHTML=mn+" min";
       sp[2].innerHTML=s+" s";
       sp[3].innerHTML=ms+" ms";

  }
  
  
  function start(){
	   t =setInterval(update_chrono,100);
	   btn_start.disabled=true;
	   if(initialisateur <= 1){
		   const timeElapsed = Date.now();
		   const today = new Date(timeElapsed);
		   datedebut = (today).toISOString();
		   console.log("datedebut",datedebut)
	   }
	   console.log("initialisateur  "+initialisateur)
	   this.demo(initialisateur); 
   }
  
  	function arret(){
	  clearInterval(t);
	   btn_arret.disabled=true;
	   const timeElapsed = Date.now();
	   const today = new Date(timeElapsed);
	 
	   datefin =  (today).toISOString();
	   console.log("datefin",datedebut)
	   
	   nbrminutes=  h*60+mn*60+s;

	   
	   $.ajax({
	          method: "POST",
	          url: "/webapp/LancerActiviteServlet",
	          dataType:'json',
	          data: { datedebut: datedebut,datefin: datefin, nbrminutes:nbrminutes, iteneraire:JSON.stringify(iteneraire), sport: sport.value }
	        })
	        .done(function(data) {
	          
	        })
	        .always(function( data ) {
	          $(".overlay").removeClass('is-visible');
	        });
	  }
  
  
	/*on arrête le "timer" par clearInterval ,on réactive le bouton start */
	function stop(){
    clearInterval(t);
    btn_start.disabled=false;
    initialisateur = coords.length
    console.log("la taille a laquelle le tableau s'arrete",coords.length)
    console.log("point d'arret ",iteneraire[initialisateur-1])
    coords =[]
    // push du point dans coords pour l'arret sur l'interface
    coords.push(iteneraire[initialisateur-1])
    console.log(" point d'arret sur coords ", coords)

    
		
	}
  /*dans cette fonction on arrête le "timer" ,on réactive le bouton "start" et on initialise les variables à zéro */
  function reset(){
   clearInterval(t);
    btn_start.disabled=false;
    ms=0,s=0,mn=0,h=0;
    /*on accède aux différents span par leurs indice*/
    sp[0].innerHTML=h+" h";
    sp[1].innerHTML=mn+" min";
    sp[2].innerHTML=s+" s";
    sp[3].innerHTML=ms+" ms";
    
    // remise du courreur au point actuel 
    initialisateur = iteneraire.length
    console.log("la taille a laquelle le tableau s'arrete",iteneraire.length)
    console.log("point d'arret ",iteneraire[initialisateur-1])
    coords =[]
    // push du point dans coords pour l'arret sur l'interface
    coords.push(iteneraire[initialisateur-1])
    console.log(" point d'arret sur coords ", coords)
    
    iteneraire = []
    iteneraire.push(coords[0])
    
   }
  
  
  

  
  function sleep(ms) {
	  return new Promise(resolve => setTimeout(resolve, ms));
	}
  
  async function demo(i) {
	  var test = [
		  {
			  lat: 34.05648363780692,
                lng: -117.19565501782613
              },
              {
                lng: -117.19565880345007,
                lat: 34.05682230352545
              },
              {
                lng: -117.19566258907402,
                lat: 34.05716096924398
              },
              {
                lng: -117.19566637469796,
                lat: 34.05749963496251
              },
              {
                lng: -117.19567016032191,
                lat: 34.05783830068104
              },
              {
                lng: -117.19567394594586,
                lat: 34.05817696639957
              },
              {
                lng: -117.1956777315698,
                lat: 34.0585156321181
              },
              {
                lng: -117.19568151719375,
                lat: 34.05885429783663
              },
              {
                lng: -117.1956853028177,
                lat: 34.05919296355516
              },
              {
                lat: 34.059192963555134,
                lng: -117.19568530281771
              },
              {
                lat: 34.05920092649827,
                lng: -117.19575894615099
              },
              {
                lng: -117.19575574232981,
                lat: 34.058861053180614
              },
              {
                lng: -117.19575253850863,
                lat: 34.05852117986296
              },
              {
                lng: -117.19574933468745,
                lat: 34.0581813065453
              },
              {
                lng: -117.19574613086627,
                lat: 34.057841433227644
              },
              {
                lng: -117.19574292704509,
                lat: 34.05750155990999
              },
              {
                lng: -117.19573972322391,
                lat: 34.05716168659233
              },
              {
                lng: -117.19573651940273,
                lat: 34.056821813274674
              },
              {
                lng: -117.19573331558155,
                lat: 34.05648193995702
              },
	  
	  ]

	  // Sleep in loop
	  for(i ;i<=test.length;i++){
			
		  await sleep(2000);
		  if(i == test.length){
			  i= 1;
			  initialisateur =1;
			  console.log("remise a zero du compteur")
		  }
		  
		  if(btn_start.disabled == false	){
			  console.log("la boucle s'arrete ici "+i,"taille du tableau "+test.length)
			  break;
		  }
		  else{
			  console.log(i,initialisateur,test.length)
			  coords.push(test[i]); 
			  iteneraire.push(test[i]);	 
			  console.log("coords",coords)
			  console.log("iteneraire",iteneraire)
			  
		  }
	  }
 
	  console.log("les points faites par le courreur",iteneraire)
	
	}
  
 
  
</script>
